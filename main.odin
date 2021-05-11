package main
import "core:fmt"
import "core:log"
import "core:mem"
import "core:os"
import "core:math"
import "vk"

foreign import glfw "glfw.so";
foreign import vma  "vma.so";

foreign glfw {
glfw_init::proc(count: ^u32) -> ^cstring ---;
glfw_poll::proc(win: uintptr) -> b32 ---;
glfw_create_surface::proc(x: i32,
                          y: i32,
                          name: cstring,
                          win: ^uintptr,
                          instance: vk.Instance,
                          surface: ^vk.SurfaceKHR) -> vk.Result ---;

stbi_load::proc(file: cstring, x: ^u32, y: ^u32, n: ^u32, c: u32) -> uintptr ---;

}

foreign vma {
vma_create_allocator::proc(instance: vk.Instance,
                           pdev: vk.PhysicalDevice,
                           dev: vk.Device) -> vk.Result ---; 


vma_create_buffer::proc(info:   ^vk.BufferCreateInfo,
                        buffer: ^vk.Buffer,
                        mapped: ^uintptr) -> vk.Result ---; 

vma_create_image::proc(info: ^vk.ImageCreateInfo, image: ^vk.Image) -> vk.Result ---;
}

check_result::proc(re: vk.Result, loc:=#caller_location) {
  if re != vk.Result.VkSuccess {
    fmt.printf("Err\n");
    log.panicf("%v\n", loc);
  }
}

inst:    vk.Instance;
pdev:    vk.PhysicalDevice;
dev:     vk.Device;
queue:   vk.Queue;
surface: vk.SurfaceKHR;
window:  uintptr;

pool: vk.CommandPool;
swapchain: vk.SwapchainKHR;
renderpass: vk.RenderPass;
depth_buffer: Image;
format: vk.SurfaceFormatKHR;
extent: vk.Extent2D;
  

PerFrame::struct {
  view: vk.ImageView,
  framebuffer: vk.Framebuffer,
  fence: vk.Fence,
  acquire: vk.Semaphore,
  present: vk.Semaphore,
}

cmds:   [dynamic]vk.CommandBuffer;
frames: [dynamic]PerFrame;


desc_pool: vk.DescriptorPool;
set_layout: vk.DescriptorSetLayout;
layout: vk.PipelineLayout;
pipeline: vk.Pipeline;

samplers: map[u64]vk.Sampler;


Image::struct {
  image: vk.Image,
  view: vk.ImageView,
  extent: vk.Extent2D,
  type: vk.DescriptorType,
  layout: vk.ImageLayout,
  sampler: vk.Sampler,
}

Texture::struct {
  using img: Image,
  tag: string,
}

init_resources::proc() {
  pool_info: vk.CommandPoolCreateInfo = {
      sType = .CommandPoolCreateInfo,
      flags = .TransientBit | .ResetCommandBufferBit,
  };  
  

  vk.create_command_pool(dev, &pool_info, nil, &pool);

  count: u32;
  cap: vk.SurfaceCapabilitiesKHR;

  check_result(vk.get_physical_device_surface_capabilities_khr(pdev, surface, &cap));

  extent = cap.currentExtent;
  
  check_result(vk.get_physical_device_surface_formats_khr(pdev, surface, &count, nil));


  formats := make([dynamic]vk.SurfaceFormatKHR, count);
  defer delete(formats);

  check_result(vk.get_physical_device_surface_formats_khr(pdev, surface, &count, &formats[0]));

  format = formats[0];

  check_result(vk.get_physical_device_surface_present_modes_khr(pdev, surface, &count, nil));
  mods := make([dynamic]vk.PresentModeKHR, count);
  defer delete(mods);
  check_result(vk.get_physical_device_surface_present_modes_khr(pdev, surface, &count, nil));

  mod := mods[0];

  for mm in mods {
    if mm == vk.PresentModeKHR.MailboxKhr {
      mod = mm;
      break;
    }
  }

  supported: vk.Bool32;
  check_result(vk.get_physical_device_surface_support_khr(pdev, 0, surface, &supported));

  swapchain_info := vk.SwapchainCreateInfoKHR {
    sType = .SwapchainCreateInfoKhr,
    surface = surface,
    minImageCount = cap.minImageCount + 1,
    imageFormat = format.format,
    imageColorSpace = format.colorSpace,
    imageExtent = extent,
    imageArrayLayers = cap.maxImageArrayLayers,
    imageUsage = .ColorAttachmentBit,
    imageSharingMode = .Exclusive,
    preTransform = .IdentityBitKhr,
    compositeAlpha = .OpaqueBitKhr,
    presentMode = mod,
    clipped = 1,
    oldSwapchain = 0,
  };

  check_result(vk.create_swapchain_khr(dev, &swapchain_info, nil, &swapchain));

  depth_buffer_info := vk.ImageCreateInfo {
    sType = .ImageCreateInfo,
    imageType = ._2D,
    format = .D32Sfloat,
    extent = { width = extent.width, height = extent.height, depth = 1},
    mipLevels = 1,
    arrayLayers = 1,
    samples = ._1Bit,
    tiling = .Optimal,
    usage = .DepthStencilAttachmentBit | .TransientAttachmentBit,
    sharingMode = .Exclusive,
  };

    
  depth_buffer := create_image(&depth_buffer_info);

  desc: [2]vk.AttachmentDescription = {
    {
      format = format.format,
      samples = ._1Bit,
      loadOp = .Clear,
      storeOp = .Store,
      initialLayout = .Undefined,
      finalLayout = .PresentSrcKhr,
    },
    {
      format = vk.Format.D32Sfloat,
      samples = ._1Bit,
      loadOp = .Clear,
      storeOp = .DontCare,
      initialLayout = .Undefined,
      finalLayout = .DepthStencilReadOnlyOptimal,
    },
  };

  ref:[2]vk.AttachmentReference = {
    {
      attachment = 0,
      layout = .ColorAttachmentOptimal,
    },
    {
      attachment = 1,
      layout = .DepthStencilAttachmentOptimal,  
    },
  };

  subpass := vk.SubpassDescription {
    pipelineBindPoint = .Graphics,
    colorAttachmentCount = 1,
    pColorAttachments = &ref[0],
    pDepthStencilAttachment = &ref[1],
  };

  renderpass_info := vk.RenderPassCreateInfo {
    sType = .RenderPassCreateInfo,
    attachmentCount = 2,
    pAttachments = &desc[0],
    subpassCount = 1,
    pSubpasses = &subpass,
  };

  check_result(vk.create_render_pass(dev, &renderpass_info, nil, &renderpass));

  {
    check_result(vk.get_swapchain_images_khr(dev, swapchain, &count, nil));
    images := make([dynamic]vk.Image, count); 
    defer delete(images);
    resize(&cmds,   int(count));
    resize(&frames, int(count));

    check_result(vk.get_swapchain_images_khr(dev, swapchain, &count, &images[0]));
    cmd_info := vk.CommandBufferAllocateInfo{
      sType = .CommandBufferAllocateInfo,
      commandPool = pool,
      level = .Primary,
      commandBufferCount = count,
    };

    check_result(vk.allocate_command_buffers(dev, &cmd_info, &cmds[0]));

    fence_info := vk.FenceCreateInfo {
      sType = .FenceCreateInfo,
      flags = .SignaledBit,
    };

    semaphore_info := vk.SemaphoreCreateInfo{ sType = .SemaphoreCreateInfo };

    view_info := vk.ImageViewCreateInfo {
      sType = .ImageViewCreateInfo,
      viewType = ._2D,
      format = format.format,
    };

    view_info.subresourceRange = {
          aspectMask = .ColorBit,
          levelCount = 1,
          layerCount = 1,
      };

    framebuffer_info := vk.FramebufferCreateInfo {
      sType = .FramebufferCreateInfo,
      renderPass = renderpass,
      attachmentCount = 2,
      width = extent.width,
      height = extent.height,
      layers = 1,
    };

    framebuffer_info.layers = 1;

    for i in 0..<len(frames) {
      view_info.image = images[i];
      check_result(vk.create_image_view(dev, &view_info, nil, &frames[i].view));
      attachments := [2]vk.ImageView { frames[i].view, depth_buffer.view };
      framebuffer_info.pAttachments = &attachments[0];
      check_result(vk.create_framebuffer(dev, &framebuffer_info, nil, &frames[i].framebuffer));
      check_result(vk.create_fence(dev, &fence_info, nil, &frames[i].fence));
      check_result(vk.create_semaphore(dev, &semaphore_info, nil, &frames[i].acquire));
      check_result(vk.create_semaphore(dev, &semaphore_info, nil, &frames[i].present));
    }

  }
}

free_resources::proc() {
  for i in 0..< len(frames) {
    vk.destroy_framebuffer(dev, frames[i].framebuffer, nil);
    vk.destroy_image_view(dev, frames[i].view, nil);
    vk.destroy_fence(dev, frames[i].fence, nil);
    vk.destroy_semaphore(dev, frames[i].acquire, nil);
    vk.destroy_semaphore(dev, frames[i].present, nil);
  }
  vk.free_command_buffers(dev, pool, auto_cast len(cmds), &cmds[0]);
}


init_color::proc() -> vk.ClearValue{
    clear : vk.ClearValue;
    clear.color.float32 = { 0.1, 0.1, 0.4, 1.0 };

    return clear;
}

main::proc() {



  count: u32;
  ext := glfw_init(&count);
  layer: cstring = "VK_LAYER_KHRONOS_validation";

  

  

  samplers = make(map[u64]vk.Sampler);
  vk.init();
  
  app := vk.ApplicationInfo {
      sType = .ApplicationInfo,
      apiVersion = vk.make_version(1,2,0),
  };

  info := vk.InstanceCreateInfo {
    sType = .InstanceCreateInfo,
    pApplicationInfo = &app,
    enabledLayerCount = 1,
    ppEnabledLayerNames = auto_cast &layer,
    enabledExtensionCount = count,
    ppEnabledExtensionNames = auto_cast ext,
  };


  check_result(vk.create_instance(&info, nil, &inst));

  vk.load_instance_functions(inst);
  pdevs: [16]vk.PhysicalDevice;
  check_result(vk.enumerate_physical_devices(inst, &count, nil));
  check_result(vk.enumerate_physical_devices(inst, &count, &pdevs[0]));
  pdev = pdevs[0];

  
  prio: f32 = 1.0;

  {
    qinfo := vk.DeviceQueueCreateInfo{
      sType = .DeviceQueueCreateInfo,
      queueCount = 1,
      pQueuePriorities = &prio,
    };
    dev_ext: cstring = "VK_KHR_swapchain";
    info := vk.DeviceCreateInfo {
      sType = .DeviceCreateInfo,
      queueCreateInfoCount = 1,
      pQueueCreateInfos = &qinfo,
      enabledLayerCount = 1,
      ppEnabledLayerNames = auto_cast &layer,
      enabledExtensionCount = 1,
      ppEnabledExtensionNames = auto_cast &dev_ext,
    };

    check_result(vk.create_device(pdev, &info, nil, &dev));

    vk.load_device_functions(dev);

    vk.get_device_queue(dev, 0, 0, &queue);

    vma_create_allocator(inst,pdev,dev);
  }

  check_result(glfw_create_surface(800,600, "Vulkan", &window, inst, &surface));

  init_resources();

  create_pipeline();

  idx: u32 = u32(len(frames) - 1);
  prev:u32 = idx;

  buffer, mapping := create_mapped_buffer(1024, .IndexBufferBit | .VertexBufferBit);


  indices := cast(^[6]i32)   mapping;
  positions := cast(^[4][2]f32) mem.ptr_offset(indices, 1);;

  indices^ = {0,1,2,1,2,3};

  positions^ = {
    {-0.5, -0.5 },
    {-0.5, +0.5 },
    {+0.5, -0.5 },
    {+0.5, +0.5 },
  };


  texture := create_texture("odin.png");

  desc_info := vk.DescriptorSetAllocateInfo {
    sType = .DescriptorSetAllocateInfo,
    descriptorPool = desc_pool,
	  descriptorSetCount = 1,
	  pSetLayouts = &set_layout,
  };

  set: vk.DescriptorSet;
  check_result(vk.allocate_descriptor_sets(dev, &desc_info, &set));

  img_info := vk.DescriptorImageInfo {
	  sampler = texture.sampler,
	  imageView = texture.view,
	  imageLayout = texture.layout,
  };

  write_info := vk.WriteDescriptorSet{
    sType = .WriteDescriptorSet,
    dstSet = set,
    dstBinding = 0,
    descriptorCount = 1,
    descriptorType = texture.type,
    pImageInfo = &img_info,
  };

  vk.update_descriptor_sets(dev, 1, &write_info, 0, nil);

  for glfw_poll(window) {
    prev = idx;
    for vk.Result.VkSuccess != 
        vk.acquire_next_image_khr(dev, swapchain, 
        max(u64), frames[prev].acquire, 0, &idx) {
        vk.device_wait_idle(dev);
        free_resources();
        init_resources();
    }

    cmd := cmds[idx];
    cur := &frames[idx];
    
    begin_info := vk.CommandBufferBeginInfo { 
      sType = .CommandBufferBeginInfo,
      flags = .OneTimeSubmitBit,
    };

    check_result(vk.wait_for_fences(dev, 1, &cur.fence, 1, max(u64)));
    check_result(vk.reset_fences(dev, 1, &cur.fence));
    vk.reset_command_buffer(cmd, .ReleaseResourcesBit);
    check_result(vk.begin_command_buffer(cmd, &begin_info));

    clear : [2]vk.ClearValue;
    clear   [0].color.float32 = { 0.1, 0.1, 0.4, 1.0 };
    
    pass_begin_info := vk.RenderPassBeginInfo{
      sType = .RenderPassBeginInfo,
      renderPass = renderpass,
      framebuffer = cur.framebuffer,
      renderArea = {extent = extent},
      clearValueCount = 2,
      pClearValues = &clear[0],
    };

    vk.cmd_begin_render_pass(cmd, &pass_begin_info, .Inline);

    vk.cmd_bind_pipeline(cmd, .Graphics, pipeline);
    
    vk.cmd_bind_descriptor_sets(cmd, .Graphics, layout, 0, 1, &set, 0, nil);
    
    offset : vk.DeviceSize = size_of(indices^);
    vk.cmd_bind_vertex_buffers(cmd, 0, 1, &buffer, &offset);
    vk.cmd_bind_index_buffer(cmd, buffer, 0,  .Uint32);
    vk.cmd_draw_indexed(cmd, 6, 1, 0, 0, 0);

    vk.cmd_end_render_pass(cmd);

    check_result(vk.end_command_buffer(cmd));

    stage := vk.PipelineStageFlags.ColorAttachmentOutputBit;

    submit_info := vk.SubmitInfo {
      sType = .SubmitInfo,
      waitSemaphoreCount = 1,
      pWaitSemaphores = &frames[prev].acquire,
      pWaitDstStageMask = &stage,
      commandBufferCount = 1,
      pCommandBuffers = &cmd,
      signalSemaphoreCount = 1,
      pSignalSemaphores = &cur.present,
    };

    check_result(vk.queue_submit(queue, 1, &submit_info, cur.fence));

    present_info := vk.PresentInfoKHR{
      sType = .PresentInfoKhr,
      waitSemaphoreCount = 1,
      pWaitSemaphores = &cur.present,
      swapchainCount = 1,
      pSwapchains = &swapchain,
      pImageIndices = &idx,
    };

    vk.queue_present_khr(queue, &present_info);
  }

  fmt.printf("Success\n");
}

create_buffer::proc(size: u64, usage: vk.BufferUsageFlags) -> (buffer:vk.Buffer) {
  info := vk.BufferCreateInfo {
    sType = .BufferCreateInfo,
    size  = auto_cast size,
    usage = auto_cast usage,
  };
  
  check_result(vma_create_buffer(&info, &buffer, nil));
  return;
}

create_mapped_buffer::proc(size: u64, usage: vk.BufferUsageFlags) -> (buffer:vk.Buffer, mapping:uintptr) {
  info := vk.BufferCreateInfo {
    sType = .BufferCreateInfo,
    size  = auto_cast size,
    usage = auto_cast usage,
  };
  
  check_result(vma_create_buffer(&info, &buffer, &mapping));
  return;
}

type_layout::proc(usage: vk.ImageUsageFlags) -> (type:vk.DescriptorType, layout:vk.ImageLayout) {
  layout = .ShaderReadOnlyOptimal;
  type = .CombinedImageSampler; 
  #partial switch (usage) {
    case .StorageBit: type = .StorageImage;   
    case .ColorAttachmentBit: layout = .ColorAttachmentOptimal;
    case .DepthStencilAttachmentBit: layout = .DepthStencilReadOnlyOptimal;
    case .InputAttachmentBit: type = .InputAttachment; 
    case:
  }
  return;
}


create_sampler::proc(mode: vk.SamplerAddressMode, mip: u32) -> vk.Sampler {
  key := u64(mode) | u64(mip << 32);
  
  if sampler, ok := samplers[key]; ok {
    return sampler;
  }

  info := vk.SamplerCreateInfo{
    sType = .SamplerCreateInfo,
    magFilter = .Linear,
    minFilter = .Linear,
    mipmapMode = .Linear,
    addressModeU = mode,
    addressModeV = mode,
    addressModeW = mode,
    mipLodBias = 0.0,
    anisotropyEnable = 0,
    maxAnisotropy = 16,
    compareOp = .Never,
    maxLod = f32(mip),
    borderColor = .FloatOpaqueWhite,
  };

  sampler:vk.Sampler;

  check_result(vk.create_sampler(dev, &info, nil, &sampler));

  samplers[key] = sampler;

  return sampler;
}

create_image::proc(info: ^vk.ImageCreateInfo) -> (re:Image) {

  re.extent = {info.extent.width, info.extent.height}; 

  check_result(vma_create_image(info, &re.image));


  view_info := vk.ImageViewCreateInfo{
    sType = .ImageViewCreateInfo,
    image = re.image,
    viewType = ._2D,
    format = info.format,
    components = {
      r = .R,
      g = .G,
      b = .B,
      a = .A,
    },
  };

  view_info.subresourceRange.levelCount = info.mipLevels;
  view_info.subresourceRange.layerCount = 1;

  if b32(info.usage & (.ColorAttachmentBit | .SampledBit)) {
    view_info.subresourceRange.aspectMask = .ColorBit; 
  }

  if b32(info.usage & .DepthStencilAttachmentBit) {
    view_info.subresourceRange.aspectMask = .DepthBit; 
  }

  check_result(vk.create_image_view(dev, &view_info, nil, &re.view));

  re.type, re.layout = type_layout(info.usage);

  re.sampler = create_sampler(.Repeat, info.mipLevels);

  return;
}


load_shader::proc(src: string) -> vk.ShaderModule {
  file, err := os.open(src);

  if err != os.ERROR_NONE {
    fmt.printf("Err\n");
    log.panicf("%v\n", err);
  }

  size, _ := os.file_size(file);

  buf := make([]u8, size);
  os.read(file, buf);

  info := vk.ShaderModuleCreateInfo {
    sType = .ShaderModuleCreateInfo,
    codeSize = uint(len(buf)),
    pCode = auto_cast &buf[0],
  };

  module: vk.ShaderModule;
  check_result(vk.create_shader_module(dev, &info, nil, &module));
  return module;
}


create_pipeline::proc() {

  stages := [2]vk.PipelineShaderStageCreateInfo {
    {
      sType = .PipelineShaderStageCreateInfo,
      stage = .VertexBit,
      module = load_shader("shader.vert.spv"),
      pName = "main",
    },
    {
      sType = .PipelineShaderStageCreateInfo,
      stage = .FragmentBit,
      module = load_shader("shader.frag.spv"),
      pName = "main",
    },
  };

  binding := vk.VertexInputBindingDescription {
    binding = 0,
    stride =  8,
    inputRate = .Vertex,
  };

  attr := vk.VertexInputAttributeDescription {
	  location = 0,
	  binding = 0,
	  format = .R32G32Sfloat,
	  offset = 0,
  };

  VertexInputState := vk.PipelineVertexInputStateCreateInfo {
    sType = .PipelineVertexInputStateCreateInfo,
    vertexBindingDescriptionCount = 1,
    pVertexBindingDescriptions = &binding,
    vertexAttributeDescriptionCount = 1,
    pVertexAttributeDescriptions = &attr,
  };

  InputAssemblyState := vk.PipelineInputAssemblyStateCreateInfo {
    sType = .PipelineInputAssemblyStateCreateInfo,
    topology = .TriangleList,
  };

  Viewports := vk.Viewport {
    width = f32(extent.width),
    height = f32(extent.height),
    maxDepth = 1.0,
  };

  Scissors := vk.Rect2D {extent = extent};
  ViewportState :=  vk.PipelineViewportStateCreateInfo {
    sType = .PipelineViewportStateCreateInfo,
    viewportCount = 1,
    pViewports = &Viewports,
    scissorCount = 1,
    pScissors = &Scissors,
  };

  MultisampleState := vk.PipelineMultisampleStateCreateInfo {
    sType = .PipelineMultisampleStateCreateInfo,
    rasterizationSamples = auto_cast 1,
  };

  DepthStencilState := vk.PipelineDepthStencilStateCreateInfo{
    sType = .PipelineDepthStencilStateCreateInfo,
    depthTestEnable = 1,
    depthWriteEnable = 1,
    depthCompareOp = .LessOrEqual,
  };

  Attachments := vk.PipelineColorBlendAttachmentState{
    blendEnable = 0,
    // srcColorBlendFactor = .SrcAlpha,
    // dstColorBlendFactor = .OneMinusSrc1Alpha,
    // colorBlendOp = .Add,
    // srcAlphaBlendFactor = .One,
    // dstAlphaBlendFactor = .Zero,
    // alphaBlendOp = .Add,
    colorWriteMask = auto_cast(
      .RBit | 
      .GBit | 
      .BBit | 
      .ABit),
  };

  ColorBlendState := vk.PipelineColorBlendStateCreateInfo {
    sType = .PipelineColorBlendStateCreateInfo,
    attachmentCount = 1,
    pAttachments = &Attachments,
  };

  DynamicState := vk.PipelineDynamicStateCreateInfo{
    sType = .PipelineDynamicStateCreateInfo,
  };

  RasterizationState := vk.PipelineRasterizationStateCreateInfo{
    sType = .PipelineRasterizationStateCreateInfo,
    polygonMode = .Fill,
    cullMode = .None,
    lineWidth = 1.0,
  };


  layout_binding := vk.DescriptorSetLayoutBinding {
	  binding = 0,
	  descriptorType = .CombinedImageSampler,
	  descriptorCount = 1,
	  stageFlags = .FragmentBit,
  };

  set_layout_info:= vk.DescriptorSetLayoutCreateInfo {
	  sType = .DescriptorSetLayoutCreateInfo,
	  bindingCount = 1,
	  pBindings = &layout_binding,
  };

  check_result(vk.create_descriptor_set_layout(dev, &set_layout_info, nil, &set_layout));
  
  pool_size := vk.DescriptorPoolSize { 
    type = .CombinedImageSampler, 
    descriptorCount = 1024, 
  };

  pool_info := vk.DescriptorPoolCreateInfo {
	  sType =  .DescriptorPoolCreateInfo,
	  maxSets =  1024,
	  poolSizeCount = 1,
	  pPoolSizes = &pool_size,
  };

  check_result(vk.create_descriptor_pool(dev, &pool_info, nil, &desc_pool));

  layout_info := vk.PipelineLayoutCreateInfo {
    sType = .PipelineLayoutCreateInfo,
    setLayoutCount = 1,
	  pSetLayouts = &set_layout,
  };

  check_result(vk.create_pipeline_layout(dev, &layout_info, nil, &layout));

  info := vk.GraphicsPipelineCreateInfo {
    sType = .GraphicsPipelineCreateInfo ,
    stageCount = 2,
    pStages = &stages[0],
    pVertexInputState = &VertexInputState,
    pInputAssemblyState = &InputAssemblyState,
    pViewportState = &ViewportState,
    pRasterizationState = &RasterizationState,
    pMultisampleState = &MultisampleState,
    pDepthStencilState = &DepthStencilState,
    pColorBlendState = &ColorBlendState,
    pDynamicState = &DynamicState,
    layout = layout,
    renderPass = renderpass,
  };

  check_result(vk.create_graphics_pipelines(dev, 0, 1, &info, nil, &pipeline));
}

map_layout::proc(layout: vk.ImageLayout) -> vk.AccessFlags {

  #partial switch layout {
    case .Preinitialized:                         return .HostWriteBit;
    case .ColorAttachmentOptimal:                 return .ColorAttachmentWriteBit;
    case .DepthStencilAttachmentOptimal:          return .DepthStencilAttachmentWriteBit;
    case .TransferSrcOptimal:                     return .TransferReadBit;
    case .TransferDstOptimal:                     return .TransferWriteBit;
    case .ShaderReadOnlyOptimal:                  return .ShaderReadBit;
  }

  return .NoneKhr;
}

set_image_layout::proc(
    cmd: vk.CommandBuffer,
    image: vk.Image,
    old_layout: vk.ImageLayout,
    new_layout: vk.ImageLayout,
    subrange: vk.ImageSubresourceRange,
    src_stage_mask: vk.PipelineStageFlags = .TransferBit,
    dst_stage_mask: vk.PipelineStageFlags = .TransferBit) {

  barrier := vk.ImageMemoryBarrier {
    sType = .ImageMemoryBarrier,
    oldLayout = old_layout,
    newLayout = new_layout,
    srcAccessMask = map_layout(old_layout),
    dstAccessMask = map_layout(new_layout),
    image = image,
    subresourceRange = subrange,
  };

  vk.cmd_pipeline_barrier(cmd, src_stage_mask, dst_stage_mask, 
                          auto_cast 0, 0, nil, 0, nil, 1, &barrier);
                    
}

copy_texture::proc(cmd: vk.CommandBuffer,
                   src: vk.Buffer,
                   image: vk.Image,
                   extent: vk.Extent2D) {

  subrange := vk.ImageSubresourceRange{
    aspectMask = .ColorBit,
    levelCount = 1,
    layerCount = 1,
  };

  set_image_layout(cmd, image, .Undefined, .TransferDstOptimal, subrange);
  
  region := vk.BufferImageCopy {
	  imageSubresource = {  aspectMask = .ColorBit, layerCount = 1 },
	  imageExtent = { width = extent.width,height = extent.height, depth = 1 },
  };

  vk.cmd_copy_buffer_to_image(cmd, src, image, .TransferDstOptimal, 1, &region);

  set_image_layout(cmd, image, .TransferDstOptimal, .TransferSrcOptimal, subrange);
}

generate_mip_maps::proc(cmd: vk.CommandBuffer,
                        mip: u32,
                        image: vk.Image,
                        extent: vk.Extent2D) {

  for i: u32 = 1; i < mip; i += 1 {
    image_blit:= vk.ImageBlit {
      srcSubresource = { aspectMask = .ColorBit, mipLevel = i - 1, layerCount = 1 },
      dstSubresource = { aspectMask = .ColorBit, mipLevel = i,     layerCount = 1 },
    };
  
    image_blit.srcOffsets[1] = {
      x = cast(i32)max(extent.width >> (i - 1), 1),
      y = cast(i32)max(extent.height >> (i - 1), 1),
      z = 1,
    };

    image_blit.dstOffsets[1] = {
      x = cast(i32)max(extent.width >> i, 1),
      y = cast(i32)max(extent.height >> i, 1),
      z = 1,
    };

    subrange := vk.ImageSubresourceRange {
      aspectMask = .ColorBit,
      baseMipLevel = i,
      levelCount = 1,
      layerCount = 1,
    };

    set_image_layout(cmd, image, .Undefined, .TransferDstOptimal,
                     subrange);
    vk.cmd_blit_image(cmd, image, .TransferSrcOptimal, image, .TransferDstOptimal, 1,
                   &image_blit, .Linear);

    set_image_layout(cmd, image, .TransferDstOptimal, .TransferSrcOptimal, subrange);
  }

  set_image_layout(cmd, image, .TransferSrcOptimal, .ShaderReadOnlyOptimal,
                   {aspectMask = .ColorBit,
                    levelCount = mip,
                    layerCount = 1},
                   .TransferBit, .FragmentShaderBit);
}



create_texture::proc(file: cstring) -> (re: Texture) {

  re.tag = string(file);

  extent: vk.Extent2D;
  channels: u32;
  data := stbi_load(file, &extent.width, &extent.height, &channels, 4);

  re.extent = extent;

  mip := u32(math.floor(math.log2(max(f32(extent.width), f32(extent.height))))) + 1;

  size := u64(extent.width * extent.height * 4);

  info := vk.ImageCreateInfo {
    sType = .ImageCreateInfo,
    imageType = ._2D,
    format = .R8G8B8A8Srgb,
    extent = { width = extent.width, height = extent.height, depth = 1},
    mipLevels = mip,
    arrayLayers = 1,
    samples = ._1Bit,
    tiling = .Optimal,
    usage = .TransferSrcBit | .TransferDstBit | .SampledBit,
    sharingMode = .Exclusive,
  };


  re.img = create_image(&info);

  staging, mapping := create_mapped_buffer(size, .TransferSrcBit);

  mem.copy(rawptr(mapping), rawptr(data), int(size));

  arg::struct {src: vk.Buffer, dst: ^Texture, mip: u32};
  
  execute(proc(cmd: vk.CommandBuffer, t: ^arg) {
      copy_texture(cmd,  t.src, t.dst.img.image, t.dst.extent);
      generate_mip_maps(cmd, t.mip, t.dst.img.image, t.dst.extent); 
    }, &arg{src=staging, dst = &re, mip=mip});

  return;
}

execute::proc(fn: proc(vk.CommandBuffer, $T), data: T) {

  info := vk.CommandBufferAllocateInfo{
    sType = .CommandBufferAllocateInfo,
    commandPool = pool,
    level = .Primary,
    commandBufferCount = 1,
  };

  cmd:vk.CommandBuffer;

  check_result(vk.allocate_command_buffers(dev, &info, &cmd));

  begin_info := vk.CommandBufferBeginInfo{
    sType = .CommandBufferBeginInfo,
    flags = .OneTimeSubmitBit,
  };

  check_result(vk.begin_command_buffer(cmd, &begin_info));

  fn(cmd, data);

  submit_info := vk.SubmitInfo{
    sType = .SubmitInfo,
    commandBufferCount = 1,
    pCommandBuffers = &cmd,
  };

  fence_info := vk.FenceCreateInfo{ sType = .FenceCreateInfo };

  fence:vk.Fence;

  check_result(vk.create_fence(dev, &fence_info, nil, &fence));
  check_result(vk.end_command_buffer(cmd));
  check_result(vk.queue_submit(queue, 1, &submit_info, fence));
  check_result(vk.wait_for_fences(dev, 1, &fence, 1, max(u64)));

  vk.destroy_fence(dev, fence, nil);

  vk.free_command_buffers(dev, pool, 1, &cmd);
}