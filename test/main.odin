package main;

foreign import glfw "glfw.so";

foreign glfw {
  glfw_init::proc(count: ^u32) -> ^cstring ---;
}


main::proc() {
  count : u32;
  ext := glfw_init(&count);
  
  for i in 0..count {
    fmt.println()
  }
}