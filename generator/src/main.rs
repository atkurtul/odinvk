#![allow(warnings)]
#![feature(or_patterns)]
use inflector::Inflector;
use rustc_hash::FxHashMap;
use rustc_hash::FxHashSet;
use std::{fs::write, iter::Iterator};
use urc::Ptr;
use xml::attribute::*;
use xml::reader::{EventReader, XmlEvent};
type Map<K, V> = FxHashMap<K, V>;
type Set<K> = FxHashSet<K>;
use regex::Regex;

use c_expr::*;

#[derive(Default, Eq, PartialEq)]
pub struct Xnode {
    tag: String,
    parent: Option<Ptr<Xnode>>,
    attr: Map<String, String>,
    down: Vec<Xchild>,
}

#[derive(Eq, PartialEq)]
pub enum Xchild {
    Node(Ptr<Xnode>),
    Str(String),
}

impl Xchild {
    pub fn as_node(self) -> Ptr<Xnode> {
        match self {
            Self::Node(n) => n,
            _ => unreachable!(),
        }
    }
    pub fn get_node(&self) -> Option<Ptr<Xnode>> {
        match self {
            Self::Node(n) => Some(n.clone()),
            _ => None,
        }
    }
    pub fn get_str(&self) -> Option<String> {
        match self {
            Self::Str(s) => Some(s.clone()),
            _ => None,
        }
    }
}

impl Xnode {
    pub fn show_self(&self, d: &str) {
        println!("{}{}", d, self.tag);
        for (k, v) in self.attr.iter() {
            println!("{}\t[{} = {}]", d, k, v);
        }
    }

    pub fn show(&self, d: String) {
        self.show_self(&d);
        for c in self.down.iter() {
            match c {
                Xchild::Node(c) => c.show(format!("{}\t", d)),
                Xchild::Str(s) => {
                    println!("{}\t\"{}\"", d, s);
                }
            }
        }
    }

    pub fn get_child_mby(&self, s: &str) -> Option<Ptr<Xnode>> {
        self.down
            .iter()
            .filter_map(|c| c.get_node())
            .find(|c| c.tag == s)
    }

    pub fn get_child(&self, s: &str) -> Ptr<Xnode> {
        self.down
            .iter()
            .filter_map(|c| c.get_node())
            .find(|c| c.tag == s)
            .unwrap()
    }

    pub fn get_child_str(&self, s: &str) -> String {
        self.get_child(s).get_str1()
    }

    pub fn get_children(&self, s: &str) -> Vec<Ptr<Xnode>> {
        self.down
            .iter()
            .filter_map(|c| c.get_node())
            .filter(|c| c.tag == s)
            .collect()
    }

    pub fn get_str1(&self) -> String {
        self.get_str().join("")
    }

    pub fn get_str(&self) -> Vec<String> {
        self.down.iter().filter_map(|c| c.get_str()).collect()
    }

    pub fn new(file: &str) -> Ptr<Xnode> {
        let mut curr = Ptr::<Xnode>::default();

        for e in EventReader::new(std::fs::File::open(file).unwrap()) {
            match e.unwrap() {
                XmlEvent::StartElement {
                    name, attributes, ..
                } => {
                    let node = Ptr::new(Xnode {
                        parent: Some(curr.clone()),
                        tag: name.local_name,
                        attr: attributes
                            .into_iter()
                            .map(|a| (a.name.local_name, a.value))
                            .collect(),
                        down: vec![],
                    });
                    curr.clone().down.push(Xchild::Node(node.clone()));
                    curr = node;
                }
                XmlEvent::EndElement { name } => {
                    curr = curr.parent.clone().unwrap();
                }
                XmlEvent::Characters(s) => {
                    curr.down.push(Xchild::Str(s.trim().to_owned()));
                }
                _ => (),
            }
        }

        let mut curr = curr.down.remove(0).as_node();
        curr.parent = None;
        curr
    }
}

#[derive(Default, Debug, Eq, PartialEq)]
struct Enum {
    name: String,
    bitmask: bool,
    members: Map<String, Enumerant>,
}

#[derive(Debug, Clone, Eq, PartialEq, Hash)]
enum Enumerant {
    Bitpos(u32),
    Value(i64),
    Alias(String),
    Offset(i32, u32),
}

impl Enumerant {
    pub fn value(&self) -> Result<i64, String> {
        match self {
            Self::Offset(offset, ext) => Ok(1000000000 + (*ext - 1) as i64 * 1000 + *offset as i64),
            Self::Bitpos(b) => Ok(1i64 << *b as i64),
            Self::Value(v) => Ok(*v),
            Self::Alias(a) => Err(a.clone()),
        }
    }
}

impl Enum {
    pub fn new(x: Ptr<Xnode>) -> Enum {
        Enum {
            name: x.attr["name"].clone(),
            bitmask: x.attr["type"] == "bitmask",
            members: x
                .get_children("enum")
                .into_iter()
                .map(|e| (e.attr["name"].clone(), Enumerant::new(&e.attr, None)))
                .collect(),
        }
    }
    pub fn extend(&mut self, x: &Map<String, String>, ext: Option<u32>) {
        self.members
            .insert(x["name"].clone(), Enumerant::new(x, ext));
    }
}

fn parse_value(val: &str) -> i64 {
    if val.starts_with("0x") {
        i64::from_str_radix(&val[2..], 16)
    } else {
        val.parse()
    }
    .unwrap()
}

impl Enumerant {
    pub fn new(x: &Map<String, String>, ext: Option<u32>) -> Enumerant {
        x.get("bitpos")
            .map(|v| Enumerant::Bitpos(v.parse().unwrap()))
            .or_else(|| x.get("value").map(|v| Enumerant::Value(parse_value(v))))
            .or_else(|| x.get("alias").map(|v| Enumerant::Alias(v.clone())))
            .or_else(|| {
                x.get("offset").map(|v| {
                    Enumerant::Offset(
                        v.parse().unwrap(),
                        ext.unwrap_or_else(|| x["extnumber"].parse().unwrap()),
                    )
                })
            })
            .unwrap()
    }
}

fn trim_name(s: &str) -> &str {
    if s.starts_with("Vk") {
        &s[2..]
    } else {
        s
    }
}

fn main() {
    let reg = Xnode::new("vk.xml");

    let mut consts = Map::default();
    let mut ens = Map::default();
    let mut sts = Map::default();
    let mut cmds = Map::default();
    let mut handles = Map::default();
    let mut tydefs: Map<String, Vec<_>> = Map::default();
    tydefs.insert("Flags".to_owned(), vec![]);
    tydefs.insert("uint".to_owned(), vec![]);
    for r in reg.get_children("enums") {
        let name = &r.attr["name"];
        if name == "API Constants" {
            for r in r.get_children("enum") {
                let name = r.attr["name"].clone();
                let val = r
                    .attr
                    .get("value")
                    .unwrap_or_else(|| &r.attr["alias"])
                    .clone();
                consts.insert(name, val);
            }
            continue;
        }
        ens.insert(name.clone(), Enum::new(r));
    }

    for r in reg
        .clone()
        .get_children("feature")
        .into_iter()
        .flat_map(|f| f.get_children("require"))
        .flat_map(|f| f.get_children("enum"))
    {
        if let Some(en) = r.attr.get("extends") {
            ens.get_mut(en).unwrap().extend(&r.attr, None);
        } else {
            for r in r.get_children("enum") {
                let name = r.attr["name"].clone();
                let val = r
                    .attr
                    .get("value")
                    .unwrap_or_else(|| &r.attr["alias"])
                    .clone();
                consts.insert(name, val);
            }
        }
    }

    // "funcpointer",
    // "enum",
    // "define",
    // "include",
    let arr_re = &Regex::new(r"\[(\d+)\]").unwrap();

    for r in reg.clone().get_child("types").get_children("type") {
        if let Some(alias) = r.attr.get("alias") {
            tydefs
                .entry(alias.to_owned())
                .or_default()
                .push(r.attr["name"].to_string());
            continue;
        }

        let category = r.attr.get("category").map(|s| s.as_str());

        match category {
            Some("struct") => {
                let st = Struct::new(r, arr_re);
                sts.insert(st.name.clone(), st);
            }
            Some("union") => {
                let st = Struct::union(r, arr_re);
                sts.insert(st.name.clone(), st);
            }
            Some("handle") => {
                let handle = Handle::new(r);
                handles.insert(handle.name.clone(), handle);
            }
            Some("basetype") => {
                let name = r.get_child_str("name");
                match r.get_child_mby("type") {
                    Some(c) => {
                        tydefs
                            .entry(map_ty(&c.get_str1()).to_owned())
                            .or_default()
                            .push(name);
                    }
                    _ => {
                        tydefs.get_mut("uint").unwrap().push(name);
                    }
                }
            }
            Some("bitmask") => {
              let name = r.get_child_str("name");
              if ens.get(&name.replace("Flags", "FlagBits")).is_none() {
                tydefs
                  .get_mut("Flags")
                  .unwrap()
                  .push(name);
              }
            }

            Some("funcpointer") => {
                //eprintln!("{:?}", r.get_child_str("name"));
            }
            _ => (),
        }
    }

    for r in reg
        .clone()
        .get_child("commands")
        .get_children("command")
        .into_iter()
    {
        if r.attr.get("alias").is_none() {
            let cmd = Command::new(r, arr_re);
            cmds.insert(cmd.proto.name.clone(), cmd);
        }
    }

    for r in reg
        .clone()
        .get_child("extensions")
        .get_children("extension")
    {
        let req = r.get_children("require");
        if r.attr["supported"] == "disabled" {
            for r in req {
                for cmd in r.get_children("command") {
                    cmds.remove(&cmd.attr["name"]);
                }

                for st in r.get_children("type") {
                    sts.remove(&st.attr["name"]);
                }
            }
            continue;
        }

        let number: u32 = r.attr["number"].parse().unwrap();

        for r in req.into_iter().flat_map(|f| f.get_children("enum")) {
            if let Some(en) = r.attr.get("extends") {
                ens.get_mut(en).unwrap().extend(&r.attr, Some(number));
            } else {
                for r in r.get_children("enum") {
                    let name = r.attr["name"].clone();
                    let val = r
                        .attr
                        .get("value")
                        .unwrap_or_else(|| &r.attr["alias"])
                        .clone();
                    consts.insert(name, val);
                }
            }
        }
    }

    // reg.show(String::new());

    // return;

    println!(
        r##"package vk;
import "core:dynlib";
void::rawptr;

make_version::proc(major: u32, minor: u32, patch: u32) -> u32 {{
  return major << 22 | minor << 12 | patch;
}}
PFN_vkInternalAllocationNotification::proc();
PFN_vkInternalFreeNotification::proc();
PFN_vkReallocationFunction::proc();
PFN_vkAllocationFunction::proc();
PFN_vkFreeFunction::proc();
PFN_vkVoidFunction::proc();
PFN_vkDebugReportCallbackEXT::proc();
PFN_vkDebugUtilsMessengerCallbackEXT::proc();
PFN_vkDeviceMemoryReportCallbackEXT::proc();

xcb_visualid_t::u32;
xcb_window_t::u32;
DWORD::u32;
zx_handle_t::u32;
xcb_connection_t::u64;
VisualID::u64;
Window::u64;
GgpStreamDescriptor::u64;
GgpFrameToken::u64;
IDirectFB::u64;
IDirectFBSurface::u64;
HINSTANCE::u64;
HWND::u64;
HMONITOR::u64;
HANDLE::u64;
LPCWSTR::u64;
SECURITY_ATTRIBUTES::void;
RROutput::void;
wl_display::void;
Display::void;
wl_surface::void;
_screen_context::void;
_screen_window::void;
    "##
    );

    let mut inst = vec![];
    let mut dev = vec![];

    println!(
        r##"
lib : dynlib.Library;
load_sym::proc(name: string) -> rawptr {{
  sym, _ := dynlib.symbol_address(lib, name);
  return sym;
}}
init::proc() {{
  when ODIN_OS == "linux" {{
    libname :: "libvulkan.so.1";
  }}
  when ODIN_OS == "windows"  {{
    libname :: "vulkan-1.dll";
  }}
  tmp, _ := dynlib.load_library(libname);
  lib = tmp;
        "##
    );

    let mut loader = String::new();
    for (name, cmd) in cmds.iter() {
        let mut name = cmd.args.get(0).map(|a| a.ty.as_str()).unwrap_or("");

        if cmd.proto.name == "vkGetInstanceProcAddr"
            || cmd.proto.name == "vkCreateInstance"
            || cmd.proto.name == "vkEnumerateDeviceLayerProperties"
        {
            loader.extend(
                format!(
                    r##"  {} = auto_cast load_sym({:?});
"##,
                    &cmd.proto.name[2..].to_snake_case(),
                    cmd.proto.name
                )
                .chars(),
            );
        } else if name == "Instance" || name == "PhysicalDevice"
            || cmd.proto.name == "vkGetDeviceProcAddr"
            || cmd.proto.name == "vkCreateDevice"
        {
            inst.push(format!(
                r##"  {} = auto_cast get_instance_proc_addr(instance, {:?});"##,
                &cmd.proto.name[2..].to_snake_case(),
                cmd.proto.name,
            ))
        } else {
            dev.push(format!(
                r##"  {} = auto_cast get_device_proc_addr(device, {:?});"##,
                &cmd.proto.name[2..].to_snake_case(),
                cmd.proto.name
            ));
        }
    }

    loader.push_str("}\n\nload_instance_functions::proc(instance: Instance){\n");
    loader.extend(inst.join("\n").chars());
    loader.push_str("\n}\n\n");

    loader.push_str("load_device_functions::proc(device: Device){\n");
    loader.extend(dev.join("\n").chars());
    loader.push_str("\n}\n\n");

    println!("{}", loader);

    for (name, cmd) in cmds {
        println!(
            "@(link_name=\"{}\") {}:proc({}) -> {};",
            &name[2..].to_snake_case(),
            &name[2..].to_snake_case(),
            cmd.args
                .iter()
                .map(|a| a.as_str(true))
                .collect::<Vec<_>>()
                .join(", "),
            cmd.proto.ty_as_str(true)
        );
    }

    fn translate_expr(x: Expr) -> String {
        match x {
            Expr::Var(v) => v[3..].to_string(),
            Expr::Num(n, s) => match s {
                Suffix::I => format!("{}", n),
                Suffix::U => format!("u32({})", n),
                Suffix::L => format!("i32({})", n),
                Suffix::LL => format!("i64({})", n),
                Suffix::UL => format!("u32({})", n),
                Suffix::ULL => format!("u64({})", n),
            },
            Expr::Real(n) => format!("f32({})", n),
            Expr::Unary(o, x) => {
                let x = translate_expr(*x);
                match o {
                    Unop::Neg => format!("-({})", x),
                    Unop::Not => format!("!({})", x),
                    Unop::Flip => format!("~({})", x),
                    _ => unreachable!(),
                }
            }
            Expr::Binop(o, l, r) => {
                let l = format!("{}", translate_expr(*l));
                let r = format!("{}", translate_expr(*r));

                match o {
                    Binop::Add => format!("({}) + ({})", l, r),
                    Binop::Sub => format!("({}) - ({})", l, r),
                    Binop::Mul => format!("({}) * ({})", l, r),
                    Binop::Div => format!("({}) / ({})", l, r),
                    Binop::Shl => format!("({}) << ({})", l, r),
                    Binop::Shr => format!("({}) >> ({})", l, r),
                    _ => unreachable!(),
                }
            }
        }
    }

    for (k, v) in consts {
        println!("{}::{};", &k[3..], translate_expr(Expr::new(&v).expect(&v)));
    }

    for (name, st) in sts {
        println!(
            "{}::{} {{\n\t{},\n}}\n",
            &name[2..],
            if st.union {
                "struct #raw_union"
            } else {
                "struct"
            },
            st.fields
                .iter()
                .map(|a| a.as_str(false))
                .collect::<Vec<_>>()
                .join(",\n\t")
        );
    }

    for (name, _) in handles {
        println!(r##"{}::distinct uint;"##, &name[2..]);
    }

    for (k, v) in tydefs {
        for v in v {
            println!("{}::distinct {};", trim_name(&v), trim_name(&k).replace("FlagBits", "Flags"));
        }
    }
    let ext = vec![
        "IMG",
        "AMD",
        "AMDX",
        "ARM",
        "FSL",
        "BRCM",
        "NXP",
        "NV",
        "NVX",
        "VIV",
        "VSI",
        "KDAB",
        "ANDROID",
        "CHROMIUM",
        "FUCHSIA",
        "GGP",
        "GOOGLE",
        "QCOM",
        "LUNARG",
        "SAMSUNG",
        "SEC",
        "TIZEN",
        "RENDERDOC",
        "NN",
        "MVK",
        "KHR",
        "KHX",
        "EXT",
        "MESA",
        "INTEL",
        "HUAWEI",
        "VALVE",
        "QNX",
    ]
    .into_iter()
    .collect::<Vec<_>>();
    for (name, en) in ens {
        let inner = if en.members.is_empty() {
            format!("__")
        } else {
            let mut dupes = vec![];
            let mut vals = en
                .members
                .iter()
                .filter_map(|(n, e)| match e.value() {
                    Ok(i) => Some((n, i)),
                    Err(v) => {
                        dupes.push(format!("pub const {}: {} = {}::{};", n, name, name, v));
                        None
                    }
                })
                .collect::<Vec<_>>();

            if !dupes.is_empty() {
                //println!("impl {} {{ {} }}", name, dupes.join(""));
            }
            vals.sort_by(|l, r| l.1.cmp(&r.1));
            let mut rr = name.as_str();
            for x in ext.iter() {
                if rr.ends_with(x) {
                    rr = &rr[..rr.len() - x.len()];
                    break;
                }
            }
            let rr = rr.replace("FlagBits", "");

            vals.into_iter()
                .map(|(n, i)| {
                    let mut n = n.to_pascal_case().replace(&rr, "");

                    if n.as_bytes()[0].is_ascii_digit() {
                        n = format!("_{}", n)
                    };
                    if en.bitmask {
                      if i <= u32::MAX as i64 {
                        format!("{} = 0x{:X}",  n, i)
                      } else {
                        format!("// {} = 0x{:X}",  n, i)
                      }
  
                    } else {
                      if i < 0 {
                        format!("{} = {}", n, u32::from_ne_bytes((i as i32).to_ne_bytes()))
                      } else {
                        format!("{} = {}", n, i)
                      }
                    }
                })
                .collect::<Vec<_>>()
                .join(",\n\t")
        };

        println!("{}::enum u32 {{\n\t{},\n}}\n", &name[2..].replace("FlagBits", "Flags"), inner);
    }
}

struct Handle {
    name: String,
    parent: Option<String>,
    tag: String,
}
impl Handle {
    pub fn new(r: Ptr<Xnode>) -> Self {
        let name = r.get_child("name").get_str().join("");
        let parent = r.attr.get("parent").cloned();
        let tag = r.attr["objtypeenum"].clone();
        Self { name, parent, tag }
    }
}
struct Command {
    proto: Field,
    args: Vec<Field>,
}

impl Command {
    pub fn new(r: Ptr<Xnode>, arr_re: &Regex) -> Self {
        Command {
            proto: Field::new(r.get_child("proto"), arr_re, &mut None),
            args: r
                .get_children("param")
                .into_iter()
                .map(|p| Field::new(p, arr_re, &mut None))
                .collect(),
        }
    }
}
#[derive(PartialEq, Eq)]
enum PostModifier {
    None,
    Arr(u32),
    Arr2D(u32, u32),
    BitField(u32),
    Constant(String),
}

#[derive(Clone, Copy)]
enum PtrLevel {
    None,
    Const,
    Mut,
    Const2,
    Mut2,
}

#[derive(Debug)]
enum Len {
    Cstr,
    Expr(Expr),
}

struct Field {
    ty: String,
    name: String,
    ptr: PtrLevel,
    arr: PostModifier,
    len: Option<Len>,
}

struct Struct {
    stype: Option<String>,
    name: String,
    fields: Vec<Field>,
    union: bool,
    reonly: bool,
}

impl Field {
    pub fn new(r: Ptr<Xnode>, arr_re: &Regex, stype: &mut Option<String>) -> Self {
        let mut ty = String::new();
        let mut name = String::new();
        let mut arr = PostModifier::None;
        let mut idx = 0;
        let mut ptr = 0;
        let mut isconst = false;
        for f in r.down.iter() {
            match f {
                Xchild::Node(n) => match n.tag.as_str() {
                    "type" => {
                        idx += 1;
                        ty = n.get_str().join("");
                    }
                    "name" => {
                        idx += 1;
                        name = n.get_str().join("");

                        if name == "sType" {
                            *stype = r.attr.get("values").cloned();
                        }
                    }
                    "enum" => {
                        arr = PostModifier::Constant(n.get_str().join(""));
                    }
                    "comment" => {}
                    _ => unreachable!("{:?}", n.tag),
                },
                Xchild::Str(s) => match idx {
                    0 => isconst = s.find("const").is_some(),
                    1 => ptr = s.matches("*").count(),
                    2 => {
                        if s != "[" && s != "]" {
                            let v: Vec<u32> = arr_re
                                .captures_iter(s)
                                .map(|d| d.get(1).unwrap().as_str().parse().unwrap())
                                .collect();
                            arr = match v.as_slice() {
                                [i] => PostModifier::Arr(*i),
                                [i, j] => PostModifier::Arr2D(*i, *j),
                                [] => PostModifier::BitField(s.replace(":", "").parse().unwrap()),
                                _ => unreachable!(),
                            };
                        }
                    }
                    _ => (),
                },
            }
        }
        let ptr = match (isconst, ptr) {
            (false, 1) => PtrLevel::Mut,
            (true, 1) => PtrLevel::Const,
            (true, 2) => PtrLevel::Const2,
            (false, 2) => PtrLevel::Mut2,
            (_, 0) => PtrLevel::None,
            _ => unreachable!("{} {} {}", name, isconst, ptr),
        };

        if ty.starts_with("Vk") {
            ty = ty[2..].to_string();
        }
        ty = ty.replace("FlagBits", "Flags");
        // if name == "b32" {
        //     name = "b32".to_owned()
        // };

        name = match name.as_str() {
            "context" => "ctx".to_owned(),
            _ => name,
        };

        let len = if let Some(len) = r.attr.get("len") {
            let len = len.split(",").collect::<Vec<_>>();
            if let Some(altlen) = r.attr.get("altlen") {
                Some(Len::Expr(Expr::new(altlen).expect(altlen)))
            } else {
                Some(match len.as_slice() {
                    [n, "null-terminated"] => Len::Expr(Expr::new(n).unwrap()),
                    [n, "1"] => Len::Expr(Expr::new(n).unwrap()),
                    ["null-terminated"] => Len::Cstr,
                    [n] => {
                        //eprintln!("{:?}", len);
                        Len::Expr(Expr::new(n).unwrap())
                    }
                    _ => unreachable!(),
                })
            }
        } else {
            None
        };

        Field {
            ty,
            name,
            ptr,
            arr,
            len,
        }
    }

    pub fn ty_as_str(&self, cmd: bool) -> String {
        match (&self.len, self.ptr) {
            (Some(Len::Cstr), PtrLevel::Const) => {
                return format!("cstring");
            }
            (Some(Len::Cstr), PtrLevel::Const2) => {
                return format!("^cstring");
            }
            _ => (),
        }
        format!(
            "{}{}",
            make_ptr(self.ptr),
            make_ty(&self.ty, &self.arr, cmd)
        )
    }

    pub fn as_str(&self, cmd: bool) -> String {
        format!("{}: {}", self.name, self.ty_as_str(cmd))
    }
}

impl Struct {
    pub fn new(r: Ptr<Xnode>, arr_re: &Regex) -> Self {
        let mut stype = None;
        Struct {
            name: r.attr["name"].clone(),
            fields: r
                .get_children("member")
                .into_iter()
                .map(|r| Field::new(r, arr_re, &mut stype))
                .collect(),
            union: false,
            reonly: r.attr.get("returnedonly").map(|s| s == "true") == Some(true),
            stype,
        }
    }

    pub fn union(r: Ptr<Xnode>, arr_re: &Regex) -> Self {
        let mut re = Self::new(r, arr_re);
        re.union = true;
        re
    }
}

fn make_ptr(ptr: PtrLevel) -> &'static str {
    match ptr {
        PtrLevel::Mut => "^",
        PtrLevel::Const => "^",
        PtrLevel::Const2 => "^^",
        PtrLevel::Mut2 => "^^",
        PtrLevel::None => " ",
    }
}

fn make_ty(ty: &str, p: &PostModifier, cmd: bool) -> String {
    use PostModifier::*;
    let ty = map_ty(ty);
    let c = if cmd { "^" } else { "" };
    match p {
        None => ty.to_owned(),
        Arr(n) => format!("{}[{}]{}", c, n, ty),
        Arr2D(n, m) => format!("{}[{}][{}]{}", c, m, n, ty),
        BitField(8) => format!("u8"),
        BitField(24) => format!("[3]u8"),
        Constant(n) => format!("{}[{}]{}", c, &n[3..], ty),
        _ => unreachable!(),
    }
}

fn map_ty(ty: &str) -> &str {
    match ty {
        "int" => "i32",
        "void" => "void",
        "float" => "f32",
        "uint8_t" => "u8",
        "uint16_t" => "u16",
        "size_t" => "uint",
        "uint64_t" => "u64",
        "int64_t" => "i64",
        "int32_t" => "i32",
        "char" => "u8",
        "uint32_t" => "u32",
        "double" => "f64",
        _ if ty.starts_with("Vk") => &ty[2..],
        _ => ty,
    }
}
