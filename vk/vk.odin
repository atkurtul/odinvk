package vk;
import "core:dynlib";
void::struct{}

make_version::proc(major: u32, minor: u32, patch: u32) -> u32 {
  return major << 22 | minor << 12 | patch;
}
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
    

lib : dynlib.Library;
load_sym::proc(name: string) -> rawptr {
  sym, _ := dynlib.symbol_address(lib, name);
  return sym;
}
init::proc() {
  tmp, _ := dynlib.load_library("libvulkan.so.1");
  lib = tmp;
        
  create_instance = auto_cast load_sym("vkCreateInstance");
  enumerate_device_layer_properties = auto_cast load_sym("vkEnumerateDeviceLayerProperties");
  get_instance_proc_addr = auto_cast load_sym("vkGetInstanceProcAddr");
}

load_instance_functions::proc(instance: Instance){
  create_win_32_surface_khr = auto_cast get_instance_proc_addr(instance, "vkCreateWin32SurfaceKHR");
  debug_report_message_ext = auto_cast get_instance_proc_addr(instance, "vkDebugReportMessageEXT");
  get_physical_device_multisample_properties_ext = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceMultisamplePropertiesEXT");
  create_image_pipe_surface_fuchsia = auto_cast get_instance_proc_addr(instance, "vkCreateImagePipeSurfaceFUCHSIA");
  create_xcb_surface_khr = auto_cast get_instance_proc_addr(instance, "vkCreateXcbSurfaceKHR");
  get_device_proc_addr = auto_cast get_instance_proc_addr(instance, "vkGetDeviceProcAddr");
  acquire_winrt_display_nv = auto_cast get_instance_proc_addr(instance, "vkAcquireWinrtDisplayNV");
  get_physical_device_cooperative_matrix_properties_nv = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV");
  get_physical_device_external_image_format_properties_nv = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceExternalImageFormatPropertiesNV");
  get_physical_device_screen_presentation_support_qnx = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceScreenPresentationSupportQNX");
  get_physical_device_format_properties_2 = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceFormatProperties2");
  create_ios_surface_mvk = auto_cast get_instance_proc_addr(instance, "vkCreateIOSSurfaceMVK");
  create_display_plane_surface_khr = auto_cast get_instance_proc_addr(instance, "vkCreateDisplayPlaneSurfaceKHR");
  get_physical_device_surface_present_modes_2ext = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceSurfacePresentModes2EXT");
  get_physical_device_present_rectangles_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDevicePresentRectanglesKHR");
  get_physical_device_properties_2 = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceProperties2");
  get_physical_device_display_plane_properties_2khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceDisplayPlaneProperties2KHR");
  get_physical_device_fragment_shading_rates_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceFragmentShadingRatesKHR");
  create_stream_descriptor_surface_ggp = auto_cast get_instance_proc_addr(instance, "vkCreateStreamDescriptorSurfaceGGP");
  get_physical_device_display_plane_properties_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceDisplayPlanePropertiesKHR");
  get_physical_device_xcb_presentation_support_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceXcbPresentationSupportKHR");
  destroy_instance = auto_cast get_instance_proc_addr(instance, "vkDestroyInstance");
  create_wayland_surface_khr = auto_cast get_instance_proc_addr(instance, "vkCreateWaylandSurfaceKHR");
  get_physical_device_format_properties = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceFormatProperties");
  get_physical_device_display_properties_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceDisplayPropertiesKHR");
  get_display_plane_capabilities_2khr = auto_cast get_instance_proc_addr(instance, "vkGetDisplayPlaneCapabilities2KHR");
  enumerate_physical_device_queue_family_performance_query_counters_khr = auto_cast get_instance_proc_addr(instance, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR");
  get_physical_device_tool_properties_ext = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceToolPropertiesEXT");
  get_physical_device_calibrateable_time_domains_ext = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceCalibrateableTimeDomainsEXT");
  get_physical_device_queue_family_properties = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceQueueFamilyProperties");
  get_physical_device_external_buffer_properties = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceExternalBufferProperties");
  get_physical_device_supported_framebuffer_mixed_samples_combinations_nv = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV");
  create_vi_surface_nn = auto_cast get_instance_proc_addr(instance, "vkCreateViSurfaceNN");
  get_physical_device_properties = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceProperties");
  get_physical_device_xlib_presentation_support_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceXlibPresentationSupportKHR");
  get_physical_device_win_32_presentation_support_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceWin32PresentationSupportKHR");
  get_physical_device_surface_capabilities_2ext = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceSurfaceCapabilities2EXT");
  get_physical_device_sparse_image_format_properties = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceSparseImageFormatProperties");
  get_physical_device_external_fence_properties = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceExternalFenceProperties");
  get_physical_device_features = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceFeatures");
  get_physical_device_surface_present_modes_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceSurfacePresentModesKHR");
  get_physical_device_display_properties_2khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceDisplayProperties2KHR");
  get_physical_device_image_format_properties_2 = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceImageFormatProperties2");
  get_winrt_display_nv = auto_cast get_instance_proc_addr(instance, "vkGetWinrtDisplayNV");
  get_display_mode_properties_2khr = auto_cast get_instance_proc_addr(instance, "vkGetDisplayModeProperties2KHR");
  create_device = auto_cast get_instance_proc_addr(instance, "vkCreateDevice");
  create_debug_report_callback_ext = auto_cast get_instance_proc_addr(instance, "vkCreateDebugReportCallbackEXT");
  create_metal_surface_ext = auto_cast get_instance_proc_addr(instance, "vkCreateMetalSurfaceEXT");
  create_debug_utils_messenger_ext = auto_cast get_instance_proc_addr(instance, "vkCreateDebugUtilsMessengerEXT");
  get_physical_device_queue_family_properties_2 = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceQueueFamilyProperties2");
  enumerate_device_extension_properties = auto_cast get_instance_proc_addr(instance, "vkEnumerateDeviceExtensionProperties");
  release_display_ext = auto_cast get_instance_proc_addr(instance, "vkReleaseDisplayEXT");
  get_physical_device_external_semaphore_properties = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceExternalSemaphoreProperties");
  get_physical_device_memory_properties_2 = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceMemoryProperties2");
  get_physical_device_surface_formats_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceSurfaceFormatsKHR");
  get_display_plane_supported_displays_khr = auto_cast get_instance_proc_addr(instance, "vkGetDisplayPlaneSupportedDisplaysKHR");
  get_physical_device_surface_formats_2khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceSurfaceFormats2KHR");
  acquire_xlib_display_ext = auto_cast get_instance_proc_addr(instance, "vkAcquireXlibDisplayEXT");
  create_mac_os_surface_mvk = auto_cast get_instance_proc_addr(instance, "vkCreateMacOSSurfaceMVK");
  create_headless_surface_ext = auto_cast get_instance_proc_addr(instance, "vkCreateHeadlessSurfaceEXT");
  create_direct_fb_surface_ext = auto_cast get_instance_proc_addr(instance, "vkCreateDirectFBSurfaceEXT");
  get_display_mode_properties_khr = auto_cast get_instance_proc_addr(instance, "vkGetDisplayModePropertiesKHR");
  get_physical_device_features_2 = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceFeatures2");
  destroy_debug_utils_messenger_ext = auto_cast get_instance_proc_addr(instance, "vkDestroyDebugUtilsMessengerEXT");
  get_physical_device_surface_support_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceSurfaceSupportKHR");
  get_physical_device_direct_fb_presentation_support_ext = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceDirectFBPresentationSupportEXT");
  enumerate_physical_devices = auto_cast get_instance_proc_addr(instance, "vkEnumeratePhysicalDevices");
  create_xlib_surface_khr = auto_cast get_instance_proc_addr(instance, "vkCreateXlibSurfaceKHR");
  get_physical_device_surface_capabilities_2khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceSurfaceCapabilities2KHR");
  create_android_surface_khr = auto_cast get_instance_proc_addr(instance, "vkCreateAndroidSurfaceKHR");
  get_physical_device_surface_capabilities_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR");
  create_screen_surface_qnx = auto_cast get_instance_proc_addr(instance, "vkCreateScreenSurfaceQNX");
  get_physical_device_image_format_properties = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceImageFormatProperties");
  enumerate_physical_device_groups = auto_cast get_instance_proc_addr(instance, "vkEnumeratePhysicalDeviceGroups");
  get_physical_device_queue_family_performance_query_passes_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR");
  get_physical_device_memory_properties = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceMemoryProperties");
  get_physical_device_wayland_presentation_support_khr = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceWaylandPresentationSupportKHR");
  destroy_surface_khr = auto_cast get_instance_proc_addr(instance, "vkDestroySurfaceKHR");
  get_physical_device_sparse_image_format_properties_2 = auto_cast get_instance_proc_addr(instance, "vkGetPhysicalDeviceSparseImageFormatProperties2");
  create_display_mode_khr = auto_cast get_instance_proc_addr(instance, "vkCreateDisplayModeKHR");
  get_rand_r_output_display_ext = auto_cast get_instance_proc_addr(instance, "vkGetRandROutputDisplayEXT");
  get_display_plane_capabilities_khr = auto_cast get_instance_proc_addr(instance, "vkGetDisplayPlaneCapabilitiesKHR");
  submit_debug_utils_message_ext = auto_cast get_instance_proc_addr(instance, "vkSubmitDebugUtilsMessageEXT");
  destroy_debug_report_callback_ext = auto_cast get_instance_proc_addr(instance, "vkDestroyDebugReportCallbackEXT");
}

load_device_functions::proc(device: Device){
  get_semaphore_counter_value = auto_cast get_device_proc_addr(device, "vkGetSemaphoreCounterValue");
  cmd_dispatch = auto_cast get_device_proc_addr(device, "vkCmdDispatch");
  create_ray_tracing_pipelines_nv = auto_cast get_device_proc_addr(device, "vkCreateRayTracingPipelinesNV");
  device_wait_idle = auto_cast get_device_proc_addr(device, "vkDeviceWaitIdle");
  get_shader_info_amd = auto_cast get_device_proc_addr(device, "vkGetShaderInfoAMD");
  cmd_set_scissor = auto_cast get_device_proc_addr(device, "vkCmdSetScissor");
  cmd_set_blend_constants = auto_cast get_device_proc_addr(device, "vkCmdSetBlendConstants");
  cmd_begin_debug_utils_label_ext = auto_cast get_device_proc_addr(device, "vkCmdBeginDebugUtilsLabelEXT");
  cmd_set_viewport = auto_cast get_device_proc_addr(device, "vkCmdSetViewport");
  get_pipeline_executable_statistics_khr = auto_cast get_device_proc_addr(device, "vkGetPipelineExecutableStatisticsKHR");
  cmd_end_debug_utils_label_ext = auto_cast get_device_proc_addr(device, "vkCmdEndDebugUtilsLabelEXT");
  cmd_build_acceleration_structures_khr = auto_cast get_device_proc_addr(device, "vkCmdBuildAccelerationStructuresKHR");
  get_acceleration_structure_device_address_khr = auto_cast get_device_proc_addr(device, "vkGetAccelerationStructureDeviceAddressKHR");
  destroy_swapchain_khr = auto_cast get_device_proc_addr(device, "vkDestroySwapchainKHR");
  cmd_clear_color_image = auto_cast get_device_proc_addr(device, "vkCmdClearColorImage");
  cmd_set_stencil_test_enable_ext = auto_cast get_device_proc_addr(device, "vkCmdSetStencilTestEnableEXT");
  destroy_private_data_slot_ext = auto_cast get_device_proc_addr(device, "vkDestroyPrivateDataSlotEXT");
  cmd_copy_buffer_2khr = auto_cast get_device_proc_addr(device, "vkCmdCopyBuffer2KHR");
  compile_deferred_nv = auto_cast get_device_proc_addr(device, "vkCompileDeferredNV");
  set_hdr_metadata_ext = auto_cast get_device_proc_addr(device, "vkSetHdrMetadataEXT");
  cmd_build_acceleration_structures_indirect_khr = auto_cast get_device_proc_addr(device, "vkCmdBuildAccelerationStructuresIndirectKHR");
  cmd_draw_indirect = auto_cast get_device_proc_addr(device, "vkCmdDrawIndirect");
  cmd_set_scissor_with_count_ext = auto_cast get_device_proc_addr(device, "vkCmdSetScissorWithCountEXT");
  merge_validation_caches_ext = auto_cast get_device_proc_addr(device, "vkMergeValidationCachesEXT");
  create_shared_swapchains_khr = auto_cast get_device_proc_addr(device, "vkCreateSharedSwapchainsKHR");
  get_device_group_present_capabilities_khr = auto_cast get_device_proc_addr(device, "vkGetDeviceGroupPresentCapabilitiesKHR");
  cmd_set_viewport_w_scaling_nv = auto_cast get_device_proc_addr(device, "vkCmdSetViewportWScalingNV");
  cmd_set_depth_bias = auto_cast get_device_proc_addr(device, "vkCmdSetDepthBias");
  cmd_set_coarse_sample_order_nv = auto_cast get_device_proc_addr(device, "vkCmdSetCoarseSampleOrderNV");
  get_buffer_device_address = auto_cast get_device_proc_addr(device, "vkGetBufferDeviceAddress");
  destroy_deferred_operation_khr = auto_cast get_device_proc_addr(device, "vkDestroyDeferredOperationKHR");
  cmd_pipeline_barrier_2khr = auto_cast get_device_proc_addr(device, "vkCmdPipelineBarrier2KHR");
  destroy_event = auto_cast get_device_proc_addr(device, "vkDestroyEvent");
  cmd_insert_debug_utils_label_ext = auto_cast get_device_proc_addr(device, "vkCmdInsertDebugUtilsLabelEXT");
  cmd_write_timestamp_2khr = auto_cast get_device_proc_addr(device, "vkCmdWriteTimestamp2KHR");
  get_image_drm_format_modifier_properties_ext = auto_cast get_device_proc_addr(device, "vkGetImageDrmFormatModifierPropertiesEXT");
  cmd_next_subpass = auto_cast get_device_proc_addr(device, "vkCmdNextSubpass");
  cmd_copy_buffer_to_image = auto_cast get_device_proc_addr(device, "vkCmdCopyBufferToImage");
  cmd_debug_marker_begin_ext = auto_cast get_device_proc_addr(device, "vkCmdDebugMarkerBeginEXT");
  get_memory_fd_khr = auto_cast get_device_proc_addr(device, "vkGetMemoryFdKHR");
  wait_for_fences = auto_cast get_device_proc_addr(device, "vkWaitForFences");
  cmd_set_event = auto_cast get_device_proc_addr(device, "vkCmdSetEvent");
  get_device_group_surface_present_modes_khr = auto_cast get_device_proc_addr(device, "vkGetDeviceGroupSurfacePresentModesKHR");
  destroy_acceleration_structure_nv = auto_cast get_device_proc_addr(device, "vkDestroyAccelerationStructureNV");
  queue_bind_sparse = auto_cast get_device_proc_addr(device, "vkQueueBindSparse");
  create_pipeline_layout = auto_cast get_device_proc_addr(device, "vkCreatePipelineLayout");
  debug_marker_set_object_tag_ext = auto_cast get_device_proc_addr(device, "vkDebugMarkerSetObjectTagEXT");
  destroy_image = auto_cast get_device_proc_addr(device, "vkDestroyImage");
  cmd_draw_indirect_byte_count_ext = auto_cast get_device_proc_addr(device, "vkCmdDrawIndirectByteCountEXT");
  acquire_profiling_lock_khr = auto_cast get_device_proc_addr(device, "vkAcquireProfilingLockKHR");
  register_device_event_ext = auto_cast get_device_proc_addr(device, "vkRegisterDeviceEventEXT");
  cmd_set_performance_override_intel = auto_cast get_device_proc_addr(device, "vkCmdSetPerformanceOverrideINTEL");
  cmd_set_depth_bounds = auto_cast get_device_proc_addr(device, "vkCmdSetDepthBounds");
  cmd_set_depth_compare_op_ext = auto_cast get_device_proc_addr(device, "vkCmdSetDepthCompareOpEXT");
  cmd_set_device_mask = auto_cast get_device_proc_addr(device, "vkCmdSetDeviceMask");
  destroy_framebuffer = auto_cast get_device_proc_addr(device, "vkDestroyFramebuffer");
  cmd_draw_indexed = auto_cast get_device_proc_addr(device, "vkCmdDrawIndexed");
  destroy_command_pool = auto_cast get_device_proc_addr(device, "vkDestroyCommandPool");
  cmd_execute_commands = auto_cast get_device_proc_addr(device, "vkCmdExecuteCommands");
  get_descriptor_set_layout_support = auto_cast get_device_proc_addr(device, "vkGetDescriptorSetLayoutSupport");
  wait_semaphores = auto_cast get_device_proc_addr(device, "vkWaitSemaphores");
  cmd_copy_query_pool_results = auto_cast get_device_proc_addr(device, "vkCmdCopyQueryPoolResults");
  cmd_reset_event = auto_cast get_device_proc_addr(device, "vkCmdResetEvent");
  end_command_buffer = auto_cast get_device_proc_addr(device, "vkEndCommandBuffer");
  destroy_acceleration_structure_khr = auto_cast get_device_proc_addr(device, "vkDestroyAccelerationStructureKHR");
  cmd_resolve_image_2khr = auto_cast get_device_proc_addr(device, "vkCmdResolveImage2KHR");
  bind_buffer_memory = auto_cast get_device_proc_addr(device, "vkBindBufferMemory");
  create_image_view = auto_cast get_device_proc_addr(device, "vkCreateImageView");
  get_image_sparse_memory_requirements_2 = auto_cast get_device_proc_addr(device, "vkGetImageSparseMemoryRequirements2");
  cmd_write_buffer_marker_2amd = auto_cast get_device_proc_addr(device, "vkCmdWriteBufferMarker2AMD");
  get_android_hardware_buffer_properties_android = auto_cast get_device_proc_addr(device, "vkGetAndroidHardwareBufferPropertiesANDROID");
  get_deferred_operation_result_khr = auto_cast get_device_proc_addr(device, "vkGetDeferredOperationResultKHR");
  cmd_set_event_2khr = auto_cast get_device_proc_addr(device, "vkCmdSetEvent2KHR");
  cmd_copy_image = auto_cast get_device_proc_addr(device, "vkCmdCopyImage");
  cmd_copy_buffer_to_image_2khr = auto_cast get_device_proc_addr(device, "vkCmdCopyBufferToImage2KHR");
  cmd_set_stencil_compare_mask = auto_cast get_device_proc_addr(device, "vkCmdSetStencilCompareMask");
  get_device_memory_commitment = auto_cast get_device_proc_addr(device, "vkGetDeviceMemoryCommitment");
  cmd_bind_pipeline = auto_cast get_device_proc_addr(device, "vkCmdBindPipeline");
  get_memory_win_32_handle_khr = auto_cast get_device_proc_addr(device, "vkGetMemoryWin32HandleKHR");
  get_device_queue_2 = auto_cast get_device_proc_addr(device, "vkGetDeviceQueue2");
  cmd_write_buffer_marker_amd = auto_cast get_device_proc_addr(device, "vkCmdWriteBufferMarkerAMD");
  get_device_group_peer_memory_features = auto_cast get_device_proc_addr(device, "vkGetDeviceGroupPeerMemoryFeatures");
  cmd_end_query_indexed_ext = auto_cast get_device_proc_addr(device, "vkCmdEndQueryIndexedEXT");
  destroy_shader_module = auto_cast get_device_proc_addr(device, "vkDestroyShaderModule");
  cmd_draw_mesh_tasks_indirect_count_nv = auto_cast get_device_proc_addr(device, "vkCmdDrawMeshTasksIndirectCountNV");
  get_acceleration_structure_memory_requirements_nv = auto_cast get_device_proc_addr(device, "vkGetAccelerationStructureMemoryRequirementsNV");
  cmd_set_performance_stream_marker_intel = auto_cast get_device_proc_addr(device, "vkCmdSetPerformanceStreamMarkerINTEL");
  cmd_begin_query_indexed_ext = auto_cast get_device_proc_addr(device, "vkCmdBeginQueryIndexedEXT");
  get_queue_checkpoint_data_nv = auto_cast get_device_proc_addr(device, "vkGetQueueCheckpointDataNV");
  build_acceleration_structures_khr = auto_cast get_device_proc_addr(device, "vkBuildAccelerationStructuresKHR");
  get_memory_win_32_handle_properties_khr = auto_cast get_device_proc_addr(device, "vkGetMemoryWin32HandlePropertiesKHR");
  create_deferred_operation_khr = auto_cast get_device_proc_addr(device, "vkCreateDeferredOperationKHR");
  cmd_reset_event_2khr = auto_cast get_device_proc_addr(device, "vkCmdResetEvent2KHR");
  get_image_view_handle_nvx = auto_cast get_device_proc_addr(device, "vkGetImageViewHandleNVX");
  get_image_memory_requirements_2 = auto_cast get_device_proc_addr(device, "vkGetImageMemoryRequirements2");
  register_display_event_ext = auto_cast get_device_proc_addr(device, "vkRegisterDisplayEventEXT");
  acquire_next_image_khr = auto_cast get_device_proc_addr(device, "vkAcquireNextImageKHR");
  cmd_draw_mesh_tasks_indirect_nv = auto_cast get_device_proc_addr(device, "vkCmdDrawMeshTasksIndirectNV");
  get_image_view_address_nvx = auto_cast get_device_proc_addr(device, "vkGetImageViewAddressNVX");
  cmd_copy_image_to_buffer_2khr = auto_cast get_device_proc_addr(device, "vkCmdCopyImageToBuffer2KHR");
  initialize_performance_api_intel = auto_cast get_device_proc_addr(device, "vkInitializePerformanceApiINTEL");
  map_memory = auto_cast get_device_proc_addr(device, "vkMapMemory");
  create_shader_module = auto_cast get_device_proc_addr(device, "vkCreateShaderModule");
  cmd_clear_attachments = auto_cast get_device_proc_addr(device, "vkCmdClearAttachments");
  cmd_set_stencil_reference = auto_cast get_device_proc_addr(device, "vkCmdSetStencilReference");
  cmd_blit_image_2khr = auto_cast get_device_proc_addr(device, "vkCmdBlitImage2KHR");
  create_buffer_view = auto_cast get_device_proc_addr(device, "vkCreateBufferView");
  queue_present_khr = auto_cast get_device_proc_addr(device, "vkQueuePresentKHR");
  destroy_sampler = auto_cast get_device_proc_addr(device, "vkDestroySampler");
  get_device_group_surface_present_modes_2ext = auto_cast get_device_proc_addr(device, "vkGetDeviceGroupSurfacePresentModes2EXT");
  cmd_end_conditional_rendering_ext = auto_cast get_device_proc_addr(device, "vkCmdEndConditionalRenderingEXT");
  queue_set_performance_configuration_intel = auto_cast get_device_proc_addr(device, "vkQueueSetPerformanceConfigurationINTEL");
  deferred_operation_join_khr = auto_cast get_device_proc_addr(device, "vkDeferredOperationJoinKHR");
  cmd_bind_pipeline_shader_group_nv = auto_cast get_device_proc_addr(device, "vkCmdBindPipelineShaderGroupNV");
  unmap_memory = auto_cast get_device_proc_addr(device, "vkUnmapMemory");
  get_image_memory_requirements = auto_cast get_device_proc_addr(device, "vkGetImageMemoryRequirements");
  create_indirect_commands_layout_nv = auto_cast get_device_proc_addr(device, "vkCreateIndirectCommandsLayoutNV");
  cmd_set_cull_mode_ext = auto_cast get_device_proc_addr(device, "vkCmdSetCullModeEXT");
  cmd_execute_generated_commands_nv = auto_cast get_device_proc_addr(device, "vkCmdExecuteGeneratedCommandsNV");
  create_acceleration_structure_nv = auto_cast get_device_proc_addr(device, "vkCreateAccelerationStructureNV");
  get_calibrated_timestamps_ext = auto_cast get_device_proc_addr(device, "vkGetCalibratedTimestampsEXT");
  cmd_set_discard_rectangle_ext = auto_cast get_device_proc_addr(device, "vkCmdSetDiscardRectangleEXT");
  cmd_begin_render_pass_2 = auto_cast get_device_proc_addr(device, "vkCmdBeginRenderPass2");
  destroy_render_pass = auto_cast get_device_proc_addr(device, "vkDestroyRenderPass");
  get_image_subresource_layout = auto_cast get_device_proc_addr(device, "vkGetImageSubresourceLayout");
  destroy_descriptor_update_template = auto_cast get_device_proc_addr(device, "vkDestroyDescriptorUpdateTemplate");
  destroy_sampler_ycbcr_conversion = auto_cast get_device_proc_addr(device, "vkDestroySamplerYcbcrConversion");
  queue_insert_debug_utils_label_ext = auto_cast get_device_proc_addr(device, "vkQueueInsertDebugUtilsLabelEXT");
  get_ray_tracing_shader_group_handles_khr = auto_cast get_device_proc_addr(device, "vkGetRayTracingShaderGroupHandlesKHR");
  bind_image_memory = auto_cast get_device_proc_addr(device, "vkBindImageMemory");
  create_command_pool = auto_cast get_device_proc_addr(device, "vkCreateCommandPool");
  cmd_debug_marker_end_ext = auto_cast get_device_proc_addr(device, "vkCmdDebugMarkerEndEXT");
  create_descriptor_set_layout = auto_cast get_device_proc_addr(device, "vkCreateDescriptorSetLayout");
  copy_acceleration_structure_khr = auto_cast get_device_proc_addr(device, "vkCopyAccelerationStructureKHR");
  create_ray_tracing_pipelines_khr = auto_cast get_device_proc_addr(device, "vkCreateRayTracingPipelinesKHR");
  cmd_end_render_pass = auto_cast get_device_proc_addr(device, "vkCmdEndRenderPass");
  cmd_push_descriptor_set_with_template_khr = auto_cast get_device_proc_addr(device, "vkCmdPushDescriptorSetWithTemplateKHR");
  get_queue_checkpoint_data_2nv = auto_cast get_device_proc_addr(device, "vkGetQueueCheckpointData2NV");
  reset_event = auto_cast get_device_proc_addr(device, "vkResetEvent");
  get_pipeline_cache_data = auto_cast get_device_proc_addr(device, "vkGetPipelineCacheData");
  cmd_end_transform_feedback_ext = auto_cast get_device_proc_addr(device, "vkCmdEndTransformFeedbackEXT");
  get_ray_tracing_shader_group_stack_size_khr = auto_cast get_device_proc_addr(device, "vkGetRayTracingShaderGroupStackSizeKHR");
  cmd_set_performance_marker_intel = auto_cast get_device_proc_addr(device, "vkCmdSetPerformanceMarkerINTEL");
  import_semaphore_win_32_handle_khr = auto_cast get_device_proc_addr(device, "vkImportSemaphoreWin32HandleKHR");
  get_buffer_memory_requirements = auto_cast get_device_proc_addr(device, "vkGetBufferMemoryRequirements");
  cmd_bind_descriptor_sets = auto_cast get_device_proc_addr(device, "vkCmdBindDescriptorSets");
  destroy_descriptor_set_layout = auto_cast get_device_proc_addr(device, "vkDestroyDescriptorSetLayout");
  get_swapchain_status_khr = auto_cast get_device_proc_addr(device, "vkGetSwapchainStatusKHR");
  get_device_queue = auto_cast get_device_proc_addr(device, "vkGetDeviceQueue");
  cmd_set_line_width = auto_cast get_device_proc_addr(device, "vkCmdSetLineWidth");
  cmd_blit_image = auto_cast get_device_proc_addr(device, "vkCmdBlitImage");
  create_sampler_ycbcr_conversion = auto_cast get_device_proc_addr(device, "vkCreateSamplerYcbcrConversion");
  enumerate_instance_extension_properties = auto_cast get_device_proc_addr(device, "vkEnumerateInstanceExtensionProperties");
  release_performance_configuration_intel = auto_cast get_device_proc_addr(device, "vkReleasePerformanceConfigurationINTEL");
  cmd_wait_events_2khr = auto_cast get_device_proc_addr(device, "vkCmdWaitEvents2KHR");
  cmd_set_primitive_topology_ext = auto_cast get_device_proc_addr(device, "vkCmdSetPrimitiveTopologyEXT");
  get_buffer_memory_requirements_2 = auto_cast get_device_proc_addr(device, "vkGetBufferMemoryRequirements2");
  queue_wait_idle = auto_cast get_device_proc_addr(device, "vkQueueWaitIdle");
  destroy_validation_cache_ext = auto_cast get_device_proc_addr(device, "vkDestroyValidationCacheEXT");
  acquire_next_image_2khr = auto_cast get_device_proc_addr(device, "vkAcquireNextImage2KHR");
  cmd_begin_render_pass = auto_cast get_device_proc_addr(device, "vkCmdBeginRenderPass");
  destroy_pipeline_layout = auto_cast get_device_proc_addr(device, "vkDestroyPipelineLayout");
  cmd_resolve_image = auto_cast get_device_proc_addr(device, "vkCmdResolveImage");
  destroy_indirect_commands_layout_nv = auto_cast get_device_proc_addr(device, "vkDestroyIndirectCommandsLayoutNV");
  get_memory_android_hardware_buffer_android = auto_cast get_device_proc_addr(device, "vkGetMemoryAndroidHardwareBufferANDROID");
  import_fence_fd_khr = auto_cast get_device_proc_addr(device, "vkImportFenceFdKHR");
  trim_command_pool = auto_cast get_device_proc_addr(device, "vkTrimCommandPool");
  get_semaphore_win_32_handle_khr = auto_cast get_device_proc_addr(device, "vkGetSemaphoreWin32HandleKHR");
  signal_semaphore = auto_cast get_device_proc_addr(device, "vkSignalSemaphore");
  cmd_draw_indexed_indirect_count = auto_cast get_device_proc_addr(device, "vkCmdDrawIndexedIndirectCount");
  queue_submit_2khr = auto_cast get_device_proc_addr(device, "vkQueueSubmit2KHR");
  create_graphics_pipelines = auto_cast get_device_proc_addr(device, "vkCreateGraphicsPipelines");
  cmd_begin_transform_feedback_ext = auto_cast get_device_proc_addr(device, "vkCmdBeginTransformFeedbackEXT");
  acquire_full_screen_exclusive_mode_ext = auto_cast get_device_proc_addr(device, "vkAcquireFullScreenExclusiveModeEXT");
  display_power_control_ext = auto_cast get_device_proc_addr(device, "vkDisplayPowerControlEXT");
  queue_begin_debug_utils_label_ext = auto_cast get_device_proc_addr(device, "vkQueueBeginDebugUtilsLabelEXT");
  get_ray_tracing_capture_replay_shader_group_handles_khr = auto_cast get_device_proc_addr(device, "vkGetRayTracingCaptureReplayShaderGroupHandlesKHR");
  cmd_copy_image_to_buffer = auto_cast get_device_proc_addr(device, "vkCmdCopyImageToBuffer");
  get_event_status = auto_cast get_device_proc_addr(device, "vkGetEventStatus");
  copy_acceleration_structure_to_memory_khr = auto_cast get_device_proc_addr(device, "vkCopyAccelerationStructureToMemoryKHR");
  get_fence_fd_khr = auto_cast get_device_proc_addr(device, "vkGetFenceFdKHR");
  cmd_draw_mesh_tasks_nv = auto_cast get_device_proc_addr(device, "vkCmdDrawMeshTasksNV");
  get_memory_win_32_handle_nv = auto_cast get_device_proc_addr(device, "vkGetMemoryWin32HandleNV");
  set_local_dimming_amd = auto_cast get_device_proc_addr(device, "vkSetLocalDimmingAMD");
  get_pipeline_executable_properties_khr = auto_cast get_device_proc_addr(device, "vkGetPipelineExecutablePropertiesKHR");
  destroy_buffer = auto_cast get_device_proc_addr(device, "vkDestroyBuffer");
  get_swapchain_images_khr = auto_cast get_device_proc_addr(device, "vkGetSwapchainImagesKHR");
  reset_descriptor_pool = auto_cast get_device_proc_addr(device, "vkResetDescriptorPool");
  create_descriptor_pool = auto_cast get_device_proc_addr(device, "vkCreateDescriptorPool");
  create_event = auto_cast get_device_proc_addr(device, "vkCreateEvent");
  destroy_device = auto_cast get_device_proc_addr(device, "vkDestroyDevice");
  get_fence_win_32_handle_khr = auto_cast get_device_proc_addr(device, "vkGetFenceWin32HandleKHR");
  cmd_write_acceleration_structures_properties_khr = auto_cast get_device_proc_addr(device, "vkCmdWriteAccelerationStructuresPropertiesKHR");
  enumerate_instance_version = auto_cast get_device_proc_addr(device, "vkEnumerateInstanceVersion");
  destroy_image_view = auto_cast get_device_proc_addr(device, "vkDestroyImageView");
  update_descriptor_sets = auto_cast get_device_proc_addr(device, "vkUpdateDescriptorSets");
  create_descriptor_update_template = auto_cast get_device_proc_addr(device, "vkCreateDescriptorUpdateTemplate");
  bind_acceleration_structure_memory_nv = auto_cast get_device_proc_addr(device, "vkBindAccelerationStructureMemoryNV");
  cmd_update_buffer = auto_cast get_device_proc_addr(device, "vkCmdUpdateBuffer");
  get_private_data_ext = auto_cast get_device_proc_addr(device, "vkGetPrivateDataEXT");
  cmd_debug_marker_insert_ext = auto_cast get_device_proc_addr(device, "vkCmdDebugMarkerInsertEXT");
  cmd_draw = auto_cast get_device_proc_addr(device, "vkCmdDraw");
  enumerate_instance_layer_properties = auto_cast get_device_proc_addr(device, "vkEnumerateInstanceLayerProperties");
  destroy_pipeline_cache = auto_cast get_device_proc_addr(device, "vkDestroyPipelineCache");
  create_pipeline_cache = auto_cast get_device_proc_addr(device, "vkCreatePipelineCache");
  begin_command_buffer = auto_cast get_device_proc_addr(device, "vkBeginCommandBuffer");
  free_descriptor_sets = auto_cast get_device_proc_addr(device, "vkFreeDescriptorSets");
  create_framebuffer = auto_cast get_device_proc_addr(device, "vkCreateFramebuffer");
  release_profiling_lock_khr = auto_cast get_device_proc_addr(device, "vkReleaseProfilingLockKHR");
  cmd_push_constants = auto_cast get_device_proc_addr(device, "vkCmdPushConstants");
  get_render_area_granularity = auto_cast get_device_proc_addr(device, "vkGetRenderAreaGranularity");
  get_performance_parameter_intel = auto_cast get_device_proc_addr(device, "vkGetPerformanceParameterINTEL");
  set_debug_utils_object_tag_ext = auto_cast get_device_proc_addr(device, "vkSetDebugUtilsObjectTagEXT");
  set_private_data_ext = auto_cast get_device_proc_addr(device, "vkSetPrivateDataEXT");
  cmd_pipeline_barrier = auto_cast get_device_proc_addr(device, "vkCmdPipelineBarrier");
  update_descriptor_set_with_template = auto_cast get_device_proc_addr(device, "vkUpdateDescriptorSetWithTemplate");
  cmd_end_render_pass_2 = auto_cast get_device_proc_addr(device, "vkCmdEndRenderPass2");
  cmd_set_exclusive_scissor_nv = auto_cast get_device_proc_addr(device, "vkCmdSetExclusiveScissorNV");
  cmd_next_subpass_2 = auto_cast get_device_proc_addr(device, "vkCmdNextSubpass2");
  create_semaphore = auto_cast get_device_proc_addr(device, "vkCreateSemaphore");
  create_fence = auto_cast get_device_proc_addr(device, "vkCreateFence");
  cmd_write_acceleration_structures_properties_nv = auto_cast get_device_proc_addr(device, "vkCmdWriteAccelerationStructuresPropertiesNV");
  destroy_semaphore = auto_cast get_device_proc_addr(device, "vkDestroySemaphore");
  destroy_buffer_view = auto_cast get_device_proc_addr(device, "vkDestroyBufferView");
  cmd_trace_rays_indirect_khr = auto_cast get_device_proc_addr(device, "vkCmdTraceRaysIndirectKHR");
  acquire_performance_configuration_intel = auto_cast get_device_proc_addr(device, "vkAcquirePerformanceConfigurationINTEL");
  get_pipeline_executable_internal_representations_khr = auto_cast get_device_proc_addr(device, "vkGetPipelineExecutableInternalRepresentationsKHR");
  cmd_copy_acceleration_structure_nv = auto_cast get_device_proc_addr(device, "vkCmdCopyAccelerationStructureNV");
  create_private_data_slot_ext = auto_cast get_device_proc_addr(device, "vkCreatePrivateDataSlotEXT");
  cmd_dispatch_indirect = auto_cast get_device_proc_addr(device, "vkCmdDispatchIndirect");
  cmd_set_depth_bounds_test_enable_ext = auto_cast get_device_proc_addr(device, "vkCmdSetDepthBoundsTestEnableEXT");
  cmd_set_sample_locations_ext = auto_cast get_device_proc_addr(device, "vkCmdSetSampleLocationsEXT");
  get_memory_fd_properties_khr = auto_cast get_device_proc_addr(device, "vkGetMemoryFdPropertiesKHR");
  cmd_copy_image_2khr = auto_cast get_device_proc_addr(device, "vkCmdCopyImage2KHR");
  cmd_write_timestamp = auto_cast get_device_proc_addr(device, "vkCmdWriteTimestamp");
  get_semaphore_fd_khr = auto_cast get_device_proc_addr(device, "vkGetSemaphoreFdKHR");
  cmd_set_stencil_op_ext = auto_cast get_device_proc_addr(device, "vkCmdSetStencilOpEXT");
  cmd_set_fragment_shading_rate_khr = auto_cast get_device_proc_addr(device, "vkCmdSetFragmentShadingRateKHR");
  queue_end_debug_utils_label_ext = auto_cast get_device_proc_addr(device, "vkQueueEndDebugUtilsLabelEXT");
  create_sampler = auto_cast get_device_proc_addr(device, "vkCreateSampler");
  cmd_end_query = auto_cast get_device_proc_addr(device, "vkCmdEndQuery");
  cmd_push_descriptor_set_khr = auto_cast get_device_proc_addr(device, "vkCmdPushDescriptorSetKHR");
  cmd_build_acceleration_structure_nv = auto_cast get_device_proc_addr(device, "vkCmdBuildAccelerationStructureNV");
  cmd_set_ray_tracing_pipeline_stack_size_khr = auto_cast get_device_proc_addr(device, "vkCmdSetRayTracingPipelineStackSizeKHR");
  get_deferred_operation_max_concurrency_khr = auto_cast get_device_proc_addr(device, "vkGetDeferredOperationMaxConcurrencyKHR");
  write_acceleration_structures_properties_khr = auto_cast get_device_proc_addr(device, "vkWriteAccelerationStructuresPropertiesKHR");
  get_acceleration_structure_build_sizes_khr = auto_cast get_device_proc_addr(device, "vkGetAccelerationStructureBuildSizesKHR");
  reset_fences = auto_cast get_device_proc_addr(device, "vkResetFences");
  cmd_trace_rays_nv = auto_cast get_device_proc_addr(device, "vkCmdTraceRaysNV");
  allocate_memory = auto_cast get_device_proc_addr(device, "vkAllocateMemory");
  reset_command_pool = auto_cast get_device_proc_addr(device, "vkResetCommandPool");
  allocate_descriptor_sets = auto_cast get_device_proc_addr(device, "vkAllocateDescriptorSets");
  create_image = auto_cast get_device_proc_addr(device, "vkCreateImage");
  destroy_descriptor_pool = auto_cast get_device_proc_addr(device, "vkDestroyDescriptorPool");
  cmd_copy_buffer = auto_cast get_device_proc_addr(device, "vkCmdCopyBuffer");
  create_validation_cache_ext = auto_cast get_device_proc_addr(device, "vkCreateValidationCacheEXT");
  queue_submit = auto_cast get_device_proc_addr(device, "vkQueueSubmit");
  invalidate_mapped_memory_ranges = auto_cast get_device_proc_addr(device, "vkInvalidateMappedMemoryRanges");
  cmd_wait_events = auto_cast get_device_proc_addr(device, "vkCmdWaitEvents");
  get_swapchain_counter_ext = auto_cast get_device_proc_addr(device, "vkGetSwapchainCounterEXT");
  cmd_draw_indirect_count = auto_cast get_device_proc_addr(device, "vkCmdDrawIndirectCount");
  cmd_bind_shading_rate_image_nv = auto_cast get_device_proc_addr(device, "vkCmdBindShadingRateImageNV");
  cmd_copy_acceleration_structure_khr = auto_cast get_device_proc_addr(device, "vkCmdCopyAccelerationStructureKHR");
  set_event = auto_cast get_device_proc_addr(device, "vkSetEvent");
  get_generated_commands_memory_requirements_nv = auto_cast get_device_proc_addr(device, "vkGetGeneratedCommandsMemoryRequirementsNV");
  bind_image_memory_2 = auto_cast get_device_proc_addr(device, "vkBindImageMemory2");
  get_past_presentation_timing_google = auto_cast get_device_proc_addr(device, "vkGetPastPresentationTimingGOOGLE");
  create_query_pool = auto_cast get_device_proc_addr(device, "vkCreateQueryPool");
  free_memory = auto_cast get_device_proc_addr(device, "vkFreeMemory");
  cmd_set_depth_test_enable_ext = auto_cast get_device_proc_addr(device, "vkCmdSetDepthTestEnableEXT");
  uninitialize_performance_api_intel = auto_cast get_device_proc_addr(device, "vkUninitializePerformanceApiINTEL");
  reset_command_buffer = auto_cast get_device_proc_addr(device, "vkResetCommandBuffer");
  get_refresh_cycle_duration_google = auto_cast get_device_proc_addr(device, "vkGetRefreshCycleDurationGOOGLE");
  cmd_set_checkpoint_nv = auto_cast get_device_proc_addr(device, "vkCmdSetCheckpointNV");
  cmd_bind_transform_feedback_buffers_ext = auto_cast get_device_proc_addr(device, "vkCmdBindTransformFeedbackBuffersEXT");
  get_fence_status = auto_cast get_device_proc_addr(device, "vkGetFenceStatus");
  create_buffer = auto_cast get_device_proc_addr(device, "vkCreateBuffer");
  cmd_preprocess_generated_commands_nv = auto_cast get_device_proc_addr(device, "vkCmdPreprocessGeneratedCommandsNV");
  allocate_command_buffers = auto_cast get_device_proc_addr(device, "vkAllocateCommandBuffers");
  cmd_begin_query = auto_cast get_device_proc_addr(device, "vkCmdBeginQuery");
  create_swapchain_khr = auto_cast get_device_proc_addr(device, "vkCreateSwapchainKHR");
  cmd_set_viewport_shading_rate_palette_nv = auto_cast get_device_proc_addr(device, "vkCmdSetViewportShadingRatePaletteNV");
  cmd_copy_acceleration_structure_to_memory_khr = auto_cast get_device_proc_addr(device, "vkCmdCopyAccelerationStructureToMemoryKHR");
  destroy_query_pool = auto_cast get_device_proc_addr(device, "vkDestroyQueryPool");
  cmd_dispatch_base = auto_cast get_device_proc_addr(device, "vkCmdDispatchBase");
  get_validation_cache_data_ext = auto_cast get_device_proc_addr(device, "vkGetValidationCacheDataEXT");
  copy_memory_to_acceleration_structure_khr = auto_cast get_device_proc_addr(device, "vkCopyMemoryToAccelerationStructureKHR");
  cmd_trace_rays_khr = auto_cast get_device_proc_addr(device, "vkCmdTraceRaysKHR");
  reset_query_pool = auto_cast get_device_proc_addr(device, "vkResetQueryPool");
  cmd_bind_index_buffer = auto_cast get_device_proc_addr(device, "vkCmdBindIndexBuffer");
  cmd_bind_vertex_buffers = auto_cast get_device_proc_addr(device, "vkCmdBindVertexBuffers");
  create_render_pass = auto_cast get_device_proc_addr(device, "vkCreateRenderPass");
  create_compute_pipelines = auto_cast get_device_proc_addr(device, "vkCreateComputePipelines");
  debug_marker_set_object_name_ext = auto_cast get_device_proc_addr(device, "vkDebugMarkerSetObjectNameEXT");
  import_semaphore_fd_khr = auto_cast get_device_proc_addr(device, "vkImportSemaphoreFdKHR");
  bind_buffer_memory_2 = auto_cast get_device_proc_addr(device, "vkBindBufferMemory2");
  cmd_clear_depth_stencil_image = auto_cast get_device_proc_addr(device, "vkCmdClearDepthStencilImage");
  set_debug_utils_object_name_ext = auto_cast get_device_proc_addr(device, "vkSetDebugUtilsObjectNameEXT");
  merge_pipeline_caches = auto_cast get_device_proc_addr(device, "vkMergePipelineCaches");
  free_command_buffers = auto_cast get_device_proc_addr(device, "vkFreeCommandBuffers");
  destroy_pipeline = auto_cast get_device_proc_addr(device, "vkDestroyPipeline");
  get_memory_host_pointer_properties_ext = auto_cast get_device_proc_addr(device, "vkGetMemoryHostPointerPropertiesEXT");
  create_render_pass_2 = auto_cast get_device_proc_addr(device, "vkCreateRenderPass2");
  cmd_copy_memory_to_acceleration_structure_khr = auto_cast get_device_proc_addr(device, "vkCmdCopyMemoryToAccelerationStructureKHR");
  get_acceleration_structure_handle_nv = auto_cast get_device_proc_addr(device, "vkGetAccelerationStructureHandleNV");
  destroy_fence = auto_cast get_device_proc_addr(device, "vkDestroyFence");
  get_device_acceleration_structure_compatibility_khr = auto_cast get_device_proc_addr(device, "vkGetDeviceAccelerationStructureCompatibilityKHR");
  get_image_sparse_memory_requirements = auto_cast get_device_proc_addr(device, "vkGetImageSparseMemoryRequirements");
  get_query_pool_results = auto_cast get_device_proc_addr(device, "vkGetQueryPoolResults");
  cmd_set_stencil_write_mask = auto_cast get_device_proc_addr(device, "vkCmdSetStencilWriteMask");
  import_fence_win_32_handle_khr = auto_cast get_device_proc_addr(device, "vkImportFenceWin32HandleKHR");
  get_device_memory_opaque_capture_address = auto_cast get_device_proc_addr(device, "vkGetDeviceMemoryOpaqueCaptureAddress");
  cmd_set_line_stipple_ext = auto_cast get_device_proc_addr(device, "vkCmdSetLineStippleEXT");
  cmd_set_front_face_ext = auto_cast get_device_proc_addr(device, "vkCmdSetFrontFaceEXT");
  cmd_draw_indexed_indirect = auto_cast get_device_proc_addr(device, "vkCmdDrawIndexedIndirect");
  cmd_reset_query_pool = auto_cast get_device_proc_addr(device, "vkCmdResetQueryPool");
  release_full_screen_exclusive_mode_ext = auto_cast get_device_proc_addr(device, "vkReleaseFullScreenExclusiveModeEXT");
  cmd_set_viewport_with_count_ext = auto_cast get_device_proc_addr(device, "vkCmdSetViewportWithCountEXT");
  cmd_begin_conditional_rendering_ext = auto_cast get_device_proc_addr(device, "vkCmdBeginConditionalRenderingEXT");
  cmd_fill_buffer = auto_cast get_device_proc_addr(device, "vkCmdFillBuffer");
  cmd_bind_vertex_buffers_2ext = auto_cast get_device_proc_addr(device, "vkCmdBindVertexBuffers2EXT");
  cmd_set_fragment_shading_rate_enum_nv = auto_cast get_device_proc_addr(device, "vkCmdSetFragmentShadingRateEnumNV");
  get_buffer_opaque_capture_address = auto_cast get_device_proc_addr(device, "vkGetBufferOpaqueCaptureAddress");
  create_acceleration_structure_khr = auto_cast get_device_proc_addr(device, "vkCreateAccelerationStructureKHR");
  cmd_set_depth_write_enable_ext = auto_cast get_device_proc_addr(device, "vkCmdSetDepthWriteEnableEXT");
  flush_mapped_memory_ranges = auto_cast get_device_proc_addr(device, "vkFlushMappedMemoryRanges");
}


@(link_name="get_semaphore_counter_value") get_semaphore_counter_value:proc(device:  Device, semaphore:  Semaphore, pValue: ^u64) ->  Result;
@(link_name="cmd_dispatch") cmd_dispatch:proc(commandBuffer:  CommandBuffer, groupCountX:  u32, groupCountY:  u32, groupCountZ:  u32) ->  void;
@(link_name="create_ray_tracing_pipelines_nv") create_ray_tracing_pipelines_nv:proc(device:  Device, pipelineCache:  PipelineCache, createInfoCount:  u32, pCreateInfos: ^RayTracingPipelineCreateInfoNV, pAllocator: ^AllocationCallbacks, pPipelines: ^Pipeline) ->  Result;
@(link_name="device_wait_idle") device_wait_idle:proc(device:  Device) ->  Result;
@(link_name="create_win_32_surface_khr") create_win_32_surface_khr:proc(instance:  Instance, pCreateInfo: ^Win32SurfaceCreateInfoKHR, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="get_shader_info_amd") get_shader_info_amd:proc(device:  Device, pipeline:  Pipeline, shaderStage:  ShaderStageFlags, infoType:  ShaderInfoTypeAMD, pInfoSize: ^uint, pInfo: ^void) ->  Result;
@(link_name="cmd_set_scissor") cmd_set_scissor:proc(commandBuffer:  CommandBuffer, firstScissor:  u32, scissorCount:  u32, pScissors: ^Rect2D) ->  void;
@(link_name="cmd_set_blend_constants") cmd_set_blend_constants:proc(commandBuffer:  CommandBuffer, blendConstants:  ^[4]f32) ->  void;
@(link_name="cmd_begin_debug_utils_label_ext") cmd_begin_debug_utils_label_ext:proc(commandBuffer:  CommandBuffer, pLabelInfo: ^DebugUtilsLabelEXT) ->  void;
@(link_name="cmd_set_viewport") cmd_set_viewport:proc(commandBuffer:  CommandBuffer, firstViewport:  u32, viewportCount:  u32, pViewports: ^Viewport) ->  void;
@(link_name="get_pipeline_executable_statistics_khr") get_pipeline_executable_statistics_khr:proc(device:  Device, pExecutableInfo: ^PipelineExecutableInfoKHR, pStatisticCount: ^u32, pStatistics: ^PipelineExecutableStatisticKHR) ->  Result;
@(link_name="cmd_end_debug_utils_label_ext") cmd_end_debug_utils_label_ext:proc(commandBuffer:  CommandBuffer) ->  void;
@(link_name="cmd_build_acceleration_structures_khr") cmd_build_acceleration_structures_khr:proc(commandBuffer:  CommandBuffer, infoCount:  u32, pInfos: ^AccelerationStructureBuildGeometryInfoKHR, ppBuildRangeInfos: ^^AccelerationStructureBuildRangeInfoKHR) ->  void;
@(link_name="get_acceleration_structure_device_address_khr") get_acceleration_structure_device_address_khr:proc(device:  Device, pInfo: ^AccelerationStructureDeviceAddressInfoKHR) ->  DeviceAddress;
@(link_name="destroy_swapchain_khr") destroy_swapchain_khr:proc(device:  Device, swapchain:  SwapchainKHR, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_clear_color_image") cmd_clear_color_image:proc(commandBuffer:  CommandBuffer, image:  Image, imageLayout:  ImageLayout, pColor: ^ClearColorValue, rangeCount:  u32, pRanges: ^ImageSubresourceRange) ->  void;
@(link_name="cmd_set_stencil_test_enable_ext") cmd_set_stencil_test_enable_ext:proc(commandBuffer:  CommandBuffer, stencilTestEnable:  Bool32) ->  void;
@(link_name="destroy_private_data_slot_ext") destroy_private_data_slot_ext:proc(device:  Device, privateDataSlot:  PrivateDataSlotEXT, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_copy_buffer_2khr") cmd_copy_buffer_2khr:proc(commandBuffer:  CommandBuffer, pCopyBufferInfo: ^CopyBufferInfo2KHR) ->  void;
@(link_name="compile_deferred_nv") compile_deferred_nv:proc(device:  Device, pipeline:  Pipeline, shader:  u32) ->  Result;
@(link_name="debug_report_message_ext") debug_report_message_ext:proc(instance:  Instance, flags:  DebugReportFlagsEXT, objectType:  DebugReportObjectTypeEXT, object:  u64, location:  uint, messageCode:  i32, pLayerPrefix: cstring, pMessage: cstring) ->  void;
@(link_name="set_hdr_metadata_ext") set_hdr_metadata_ext:proc(device:  Device, swapchainCount:  u32, pSwapchains: ^SwapchainKHR, pMetadata: ^HdrMetadataEXT) ->  void;
@(link_name="get_physical_device_multisample_properties_ext") get_physical_device_multisample_properties_ext:proc(physicalDevice:  PhysicalDevice, samples:  SampleCountFlags, pMultisampleProperties: ^MultisamplePropertiesEXT) ->  void;
@(link_name="cmd_build_acceleration_structures_indirect_khr") cmd_build_acceleration_structures_indirect_khr:proc(commandBuffer:  CommandBuffer, infoCount:  u32, pInfos: ^AccelerationStructureBuildGeometryInfoKHR, pIndirectDeviceAddresses: ^DeviceAddress, pIndirectStrides: ^u32, ppMaxPrimitiveCounts: ^^u32) ->  void;
@(link_name="cmd_draw_indirect") cmd_draw_indirect:proc(commandBuffer:  CommandBuffer, buffer:  Buffer, offset:  DeviceSize, drawCount:  u32, stride:  u32) ->  void;
@(link_name="create_image_pipe_surface_fuchsia") create_image_pipe_surface_fuchsia:proc(instance:  Instance, pCreateInfo: ^ImagePipeSurfaceCreateInfoFUCHSIA, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="cmd_set_scissor_with_count_ext") cmd_set_scissor_with_count_ext:proc(commandBuffer:  CommandBuffer, scissorCount:  u32, pScissors: ^Rect2D) ->  void;
@(link_name="create_xcb_surface_khr") create_xcb_surface_khr:proc(instance:  Instance, pCreateInfo: ^XcbSurfaceCreateInfoKHR, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="merge_validation_caches_ext") merge_validation_caches_ext:proc(device:  Device, dstCache:  ValidationCacheEXT, srcCacheCount:  u32, pSrcCaches: ^ValidationCacheEXT) ->  Result;
@(link_name="create_shared_swapchains_khr") create_shared_swapchains_khr:proc(device:  Device, swapchainCount:  u32, pCreateInfos: ^SwapchainCreateInfoKHR, pAllocator: ^AllocationCallbacks, pSwapchains: ^SwapchainKHR) ->  Result;
@(link_name="get_device_group_present_capabilities_khr") get_device_group_present_capabilities_khr:proc(device:  Device, pDeviceGroupPresentCapabilities: ^DeviceGroupPresentCapabilitiesKHR) ->  Result;
@(link_name="cmd_set_viewport_w_scaling_nv") cmd_set_viewport_w_scaling_nv:proc(commandBuffer:  CommandBuffer, firstViewport:  u32, viewportCount:  u32, pViewportWScalings: ^ViewportWScalingNV) ->  void;
@(link_name="get_device_proc_addr") get_device_proc_addr:proc(device:  Device, pName: cstring) ->  PFN_vkVoidFunction;
@(link_name="cmd_set_depth_bias") cmd_set_depth_bias:proc(commandBuffer:  CommandBuffer, depthBiasConstantFactor:  f32, depthBiasClamp:  f32, depthBiasSlopeFactor:  f32) ->  void;
@(link_name="acquire_winrt_display_nv") acquire_winrt_display_nv:proc(physicalDevice:  PhysicalDevice, display:  DisplayKHR) ->  Result;
@(link_name="cmd_set_coarse_sample_order_nv") cmd_set_coarse_sample_order_nv:proc(commandBuffer:  CommandBuffer, sampleOrderType:  CoarseSampleOrderTypeNV, customSampleOrderCount:  u32, pCustomSampleOrders: ^CoarseSampleOrderCustomNV) ->  void;
@(link_name="get_physical_device_cooperative_matrix_properties_nv") get_physical_device_cooperative_matrix_properties_nv:proc(physicalDevice:  PhysicalDevice, pPropertyCount: ^u32, pProperties: ^CooperativeMatrixPropertiesNV) ->  Result;
@(link_name="get_buffer_device_address") get_buffer_device_address:proc(device:  Device, pInfo: ^BufferDeviceAddressInfo) ->  DeviceAddress;
@(link_name="destroy_deferred_operation_khr") destroy_deferred_operation_khr:proc(device:  Device, operation:  DeferredOperationKHR, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_pipeline_barrier_2khr") cmd_pipeline_barrier_2khr:proc(commandBuffer:  CommandBuffer, pDependencyInfo: ^DependencyInfoKHR) ->  void;
@(link_name="destroy_event") destroy_event:proc(device:  Device, event:  Event, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_physical_device_external_image_format_properties_nv") get_physical_device_external_image_format_properties_nv:proc(physicalDevice:  PhysicalDevice, format:  Format, type:  ImageType, tiling:  ImageTiling, usage:  ImageUsageFlags, flags:  ImageCreateFlags, externalHandleType:  ExternalMemoryHandleTypeFlagsNV, pExternalImageFormatProperties: ^ExternalImageFormatPropertiesNV) ->  Result;
@(link_name="cmd_insert_debug_utils_label_ext") cmd_insert_debug_utils_label_ext:proc(commandBuffer:  CommandBuffer, pLabelInfo: ^DebugUtilsLabelEXT) ->  void;
@(link_name="cmd_write_timestamp_2khr") cmd_write_timestamp_2khr:proc(commandBuffer:  CommandBuffer, stage:  PipelineStageFlags2KHR, queryPool:  QueryPool, query:  u32) ->  void;
@(link_name="get_physical_device_screen_presentation_support_qnx") get_physical_device_screen_presentation_support_qnx:proc(physicalDevice:  PhysicalDevice, queueFamilyIndex:  u32, window: ^_screen_window) ->  Bool32;
@(link_name="get_image_drm_format_modifier_properties_ext") get_image_drm_format_modifier_properties_ext:proc(device:  Device, image:  Image, pProperties: ^ImageDrmFormatModifierPropertiesEXT) ->  Result;
@(link_name="cmd_next_subpass") cmd_next_subpass:proc(commandBuffer:  CommandBuffer, contents:  SubpassContents) ->  void;
@(link_name="cmd_copy_buffer_to_image") cmd_copy_buffer_to_image:proc(commandBuffer:  CommandBuffer, srcBuffer:  Buffer, dstImage:  Image, dstImageLayout:  ImageLayout, regionCount:  u32, pRegions: ^BufferImageCopy) ->  void;
@(link_name="get_physical_device_format_properties_2") get_physical_device_format_properties_2:proc(physicalDevice:  PhysicalDevice, format:  Format, pFormatProperties: ^FormatProperties2) ->  void;
@(link_name="cmd_debug_marker_begin_ext") cmd_debug_marker_begin_ext:proc(commandBuffer:  CommandBuffer, pMarkerInfo: ^DebugMarkerMarkerInfoEXT) ->  void;
@(link_name="get_memory_fd_khr") get_memory_fd_khr:proc(device:  Device, pGetFdInfo: ^MemoryGetFdInfoKHR, pFd: ^i32) ->  Result;
@(link_name="wait_for_fences") wait_for_fences:proc(device:  Device, fenceCount:  u32, pFences: ^Fence, waitAll:  Bool32, timeout:  u64) ->  Result;
@(link_name="cmd_set_event") cmd_set_event:proc(commandBuffer:  CommandBuffer, event:  Event, stageMask:  PipelineStageFlags) ->  void;
@(link_name="create_ios_surface_mvk") create_ios_surface_mvk:proc(instance:  Instance, pCreateInfo: ^IOSSurfaceCreateInfoMVK, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="get_device_group_surface_present_modes_khr") get_device_group_surface_present_modes_khr:proc(device:  Device, surface:  SurfaceKHR, pModes: ^DeviceGroupPresentModeFlagsKHR) ->  Result;
@(link_name="destroy_acceleration_structure_nv") destroy_acceleration_structure_nv:proc(device:  Device, accelerationStructure:  AccelerationStructureNV, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="create_display_plane_surface_khr") create_display_plane_surface_khr:proc(instance:  Instance, pCreateInfo: ^DisplaySurfaceCreateInfoKHR, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="queue_bind_sparse") queue_bind_sparse:proc(queue:  Queue, bindInfoCount:  u32, pBindInfo: ^BindSparseInfo, fence:  Fence) ->  Result;
@(link_name="create_pipeline_layout") create_pipeline_layout:proc(device:  Device, pCreateInfo: ^PipelineLayoutCreateInfo, pAllocator: ^AllocationCallbacks, pPipelineLayout: ^PipelineLayout) ->  Result;
@(link_name="debug_marker_set_object_tag_ext") debug_marker_set_object_tag_ext:proc(device:  Device, pTagInfo: ^DebugMarkerObjectTagInfoEXT) ->  Result;
@(link_name="destroy_image") destroy_image:proc(device:  Device, image:  Image, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_physical_device_surface_present_modes_2ext") get_physical_device_surface_present_modes_2ext:proc(physicalDevice:  PhysicalDevice, pSurfaceInfo: ^PhysicalDeviceSurfaceInfo2KHR, pPresentModeCount: ^u32, pPresentModes: ^PresentModeKHR) ->  Result;
@(link_name="cmd_draw_indirect_byte_count_ext") cmd_draw_indirect_byte_count_ext:proc(commandBuffer:  CommandBuffer, instanceCount:  u32, firstInstance:  u32, counterBuffer:  Buffer, counterBufferOffset:  DeviceSize, counterOffset:  u32, vertexStride:  u32) ->  void;
@(link_name="acquire_profiling_lock_khr") acquire_profiling_lock_khr:proc(device:  Device, pInfo: ^AcquireProfilingLockInfoKHR) ->  Result;
@(link_name="register_device_event_ext") register_device_event_ext:proc(device:  Device, pDeviceEventInfo: ^DeviceEventInfoEXT, pAllocator: ^AllocationCallbacks, pFence: ^Fence) ->  Result;
@(link_name="get_physical_device_present_rectangles_khr") get_physical_device_present_rectangles_khr:proc(physicalDevice:  PhysicalDevice, surface:  SurfaceKHR, pRectCount: ^u32, pRects: ^Rect2D) ->  Result;
@(link_name="cmd_set_performance_override_intel") cmd_set_performance_override_intel:proc(commandBuffer:  CommandBuffer, pOverrideInfo: ^PerformanceOverrideInfoINTEL) ->  Result;
@(link_name="cmd_set_depth_bounds") cmd_set_depth_bounds:proc(commandBuffer:  CommandBuffer, minDepthBounds:  f32, maxDepthBounds:  f32) ->  void;
@(link_name="get_physical_device_properties_2") get_physical_device_properties_2:proc(physicalDevice:  PhysicalDevice, pProperties: ^PhysicalDeviceProperties2) ->  void;
@(link_name="get_physical_device_display_plane_properties_2khr") get_physical_device_display_plane_properties_2khr:proc(physicalDevice:  PhysicalDevice, pPropertyCount: ^u32, pProperties: ^DisplayPlaneProperties2KHR) ->  Result;
@(link_name="cmd_set_depth_compare_op_ext") cmd_set_depth_compare_op_ext:proc(commandBuffer:  CommandBuffer, depthCompareOp:  CompareOp) ->  void;
@(link_name="get_physical_device_fragment_shading_rates_khr") get_physical_device_fragment_shading_rates_khr:proc(physicalDevice:  PhysicalDevice, pFragmentShadingRateCount: ^u32, pFragmentShadingRates: ^PhysicalDeviceFragmentShadingRateKHR) ->  Result;
@(link_name="create_stream_descriptor_surface_ggp") create_stream_descriptor_surface_ggp:proc(instance:  Instance, pCreateInfo: ^StreamDescriptorSurfaceCreateInfoGGP, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="create_instance") create_instance:proc(pCreateInfo: ^InstanceCreateInfo, pAllocator: ^AllocationCallbacks, pInstance: ^Instance) ->  Result;
@(link_name="cmd_set_device_mask") cmd_set_device_mask:proc(commandBuffer:  CommandBuffer, deviceMask:  u32) ->  void;
@(link_name="destroy_framebuffer") destroy_framebuffer:proc(device:  Device, framebuffer:  Framebuffer, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_draw_indexed") cmd_draw_indexed:proc(commandBuffer:  CommandBuffer, indexCount:  u32, instanceCount:  u32, firstIndex:  u32, vertexOffset:  i32, firstInstance:  u32) ->  void;
@(link_name="destroy_command_pool") destroy_command_pool:proc(device:  Device, commandPool:  CommandPool, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_execute_commands") cmd_execute_commands:proc(commandBuffer:  CommandBuffer, commandBufferCount:  u32, pCommandBuffers: ^CommandBuffer) ->  void;
@(link_name="get_descriptor_set_layout_support") get_descriptor_set_layout_support:proc(device:  Device, pCreateInfo: ^DescriptorSetLayoutCreateInfo, pSupport: ^DescriptorSetLayoutSupport) ->  void;
@(link_name="wait_semaphores") wait_semaphores:proc(device:  Device, pWaitInfo: ^SemaphoreWaitInfo, timeout:  u64) ->  Result;
@(link_name="cmd_copy_query_pool_results") cmd_copy_query_pool_results:proc(commandBuffer:  CommandBuffer, queryPool:  QueryPool, firstQuery:  u32, queryCount:  u32, dstBuffer:  Buffer, dstOffset:  DeviceSize, stride:  DeviceSize, flags:  QueryResultFlags) ->  void;
@(link_name="cmd_reset_event") cmd_reset_event:proc(commandBuffer:  CommandBuffer, event:  Event, stageMask:  PipelineStageFlags) ->  void;
@(link_name="end_command_buffer") end_command_buffer:proc(commandBuffer:  CommandBuffer) ->  Result;
@(link_name="destroy_acceleration_structure_khr") destroy_acceleration_structure_khr:proc(device:  Device, accelerationStructure:  AccelerationStructureKHR, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_resolve_image_2khr") cmd_resolve_image_2khr:proc(commandBuffer:  CommandBuffer, pResolveImageInfo: ^ResolveImageInfo2KHR) ->  void;
@(link_name="bind_buffer_memory") bind_buffer_memory:proc(device:  Device, buffer:  Buffer, memory:  DeviceMemory, memoryOffset:  DeviceSize) ->  Result;
@(link_name="create_image_view") create_image_view:proc(device:  Device, pCreateInfo: ^ImageViewCreateInfo, pAllocator: ^AllocationCallbacks, pView: ^ImageView) ->  Result;
@(link_name="get_image_sparse_memory_requirements_2") get_image_sparse_memory_requirements_2:proc(device:  Device, pInfo: ^ImageSparseMemoryRequirementsInfo2, pSparseMemoryRequirementCount: ^u32, pSparseMemoryRequirements: ^SparseImageMemoryRequirements2) ->  void;
@(link_name="cmd_write_buffer_marker_2amd") cmd_write_buffer_marker_2amd:proc(commandBuffer:  CommandBuffer, stage:  PipelineStageFlags2KHR, dstBuffer:  Buffer, dstOffset:  DeviceSize, marker:  u32) ->  void;
@(link_name="get_android_hardware_buffer_properties_android") get_android_hardware_buffer_properties_android:proc(device:  Device, buffer: ^AHardwareBuffer, pProperties: ^AndroidHardwareBufferPropertiesANDROID) ->  Result;
@(link_name="get_deferred_operation_result_khr") get_deferred_operation_result_khr:proc(device:  Device, operation:  DeferredOperationKHR) ->  Result;
@(link_name="cmd_set_event_2khr") cmd_set_event_2khr:proc(commandBuffer:  CommandBuffer, event:  Event, pDependencyInfo: ^DependencyInfoKHR) ->  void;
@(link_name="cmd_copy_image") cmd_copy_image:proc(commandBuffer:  CommandBuffer, srcImage:  Image, srcImageLayout:  ImageLayout, dstImage:  Image, dstImageLayout:  ImageLayout, regionCount:  u32, pRegions: ^ImageCopy) ->  void;
@(link_name="cmd_copy_buffer_to_image_2khr") cmd_copy_buffer_to_image_2khr:proc(commandBuffer:  CommandBuffer, pCopyBufferToImageInfo: ^CopyBufferToImageInfo2KHR) ->  void;
@(link_name="cmd_set_stencil_compare_mask") cmd_set_stencil_compare_mask:proc(commandBuffer:  CommandBuffer, faceMask:  StencilFaceFlags, compareMask:  u32) ->  void;
@(link_name="get_device_memory_commitment") get_device_memory_commitment:proc(device:  Device, memory:  DeviceMemory, pCommittedMemoryInBytes: ^DeviceSize) ->  void;
@(link_name="cmd_bind_pipeline") cmd_bind_pipeline:proc(commandBuffer:  CommandBuffer, pipelineBindPoint:  PipelineBindPoint, pipeline:  Pipeline) ->  void;
@(link_name="get_physical_device_display_plane_properties_khr") get_physical_device_display_plane_properties_khr:proc(physicalDevice:  PhysicalDevice, pPropertyCount: ^u32, pProperties: ^DisplayPlanePropertiesKHR) ->  Result;
@(link_name="get_memory_win_32_handle_khr") get_memory_win_32_handle_khr:proc(device:  Device, pGetWin32HandleInfo: ^MemoryGetWin32HandleInfoKHR, pHandle: ^HANDLE) ->  Result;
@(link_name="get_device_queue_2") get_device_queue_2:proc(device:  Device, pQueueInfo: ^DeviceQueueInfo2, pQueue: ^Queue) ->  void;
@(link_name="cmd_write_buffer_marker_amd") cmd_write_buffer_marker_amd:proc(commandBuffer:  CommandBuffer, pipelineStage:  PipelineStageFlags, dstBuffer:  Buffer, dstOffset:  DeviceSize, marker:  u32) ->  void;
@(link_name="get_device_group_peer_memory_features") get_device_group_peer_memory_features:proc(device:  Device, heapIndex:  u32, localDeviceIndex:  u32, remoteDeviceIndex:  u32, pPeerMemoryFeatures: ^PeerMemoryFeatureFlags) ->  void;
@(link_name="get_physical_device_xcb_presentation_support_khr") get_physical_device_xcb_presentation_support_khr:proc(physicalDevice:  PhysicalDevice, queueFamilyIndex:  u32, connection: ^xcb_connection_t, visual_id:  xcb_visualid_t) ->  Bool32;
@(link_name="cmd_end_query_indexed_ext") cmd_end_query_indexed_ext:proc(commandBuffer:  CommandBuffer, queryPool:  QueryPool, query:  u32, index:  u32) ->  void;
@(link_name="destroy_shader_module") destroy_shader_module:proc(device:  Device, shaderModule:  ShaderModule, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_draw_mesh_tasks_indirect_count_nv") cmd_draw_mesh_tasks_indirect_count_nv:proc(commandBuffer:  CommandBuffer, buffer:  Buffer, offset:  DeviceSize, countBuffer:  Buffer, countBufferOffset:  DeviceSize, maxDrawCount:  u32, stride:  u32) ->  void;
@(link_name="get_acceleration_structure_memory_requirements_nv") get_acceleration_structure_memory_requirements_nv:proc(device:  Device, pInfo: ^AccelerationStructureMemoryRequirementsInfoNV, pMemoryRequirements: ^MemoryRequirements2KHR) ->  void;
@(link_name="cmd_set_performance_stream_marker_intel") cmd_set_performance_stream_marker_intel:proc(commandBuffer:  CommandBuffer, pMarkerInfo: ^PerformanceStreamMarkerInfoINTEL) ->  Result;
@(link_name="cmd_begin_query_indexed_ext") cmd_begin_query_indexed_ext:proc(commandBuffer:  CommandBuffer, queryPool:  QueryPool, query:  u32, flags:  QueryControlFlags, index:  u32) ->  void;
@(link_name="enumerate_device_layer_properties") enumerate_device_layer_properties:proc(physicalDevice:  PhysicalDevice, pPropertyCount: ^u32, pProperties: ^LayerProperties) ->  Result;
@(link_name="get_queue_checkpoint_data_nv") get_queue_checkpoint_data_nv:proc(queue:  Queue, pCheckpointDataCount: ^u32, pCheckpointData: ^CheckpointDataNV) ->  void;
@(link_name="build_acceleration_structures_khr") build_acceleration_structures_khr:proc(device:  Device, deferredOperation:  DeferredOperationKHR, infoCount:  u32, pInfos: ^AccelerationStructureBuildGeometryInfoKHR, ppBuildRangeInfos: ^^AccelerationStructureBuildRangeInfoKHR) ->  Result;
@(link_name="get_memory_win_32_handle_properties_khr") get_memory_win_32_handle_properties_khr:proc(device:  Device, handleType:  ExternalMemoryHandleTypeFlags, handle:  HANDLE, pMemoryWin32HandleProperties: ^MemoryWin32HandlePropertiesKHR) ->  Result;
@(link_name="create_deferred_operation_khr") create_deferred_operation_khr:proc(device:  Device, pAllocator: ^AllocationCallbacks, pDeferredOperation: ^DeferredOperationKHR) ->  Result;
@(link_name="cmd_reset_event_2khr") cmd_reset_event_2khr:proc(commandBuffer:  CommandBuffer, event:  Event, stageMask:  PipelineStageFlags2KHR) ->  void;
@(link_name="destroy_instance") destroy_instance:proc(instance:  Instance, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_image_view_handle_nvx") get_image_view_handle_nvx:proc(device:  Device, pInfo: ^ImageViewHandleInfoNVX) ->  u32;
@(link_name="create_wayland_surface_khr") create_wayland_surface_khr:proc(instance:  Instance, pCreateInfo: ^WaylandSurfaceCreateInfoKHR, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="get_image_memory_requirements_2") get_image_memory_requirements_2:proc(device:  Device, pInfo: ^ImageMemoryRequirementsInfo2, pMemoryRequirements: ^MemoryRequirements2) ->  void;
@(link_name="get_physical_device_format_properties") get_physical_device_format_properties:proc(physicalDevice:  PhysicalDevice, format:  Format, pFormatProperties: ^FormatProperties) ->  void;
@(link_name="register_display_event_ext") register_display_event_ext:proc(device:  Device, display:  DisplayKHR, pDisplayEventInfo: ^DisplayEventInfoEXT, pAllocator: ^AllocationCallbacks, pFence: ^Fence) ->  Result;
@(link_name="acquire_next_image_khr") acquire_next_image_khr:proc(device:  Device, swapchain:  SwapchainKHR, timeout:  u64, semaphore:  Semaphore, fence:  Fence, pImageIndex: ^u32) ->  Result;
@(link_name="cmd_draw_mesh_tasks_indirect_nv") cmd_draw_mesh_tasks_indirect_nv:proc(commandBuffer:  CommandBuffer, buffer:  Buffer, offset:  DeviceSize, drawCount:  u32, stride:  u32) ->  void;
@(link_name="get_image_view_address_nvx") get_image_view_address_nvx:proc(device:  Device, imageView:  ImageView, pProperties: ^ImageViewAddressPropertiesNVX) ->  Result;
@(link_name="cmd_copy_image_to_buffer_2khr") cmd_copy_image_to_buffer_2khr:proc(commandBuffer:  CommandBuffer, pCopyImageToBufferInfo: ^CopyImageToBufferInfo2KHR) ->  void;
@(link_name="initialize_performance_api_intel") initialize_performance_api_intel:proc(device:  Device, pInitializeInfo: ^InitializePerformanceApiInfoINTEL) ->  Result;
@(link_name="map_memory") map_memory:proc(device:  Device, memory:  DeviceMemory, offset:  DeviceSize, size:  DeviceSize, flags:  MemoryMapFlags, ppData: ^^void) ->  Result;
@(link_name="get_physical_device_display_properties_khr") get_physical_device_display_properties_khr:proc(physicalDevice:  PhysicalDevice, pPropertyCount: ^u32, pProperties: ^DisplayPropertiesKHR) ->  Result;
@(link_name="create_shader_module") create_shader_module:proc(device:  Device, pCreateInfo: ^ShaderModuleCreateInfo, pAllocator: ^AllocationCallbacks, pShaderModule: ^ShaderModule) ->  Result;
@(link_name="cmd_clear_attachments") cmd_clear_attachments:proc(commandBuffer:  CommandBuffer, attachmentCount:  u32, pAttachments: ^ClearAttachment, rectCount:  u32, pRects: ^ClearRect) ->  void;
@(link_name="cmd_set_stencil_reference") cmd_set_stencil_reference:proc(commandBuffer:  CommandBuffer, faceMask:  StencilFaceFlags, reference:  u32) ->  void;
@(link_name="cmd_blit_image_2khr") cmd_blit_image_2khr:proc(commandBuffer:  CommandBuffer, pBlitImageInfo: ^BlitImageInfo2KHR) ->  void;
@(link_name="get_display_plane_capabilities_2khr") get_display_plane_capabilities_2khr:proc(physicalDevice:  PhysicalDevice, pDisplayPlaneInfo: ^DisplayPlaneInfo2KHR, pCapabilities: ^DisplayPlaneCapabilities2KHR) ->  Result;
@(link_name="create_buffer_view") create_buffer_view:proc(device:  Device, pCreateInfo: ^BufferViewCreateInfo, pAllocator: ^AllocationCallbacks, pView: ^BufferView) ->  Result;
@(link_name="queue_present_khr") queue_present_khr:proc(queue:  Queue, pPresentInfo: ^PresentInfoKHR) ->  Result;
@(link_name="destroy_sampler") destroy_sampler:proc(device:  Device, sampler:  Sampler, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_device_group_surface_present_modes_2ext") get_device_group_surface_present_modes_2ext:proc(device:  Device, pSurfaceInfo: ^PhysicalDeviceSurfaceInfo2KHR, pModes: ^DeviceGroupPresentModeFlagsKHR) ->  Result;
@(link_name="enumerate_physical_device_queue_family_performance_query_counters_khr") enumerate_physical_device_queue_family_performance_query_counters_khr:proc(physicalDevice:  PhysicalDevice, queueFamilyIndex:  u32, pCounterCount: ^u32, pCounters: ^PerformanceCounterKHR, pCounterDescriptions: ^PerformanceCounterDescriptionKHR) ->  Result;
@(link_name="cmd_end_conditional_rendering_ext") cmd_end_conditional_rendering_ext:proc(commandBuffer:  CommandBuffer) ->  void;
@(link_name="queue_set_performance_configuration_intel") queue_set_performance_configuration_intel:proc(queue:  Queue, configuration:  PerformanceConfigurationINTEL) ->  Result;
@(link_name="deferred_operation_join_khr") deferred_operation_join_khr:proc(device:  Device, operation:  DeferredOperationKHR) ->  Result;
@(link_name="cmd_bind_pipeline_shader_group_nv") cmd_bind_pipeline_shader_group_nv:proc(commandBuffer:  CommandBuffer, pipelineBindPoint:  PipelineBindPoint, pipeline:  Pipeline, groupIndex:  u32) ->  void;
@(link_name="unmap_memory") unmap_memory:proc(device:  Device, memory:  DeviceMemory) ->  void;
@(link_name="get_image_memory_requirements") get_image_memory_requirements:proc(device:  Device, image:  Image, pMemoryRequirements: ^MemoryRequirements) ->  void;
@(link_name="create_indirect_commands_layout_nv") create_indirect_commands_layout_nv:proc(device:  Device, pCreateInfo: ^IndirectCommandsLayoutCreateInfoNV, pAllocator: ^AllocationCallbacks, pIndirectCommandsLayout: ^IndirectCommandsLayoutNV) ->  Result;
@(link_name="cmd_set_cull_mode_ext") cmd_set_cull_mode_ext:proc(commandBuffer:  CommandBuffer, cullMode:  CullModeFlags) ->  void;
@(link_name="cmd_execute_generated_commands_nv") cmd_execute_generated_commands_nv:proc(commandBuffer:  CommandBuffer, isPreprocessed:  Bool32, pGeneratedCommandsInfo: ^GeneratedCommandsInfoNV) ->  void;
@(link_name="get_physical_device_tool_properties_ext") get_physical_device_tool_properties_ext:proc(physicalDevice:  PhysicalDevice, pToolCount: ^u32, pToolProperties: ^PhysicalDeviceToolPropertiesEXT) ->  Result;
@(link_name="create_acceleration_structure_nv") create_acceleration_structure_nv:proc(device:  Device, pCreateInfo: ^AccelerationStructureCreateInfoNV, pAllocator: ^AllocationCallbacks, pAccelerationStructure: ^AccelerationStructureNV) ->  Result;
@(link_name="get_calibrated_timestamps_ext") get_calibrated_timestamps_ext:proc(device:  Device, timestampCount:  u32, pTimestampInfos: ^CalibratedTimestampInfoEXT, pTimestamps: ^u64, pMaxDeviation: ^u64) ->  Result;
@(link_name="cmd_set_discard_rectangle_ext") cmd_set_discard_rectangle_ext:proc(commandBuffer:  CommandBuffer, firstDiscardRectangle:  u32, discardRectangleCount:  u32, pDiscardRectangles: ^Rect2D) ->  void;
@(link_name="cmd_begin_render_pass_2") cmd_begin_render_pass_2:proc(commandBuffer:  CommandBuffer, pRenderPassBegin: ^RenderPassBeginInfo, pSubpassBeginInfo: ^SubpassBeginInfo) ->  void;
@(link_name="destroy_render_pass") destroy_render_pass:proc(device:  Device, renderPass:  RenderPass, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_physical_device_calibrateable_time_domains_ext") get_physical_device_calibrateable_time_domains_ext:proc(physicalDevice:  PhysicalDevice, pTimeDomainCount: ^u32, pTimeDomains: ^TimeDomainEXT) ->  Result;
@(link_name="get_image_subresource_layout") get_image_subresource_layout:proc(device:  Device, image:  Image, pSubresource: ^ImageSubresource, pLayout: ^SubresourceLayout) ->  void;
@(link_name="destroy_descriptor_update_template") destroy_descriptor_update_template:proc(device:  Device, descriptorUpdateTemplate:  DescriptorUpdateTemplate, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="destroy_sampler_ycbcr_conversion") destroy_sampler_ycbcr_conversion:proc(device:  Device, ycbcrConversion:  SamplerYcbcrConversion, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="queue_insert_debug_utils_label_ext") queue_insert_debug_utils_label_ext:proc(queue:  Queue, pLabelInfo: ^DebugUtilsLabelEXT) ->  void;
@(link_name="get_physical_device_queue_family_properties") get_physical_device_queue_family_properties:proc(physicalDevice:  PhysicalDevice, pQueueFamilyPropertyCount: ^u32, pQueueFamilyProperties: ^QueueFamilyProperties) ->  void;
@(link_name="get_ray_tracing_shader_group_handles_khr") get_ray_tracing_shader_group_handles_khr:proc(device:  Device, pipeline:  Pipeline, firstGroup:  u32, groupCount:  u32, dataSize:  uint, pData: ^void) ->  Result;
@(link_name="bind_image_memory") bind_image_memory:proc(device:  Device, image:  Image, memory:  DeviceMemory, memoryOffset:  DeviceSize) ->  Result;
@(link_name="create_command_pool") create_command_pool:proc(device:  Device, pCreateInfo: ^CommandPoolCreateInfo, pAllocator: ^AllocationCallbacks, pCommandPool: ^CommandPool) ->  Result;
@(link_name="cmd_debug_marker_end_ext") cmd_debug_marker_end_ext:proc(commandBuffer:  CommandBuffer) ->  void;
@(link_name="get_physical_device_external_buffer_properties") get_physical_device_external_buffer_properties:proc(physicalDevice:  PhysicalDevice, pExternalBufferInfo: ^PhysicalDeviceExternalBufferInfo, pExternalBufferProperties: ^ExternalBufferProperties) ->  void;
@(link_name="create_descriptor_set_layout") create_descriptor_set_layout:proc(device:  Device, pCreateInfo: ^DescriptorSetLayoutCreateInfo, pAllocator: ^AllocationCallbacks, pSetLayout: ^DescriptorSetLayout) ->  Result;
@(link_name="copy_acceleration_structure_khr") copy_acceleration_structure_khr:proc(device:  Device, deferredOperation:  DeferredOperationKHR, pInfo: ^CopyAccelerationStructureInfoKHR) ->  Result;
@(link_name="create_ray_tracing_pipelines_khr") create_ray_tracing_pipelines_khr:proc(device:  Device, deferredOperation:  DeferredOperationKHR, pipelineCache:  PipelineCache, createInfoCount:  u32, pCreateInfos: ^RayTracingPipelineCreateInfoKHR, pAllocator: ^AllocationCallbacks, pPipelines: ^Pipeline) ->  Result;
@(link_name="cmd_end_render_pass") cmd_end_render_pass:proc(commandBuffer:  CommandBuffer) ->  void;
@(link_name="get_physical_device_supported_framebuffer_mixed_samples_combinations_nv") get_physical_device_supported_framebuffer_mixed_samples_combinations_nv:proc(physicalDevice:  PhysicalDevice, pCombinationCount: ^u32, pCombinations: ^FramebufferMixedSamplesCombinationNV) ->  Result;
@(link_name="create_vi_surface_nn") create_vi_surface_nn:proc(instance:  Instance, pCreateInfo: ^ViSurfaceCreateInfoNN, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="cmd_push_descriptor_set_with_template_khr") cmd_push_descriptor_set_with_template_khr:proc(commandBuffer:  CommandBuffer, descriptorUpdateTemplate:  DescriptorUpdateTemplate, layout:  PipelineLayout, set:  u32, pData: ^void) ->  void;
@(link_name="get_queue_checkpoint_data_2nv") get_queue_checkpoint_data_2nv:proc(queue:  Queue, pCheckpointDataCount: ^u32, pCheckpointData: ^CheckpointData2NV) ->  void;
@(link_name="reset_event") reset_event:proc(device:  Device, event:  Event) ->  Result;
@(link_name="get_physical_device_properties") get_physical_device_properties:proc(physicalDevice:  PhysicalDevice, pProperties: ^PhysicalDeviceProperties) ->  void;
@(link_name="get_pipeline_cache_data") get_pipeline_cache_data:proc(device:  Device, pipelineCache:  PipelineCache, pDataSize: ^uint, pData: ^void) ->  Result;
@(link_name="cmd_end_transform_feedback_ext") cmd_end_transform_feedback_ext:proc(commandBuffer:  CommandBuffer, firstCounterBuffer:  u32, counterBufferCount:  u32, pCounterBuffers: ^Buffer, pCounterBufferOffsets: ^DeviceSize) ->  void;
@(link_name="get_ray_tracing_shader_group_stack_size_khr") get_ray_tracing_shader_group_stack_size_khr:proc(device:  Device, pipeline:  Pipeline, group:  u32, groupShader:  ShaderGroupShaderKHR) ->  DeviceSize;
@(link_name="cmd_set_performance_marker_intel") cmd_set_performance_marker_intel:proc(commandBuffer:  CommandBuffer, pMarkerInfo: ^PerformanceMarkerInfoINTEL) ->  Result;
@(link_name="get_physical_device_xlib_presentation_support_khr") get_physical_device_xlib_presentation_support_khr:proc(physicalDevice:  PhysicalDevice, queueFamilyIndex:  u32, dpy: ^Display, visualID:  VisualID) ->  Bool32;
@(link_name="get_physical_device_win_32_presentation_support_khr") get_physical_device_win_32_presentation_support_khr:proc(physicalDevice:  PhysicalDevice, queueFamilyIndex:  u32) ->  Bool32;
@(link_name="import_semaphore_win_32_handle_khr") import_semaphore_win_32_handle_khr:proc(device:  Device, pImportSemaphoreWin32HandleInfo: ^ImportSemaphoreWin32HandleInfoKHR) ->  Result;
@(link_name="get_buffer_memory_requirements") get_buffer_memory_requirements:proc(device:  Device, buffer:  Buffer, pMemoryRequirements: ^MemoryRequirements) ->  void;
@(link_name="cmd_bind_descriptor_sets") cmd_bind_descriptor_sets:proc(commandBuffer:  CommandBuffer, pipelineBindPoint:  PipelineBindPoint, layout:  PipelineLayout, firstSet:  u32, descriptorSetCount:  u32, pDescriptorSets: ^DescriptorSet, dynamicOffsetCount:  u32, pDynamicOffsets: ^u32) ->  void;
@(link_name="get_physical_device_surface_capabilities_2ext") get_physical_device_surface_capabilities_2ext:proc(physicalDevice:  PhysicalDevice, surface:  SurfaceKHR, pSurfaceCapabilities: ^SurfaceCapabilities2EXT) ->  Result;
@(link_name="destroy_descriptor_set_layout") destroy_descriptor_set_layout:proc(device:  Device, descriptorSetLayout:  DescriptorSetLayout, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_swapchain_status_khr") get_swapchain_status_khr:proc(device:  Device, swapchain:  SwapchainKHR) ->  Result;
@(link_name="get_device_queue") get_device_queue:proc(device:  Device, queueFamilyIndex:  u32, queueIndex:  u32, pQueue: ^Queue) ->  void;
@(link_name="cmd_set_line_width") cmd_set_line_width:proc(commandBuffer:  CommandBuffer, lineWidth:  f32) ->  void;
@(link_name="cmd_blit_image") cmd_blit_image:proc(commandBuffer:  CommandBuffer, srcImage:  Image, srcImageLayout:  ImageLayout, dstImage:  Image, dstImageLayout:  ImageLayout, regionCount:  u32, pRegions: ^ImageBlit, filter:  Filter) ->  void;
@(link_name="create_sampler_ycbcr_conversion") create_sampler_ycbcr_conversion:proc(device:  Device, pCreateInfo: ^SamplerYcbcrConversionCreateInfo, pAllocator: ^AllocationCallbacks, pYcbcrConversion: ^SamplerYcbcrConversion) ->  Result;
@(link_name="enumerate_instance_extension_properties") enumerate_instance_extension_properties:proc(pLayerName: cstring, pPropertyCount: ^u32, pProperties: ^ExtensionProperties) ->  Result;
@(link_name="release_performance_configuration_intel") release_performance_configuration_intel:proc(device:  Device, configuration:  PerformanceConfigurationINTEL) ->  Result;
@(link_name="get_physical_device_sparse_image_format_properties") get_physical_device_sparse_image_format_properties:proc(physicalDevice:  PhysicalDevice, format:  Format, type:  ImageType, samples:  SampleCountFlags, usage:  ImageUsageFlags, tiling:  ImageTiling, pPropertyCount: ^u32, pProperties: ^SparseImageFormatProperties) ->  void;
@(link_name="cmd_wait_events_2khr") cmd_wait_events_2khr:proc(commandBuffer:  CommandBuffer, eventCount:  u32, pEvents: ^Event, pDependencyInfos: ^DependencyInfoKHR) ->  void;
@(link_name="get_physical_device_external_fence_properties") get_physical_device_external_fence_properties:proc(physicalDevice:  PhysicalDevice, pExternalFenceInfo: ^PhysicalDeviceExternalFenceInfo, pExternalFenceProperties: ^ExternalFenceProperties) ->  void;
@(link_name="cmd_set_primitive_topology_ext") cmd_set_primitive_topology_ext:proc(commandBuffer:  CommandBuffer, primitiveTopology:  PrimitiveTopology) ->  void;
@(link_name="get_buffer_memory_requirements_2") get_buffer_memory_requirements_2:proc(device:  Device, pInfo: ^BufferMemoryRequirementsInfo2, pMemoryRequirements: ^MemoryRequirements2) ->  void;
@(link_name="queue_wait_idle") queue_wait_idle:proc(queue:  Queue) ->  Result;
@(link_name="destroy_validation_cache_ext") destroy_validation_cache_ext:proc(device:  Device, validationCache:  ValidationCacheEXT, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="acquire_next_image_2khr") acquire_next_image_2khr:proc(device:  Device, pAcquireInfo: ^AcquireNextImageInfoKHR, pImageIndex: ^u32) ->  Result;
@(link_name="cmd_begin_render_pass") cmd_begin_render_pass:proc(commandBuffer:  CommandBuffer, pRenderPassBegin: ^RenderPassBeginInfo, contents:  SubpassContents) ->  void;
@(link_name="destroy_pipeline_layout") destroy_pipeline_layout:proc(device:  Device, pipelineLayout:  PipelineLayout, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_resolve_image") cmd_resolve_image:proc(commandBuffer:  CommandBuffer, srcImage:  Image, srcImageLayout:  ImageLayout, dstImage:  Image, dstImageLayout:  ImageLayout, regionCount:  u32, pRegions: ^ImageResolve) ->  void;
@(link_name="destroy_indirect_commands_layout_nv") destroy_indirect_commands_layout_nv:proc(device:  Device, indirectCommandsLayout:  IndirectCommandsLayoutNV, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_memory_android_hardware_buffer_android") get_memory_android_hardware_buffer_android:proc(device:  Device, pInfo: ^MemoryGetAndroidHardwareBufferInfoANDROID, pBuffer: ^^AHardwareBuffer) ->  Result;
@(link_name="import_fence_fd_khr") import_fence_fd_khr:proc(device:  Device, pImportFenceFdInfo: ^ImportFenceFdInfoKHR) ->  Result;
@(link_name="get_physical_device_features") get_physical_device_features:proc(physicalDevice:  PhysicalDevice, pFeatures: ^PhysicalDeviceFeatures) ->  void;
@(link_name="get_physical_device_surface_present_modes_khr") get_physical_device_surface_present_modes_khr:proc(physicalDevice:  PhysicalDevice, surface:  SurfaceKHR, pPresentModeCount: ^u32, pPresentModes: ^PresentModeKHR) ->  Result;
@(link_name="trim_command_pool") trim_command_pool:proc(device:  Device, commandPool:  CommandPool, flags:  CommandPoolTrimFlags) ->  void;
@(link_name="get_physical_device_display_properties_2khr") get_physical_device_display_properties_2khr:proc(physicalDevice:  PhysicalDevice, pPropertyCount: ^u32, pProperties: ^DisplayProperties2KHR) ->  Result;
@(link_name="get_semaphore_win_32_handle_khr") get_semaphore_win_32_handle_khr:proc(device:  Device, pGetWin32HandleInfo: ^SemaphoreGetWin32HandleInfoKHR, pHandle: ^HANDLE) ->  Result;
@(link_name="signal_semaphore") signal_semaphore:proc(device:  Device, pSignalInfo: ^SemaphoreSignalInfo) ->  Result;
@(link_name="get_physical_device_image_format_properties_2") get_physical_device_image_format_properties_2:proc(physicalDevice:  PhysicalDevice, pImageFormatInfo: ^PhysicalDeviceImageFormatInfo2, pImageFormatProperties: ^ImageFormatProperties2) ->  Result;
@(link_name="get_winrt_display_nv") get_winrt_display_nv:proc(physicalDevice:  PhysicalDevice, deviceRelativeId:  u32, pDisplay: ^DisplayKHR) ->  Result;
@(link_name="cmd_draw_indexed_indirect_count") cmd_draw_indexed_indirect_count:proc(commandBuffer:  CommandBuffer, buffer:  Buffer, offset:  DeviceSize, countBuffer:  Buffer, countBufferOffset:  DeviceSize, maxDrawCount:  u32, stride:  u32) ->  void;
@(link_name="queue_submit_2khr") queue_submit_2khr:proc(queue:  Queue, submitCount:  u32, pSubmits: ^SubmitInfo2KHR, fence:  Fence) ->  Result;
@(link_name="create_graphics_pipelines") create_graphics_pipelines:proc(device:  Device, pipelineCache:  PipelineCache, createInfoCount:  u32, pCreateInfos: ^GraphicsPipelineCreateInfo, pAllocator: ^AllocationCallbacks, pPipelines: ^Pipeline) ->  Result;
@(link_name="cmd_begin_transform_feedback_ext") cmd_begin_transform_feedback_ext:proc(commandBuffer:  CommandBuffer, firstCounterBuffer:  u32, counterBufferCount:  u32, pCounterBuffers: ^Buffer, pCounterBufferOffsets: ^DeviceSize) ->  void;
@(link_name="acquire_full_screen_exclusive_mode_ext") acquire_full_screen_exclusive_mode_ext:proc(device:  Device, swapchain:  SwapchainKHR) ->  Result;
@(link_name="display_power_control_ext") display_power_control_ext:proc(device:  Device, display:  DisplayKHR, pDisplayPowerInfo: ^DisplayPowerInfoEXT) ->  Result;
@(link_name="queue_begin_debug_utils_label_ext") queue_begin_debug_utils_label_ext:proc(queue:  Queue, pLabelInfo: ^DebugUtilsLabelEXT) ->  void;
@(link_name="get_ray_tracing_capture_replay_shader_group_handles_khr") get_ray_tracing_capture_replay_shader_group_handles_khr:proc(device:  Device, pipeline:  Pipeline, firstGroup:  u32, groupCount:  u32, dataSize:  uint, pData: ^void) ->  Result;
@(link_name="cmd_copy_image_to_buffer") cmd_copy_image_to_buffer:proc(commandBuffer:  CommandBuffer, srcImage:  Image, srcImageLayout:  ImageLayout, dstBuffer:  Buffer, regionCount:  u32, pRegions: ^BufferImageCopy) ->  void;
@(link_name="get_event_status") get_event_status:proc(device:  Device, event:  Event) ->  Result;
@(link_name="copy_acceleration_structure_to_memory_khr") copy_acceleration_structure_to_memory_khr:proc(device:  Device, deferredOperation:  DeferredOperationKHR, pInfo: ^CopyAccelerationStructureToMemoryInfoKHR) ->  Result;
@(link_name="get_fence_fd_khr") get_fence_fd_khr:proc(device:  Device, pGetFdInfo: ^FenceGetFdInfoKHR, pFd: ^i32) ->  Result;
@(link_name="get_display_mode_properties_2khr") get_display_mode_properties_2khr:proc(physicalDevice:  PhysicalDevice, display:  DisplayKHR, pPropertyCount: ^u32, pProperties: ^DisplayModeProperties2KHR) ->  Result;
@(link_name="cmd_draw_mesh_tasks_nv") cmd_draw_mesh_tasks_nv:proc(commandBuffer:  CommandBuffer, taskCount:  u32, firstTask:  u32) ->  void;
@(link_name="create_device") create_device:proc(physicalDevice:  PhysicalDevice, pCreateInfo: ^DeviceCreateInfo, pAllocator: ^AllocationCallbacks, pDevice: ^Device) ->  Result;
@(link_name="get_memory_win_32_handle_nv") get_memory_win_32_handle_nv:proc(device:  Device, memory:  DeviceMemory, handleType:  ExternalMemoryHandleTypeFlagsNV, pHandle: ^HANDLE) ->  Result;
@(link_name="set_local_dimming_amd") set_local_dimming_amd:proc(device:  Device, swapChain:  SwapchainKHR, localDimmingEnable:  Bool32) ->  void;
@(link_name="get_pipeline_executable_properties_khr") get_pipeline_executable_properties_khr:proc(device:  Device, pPipelineInfo: ^PipelineInfoKHR, pExecutableCount: ^u32, pProperties: ^PipelineExecutablePropertiesKHR) ->  Result;
@(link_name="destroy_buffer") destroy_buffer:proc(device:  Device, buffer:  Buffer, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_swapchain_images_khr") get_swapchain_images_khr:proc(device:  Device, swapchain:  SwapchainKHR, pSwapchainImageCount: ^u32, pSwapchainImages: ^Image) ->  Result;
@(link_name="create_debug_report_callback_ext") create_debug_report_callback_ext:proc(instance:  Instance, pCreateInfo: ^DebugReportCallbackCreateInfoEXT, pAllocator: ^AllocationCallbacks, pCallback: ^DebugReportCallbackEXT) ->  Result;
@(link_name="reset_descriptor_pool") reset_descriptor_pool:proc(device:  Device, descriptorPool:  DescriptorPool, flags:  DescriptorPoolResetFlags) ->  Result;
@(link_name="create_descriptor_pool") create_descriptor_pool:proc(device:  Device, pCreateInfo: ^DescriptorPoolCreateInfo, pAllocator: ^AllocationCallbacks, pDescriptorPool: ^DescriptorPool) ->  Result;
@(link_name="create_metal_surface_ext") create_metal_surface_ext:proc(instance:  Instance, pCreateInfo: ^MetalSurfaceCreateInfoEXT, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="create_debug_utils_messenger_ext") create_debug_utils_messenger_ext:proc(instance:  Instance, pCreateInfo: ^DebugUtilsMessengerCreateInfoEXT, pAllocator: ^AllocationCallbacks, pMessenger: ^DebugUtilsMessengerEXT) ->  Result;
@(link_name="create_event") create_event:proc(device:  Device, pCreateInfo: ^EventCreateInfo, pAllocator: ^AllocationCallbacks, pEvent: ^Event) ->  Result;
@(link_name="destroy_device") destroy_device:proc(device:  Device, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_physical_device_queue_family_properties_2") get_physical_device_queue_family_properties_2:proc(physicalDevice:  PhysicalDevice, pQueueFamilyPropertyCount: ^u32, pQueueFamilyProperties: ^QueueFamilyProperties2) ->  void;
@(link_name="get_fence_win_32_handle_khr") get_fence_win_32_handle_khr:proc(device:  Device, pGetWin32HandleInfo: ^FenceGetWin32HandleInfoKHR, pHandle: ^HANDLE) ->  Result;
@(link_name="enumerate_device_extension_properties") enumerate_device_extension_properties:proc(physicalDevice:  PhysicalDevice, pLayerName: cstring, pPropertyCount: ^u32, pProperties: ^ExtensionProperties) ->  Result;
@(link_name="release_display_ext") release_display_ext:proc(physicalDevice:  PhysicalDevice, display:  DisplayKHR) ->  Result;
@(link_name="cmd_write_acceleration_structures_properties_khr") cmd_write_acceleration_structures_properties_khr:proc(commandBuffer:  CommandBuffer, accelerationStructureCount:  u32, pAccelerationStructures: ^AccelerationStructureKHR, queryType:  QueryType, queryPool:  QueryPool, firstQuery:  u32) ->  void;
@(link_name="enumerate_instance_version") enumerate_instance_version:proc(pApiVersion: ^u32) ->  Result;
@(link_name="destroy_image_view") destroy_image_view:proc(device:  Device, imageView:  ImageView, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_physical_device_external_semaphore_properties") get_physical_device_external_semaphore_properties:proc(physicalDevice:  PhysicalDevice, pExternalSemaphoreInfo: ^PhysicalDeviceExternalSemaphoreInfo, pExternalSemaphoreProperties: ^ExternalSemaphoreProperties) ->  void;
@(link_name="update_descriptor_sets") update_descriptor_sets:proc(device:  Device, descriptorWriteCount:  u32, pDescriptorWrites: ^WriteDescriptorSet, descriptorCopyCount:  u32, pDescriptorCopies: ^CopyDescriptorSet) ->  void;
@(link_name="create_descriptor_update_template") create_descriptor_update_template:proc(device:  Device, pCreateInfo: ^DescriptorUpdateTemplateCreateInfo, pAllocator: ^AllocationCallbacks, pDescriptorUpdateTemplate: ^DescriptorUpdateTemplate) ->  Result;
@(link_name="bind_acceleration_structure_memory_nv") bind_acceleration_structure_memory_nv:proc(device:  Device, bindInfoCount:  u32, pBindInfos: ^BindAccelerationStructureMemoryInfoNV) ->  Result;
@(link_name="cmd_update_buffer") cmd_update_buffer:proc(commandBuffer:  CommandBuffer, dstBuffer:  Buffer, dstOffset:  DeviceSize, dataSize:  DeviceSize, pData: ^void) ->  void;
@(link_name="get_physical_device_memory_properties_2") get_physical_device_memory_properties_2:proc(physicalDevice:  PhysicalDevice, pMemoryProperties: ^PhysicalDeviceMemoryProperties2) ->  void;
@(link_name="get_private_data_ext") get_private_data_ext:proc(device:  Device, objectType:  ObjectType, objectHandle:  u64, privateDataSlot:  PrivateDataSlotEXT, pData: ^u64) ->  void;
@(link_name="cmd_debug_marker_insert_ext") cmd_debug_marker_insert_ext:proc(commandBuffer:  CommandBuffer, pMarkerInfo: ^DebugMarkerMarkerInfoEXT) ->  void;
@(link_name="cmd_draw") cmd_draw:proc(commandBuffer:  CommandBuffer, vertexCount:  u32, instanceCount:  u32, firstVertex:  u32, firstInstance:  u32) ->  void;
@(link_name="enumerate_instance_layer_properties") enumerate_instance_layer_properties:proc(pPropertyCount: ^u32, pProperties: ^LayerProperties) ->  Result;
@(link_name="destroy_pipeline_cache") destroy_pipeline_cache:proc(device:  Device, pipelineCache:  PipelineCache, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="create_pipeline_cache") create_pipeline_cache:proc(device:  Device, pCreateInfo: ^PipelineCacheCreateInfo, pAllocator: ^AllocationCallbacks, pPipelineCache: ^PipelineCache) ->  Result;
@(link_name="begin_command_buffer") begin_command_buffer:proc(commandBuffer:  CommandBuffer, pBeginInfo: ^CommandBufferBeginInfo) ->  Result;
@(link_name="free_descriptor_sets") free_descriptor_sets:proc(device:  Device, descriptorPool:  DescriptorPool, descriptorSetCount:  u32, pDescriptorSets: ^DescriptorSet) ->  Result;
@(link_name="create_framebuffer") create_framebuffer:proc(device:  Device, pCreateInfo: ^FramebufferCreateInfo, pAllocator: ^AllocationCallbacks, pFramebuffer: ^Framebuffer) ->  Result;
@(link_name="release_profiling_lock_khr") release_profiling_lock_khr:proc(device:  Device) ->  void;
@(link_name="get_physical_device_surface_formats_khr") get_physical_device_surface_formats_khr:proc(physicalDevice:  PhysicalDevice, surface:  SurfaceKHR, pSurfaceFormatCount: ^u32, pSurfaceFormats: ^SurfaceFormatKHR) ->  Result;
@(link_name="cmd_push_constants") cmd_push_constants:proc(commandBuffer:  CommandBuffer, layout:  PipelineLayout, stageFlags:  ShaderStageFlags, offset:  u32, size:  u32, pValues: ^void) ->  void;
@(link_name="get_render_area_granularity") get_render_area_granularity:proc(device:  Device, renderPass:  RenderPass, pGranularity: ^Extent2D) ->  void;
@(link_name="get_performance_parameter_intel") get_performance_parameter_intel:proc(device:  Device, parameter:  PerformanceParameterTypeINTEL, pValue: ^PerformanceValueINTEL) ->  Result;
@(link_name="set_debug_utils_object_tag_ext") set_debug_utils_object_tag_ext:proc(device:  Device, pTagInfo: ^DebugUtilsObjectTagInfoEXT) ->  Result;
@(link_name="set_private_data_ext") set_private_data_ext:proc(device:  Device, objectType:  ObjectType, objectHandle:  u64, privateDataSlot:  PrivateDataSlotEXT, data:  u64) ->  Result;
@(link_name="cmd_pipeline_barrier") cmd_pipeline_barrier:proc(commandBuffer:  CommandBuffer, srcStageMask:  PipelineStageFlags, dstStageMask:  PipelineStageFlags, dependencyFlags:  DependencyFlags, memoryBarrierCount:  u32, pMemoryBarriers: ^MemoryBarrier, bufferMemoryBarrierCount:  u32, pBufferMemoryBarriers: ^BufferMemoryBarrier, imageMemoryBarrierCount:  u32, pImageMemoryBarriers: ^ImageMemoryBarrier) ->  void;
@(link_name="update_descriptor_set_with_template") update_descriptor_set_with_template:proc(device:  Device, descriptorSet:  DescriptorSet, descriptorUpdateTemplate:  DescriptorUpdateTemplate, pData: ^void) ->  void;
@(link_name="cmd_end_render_pass_2") cmd_end_render_pass_2:proc(commandBuffer:  CommandBuffer, pSubpassEndInfo: ^SubpassEndInfo) ->  void;
@(link_name="cmd_set_exclusive_scissor_nv") cmd_set_exclusive_scissor_nv:proc(commandBuffer:  CommandBuffer, firstExclusiveScissor:  u32, exclusiveScissorCount:  u32, pExclusiveScissors: ^Rect2D) ->  void;
@(link_name="cmd_next_subpass_2") cmd_next_subpass_2:proc(commandBuffer:  CommandBuffer, pSubpassBeginInfo: ^SubpassBeginInfo, pSubpassEndInfo: ^SubpassEndInfo) ->  void;
@(link_name="create_semaphore") create_semaphore:proc(device:  Device, pCreateInfo: ^SemaphoreCreateInfo, pAllocator: ^AllocationCallbacks, pSemaphore: ^Semaphore) ->  Result;
@(link_name="create_fence") create_fence:proc(device:  Device, pCreateInfo: ^FenceCreateInfo, pAllocator: ^AllocationCallbacks, pFence: ^Fence) ->  Result;
@(link_name="get_display_plane_supported_displays_khr") get_display_plane_supported_displays_khr:proc(physicalDevice:  PhysicalDevice, planeIndex:  u32, pDisplayCount: ^u32, pDisplays: ^DisplayKHR) ->  Result;
@(link_name="get_physical_device_surface_formats_2khr") get_physical_device_surface_formats_2khr:proc(physicalDevice:  PhysicalDevice, pSurfaceInfo: ^PhysicalDeviceSurfaceInfo2KHR, pSurfaceFormatCount: ^u32, pSurfaceFormats: ^SurfaceFormat2KHR) ->  Result;
@(link_name="cmd_write_acceleration_structures_properties_nv") cmd_write_acceleration_structures_properties_nv:proc(commandBuffer:  CommandBuffer, accelerationStructureCount:  u32, pAccelerationStructures: ^AccelerationStructureNV, queryType:  QueryType, queryPool:  QueryPool, firstQuery:  u32) ->  void;
@(link_name="destroy_semaphore") destroy_semaphore:proc(device:  Device, semaphore:  Semaphore, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="destroy_buffer_view") destroy_buffer_view:proc(device:  Device, bufferView:  BufferView, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_trace_rays_indirect_khr") cmd_trace_rays_indirect_khr:proc(commandBuffer:  CommandBuffer, pRaygenShaderBindingTable: ^StridedDeviceAddressRegionKHR, pMissShaderBindingTable: ^StridedDeviceAddressRegionKHR, pHitShaderBindingTable: ^StridedDeviceAddressRegionKHR, pCallableShaderBindingTable: ^StridedDeviceAddressRegionKHR, indirectDeviceAddress:  DeviceAddress) ->  void;
@(link_name="acquire_performance_configuration_intel") acquire_performance_configuration_intel:proc(device:  Device, pAcquireInfo: ^PerformanceConfigurationAcquireInfoINTEL, pConfiguration: ^PerformanceConfigurationINTEL) ->  Result;
@(link_name="get_pipeline_executable_internal_representations_khr") get_pipeline_executable_internal_representations_khr:proc(device:  Device, pExecutableInfo: ^PipelineExecutableInfoKHR, pInternalRepresentationCount: ^u32, pInternalRepresentations: ^PipelineExecutableInternalRepresentationKHR) ->  Result;
@(link_name="cmd_copy_acceleration_structure_nv") cmd_copy_acceleration_structure_nv:proc(commandBuffer:  CommandBuffer, dst:  AccelerationStructureNV, src:  AccelerationStructureNV, mode:  CopyAccelerationStructureModeKHR) ->  void;
@(link_name="create_private_data_slot_ext") create_private_data_slot_ext:proc(device:  Device, pCreateInfo: ^PrivateDataSlotCreateInfoEXT, pAllocator: ^AllocationCallbacks, pPrivateDataSlot: ^PrivateDataSlotEXT) ->  Result;
@(link_name="cmd_dispatch_indirect") cmd_dispatch_indirect:proc(commandBuffer:  CommandBuffer, buffer:  Buffer, offset:  DeviceSize) ->  void;
@(link_name="acquire_xlib_display_ext") acquire_xlib_display_ext:proc(physicalDevice:  PhysicalDevice, dpy: ^Display, display:  DisplayKHR) ->  Result;
@(link_name="cmd_set_depth_bounds_test_enable_ext") cmd_set_depth_bounds_test_enable_ext:proc(commandBuffer:  CommandBuffer, depthBoundsTestEnable:  Bool32) ->  void;
@(link_name="create_mac_os_surface_mvk") create_mac_os_surface_mvk:proc(instance:  Instance, pCreateInfo: ^MacOSSurfaceCreateInfoMVK, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="create_headless_surface_ext") create_headless_surface_ext:proc(instance:  Instance, pCreateInfo: ^HeadlessSurfaceCreateInfoEXT, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="cmd_set_sample_locations_ext") cmd_set_sample_locations_ext:proc(commandBuffer:  CommandBuffer, pSampleLocationsInfo: ^SampleLocationsInfoEXT) ->  void;
@(link_name="get_memory_fd_properties_khr") get_memory_fd_properties_khr:proc(device:  Device, handleType:  ExternalMemoryHandleTypeFlags, fd:  i32, pMemoryFdProperties: ^MemoryFdPropertiesKHR) ->  Result;
@(link_name="cmd_copy_image_2khr") cmd_copy_image_2khr:proc(commandBuffer:  CommandBuffer, pCopyImageInfo: ^CopyImageInfo2KHR) ->  void;
@(link_name="create_direct_fb_surface_ext") create_direct_fb_surface_ext:proc(instance:  Instance, pCreateInfo: ^DirectFBSurfaceCreateInfoEXT, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="get_display_mode_properties_khr") get_display_mode_properties_khr:proc(physicalDevice:  PhysicalDevice, display:  DisplayKHR, pPropertyCount: ^u32, pProperties: ^DisplayModePropertiesKHR) ->  Result;
@(link_name="cmd_write_timestamp") cmd_write_timestamp:proc(commandBuffer:  CommandBuffer, pipelineStage:  PipelineStageFlags, queryPool:  QueryPool, query:  u32) ->  void;
@(link_name="get_semaphore_fd_khr") get_semaphore_fd_khr:proc(device:  Device, pGetFdInfo: ^SemaphoreGetFdInfoKHR, pFd: ^i32) ->  Result;
@(link_name="cmd_set_stencil_op_ext") cmd_set_stencil_op_ext:proc(commandBuffer:  CommandBuffer, faceMask:  StencilFaceFlags, failOp:  StencilOp, passOp:  StencilOp, depthFailOp:  StencilOp, compareOp:  CompareOp) ->  void;
@(link_name="get_physical_device_features_2") get_physical_device_features_2:proc(physicalDevice:  PhysicalDevice, pFeatures: ^PhysicalDeviceFeatures2) ->  void;
@(link_name="cmd_set_fragment_shading_rate_khr") cmd_set_fragment_shading_rate_khr:proc(commandBuffer:  CommandBuffer, pFragmentSize: ^Extent2D, combinerOps:  ^[2]FragmentShadingRateCombinerOpKHR) ->  void;
@(link_name="queue_end_debug_utils_label_ext") queue_end_debug_utils_label_ext:proc(queue:  Queue) ->  void;
@(link_name="create_sampler") create_sampler:proc(device:  Device, pCreateInfo: ^SamplerCreateInfo, pAllocator: ^AllocationCallbacks, pSampler: ^Sampler) ->  Result;
@(link_name="cmd_end_query") cmd_end_query:proc(commandBuffer:  CommandBuffer, queryPool:  QueryPool, query:  u32) ->  void;
@(link_name="cmd_push_descriptor_set_khr") cmd_push_descriptor_set_khr:proc(commandBuffer:  CommandBuffer, pipelineBindPoint:  PipelineBindPoint, layout:  PipelineLayout, set:  u32, descriptorWriteCount:  u32, pDescriptorWrites: ^WriteDescriptorSet) ->  void;
@(link_name="destroy_debug_utils_messenger_ext") destroy_debug_utils_messenger_ext:proc(instance:  Instance, messenger:  DebugUtilsMessengerEXT, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_build_acceleration_structure_nv") cmd_build_acceleration_structure_nv:proc(commandBuffer:  CommandBuffer, pInfo: ^AccelerationStructureInfoNV, instanceData:  Buffer, instanceOffset:  DeviceSize, update:  Bool32, dst:  AccelerationStructureNV, src:  AccelerationStructureNV, scratch:  Buffer, scratchOffset:  DeviceSize) ->  void;
@(link_name="cmd_set_ray_tracing_pipeline_stack_size_khr") cmd_set_ray_tracing_pipeline_stack_size_khr:proc(commandBuffer:  CommandBuffer, pipelineStackSize:  u32) ->  void;
@(link_name="get_deferred_operation_max_concurrency_khr") get_deferred_operation_max_concurrency_khr:proc(device:  Device, operation:  DeferredOperationKHR) ->  u32;
@(link_name="write_acceleration_structures_properties_khr") write_acceleration_structures_properties_khr:proc(device:  Device, accelerationStructureCount:  u32, pAccelerationStructures: ^AccelerationStructureKHR, queryType:  QueryType, dataSize:  uint, pData: ^void, stride:  uint) ->  Result;
@(link_name="get_acceleration_structure_build_sizes_khr") get_acceleration_structure_build_sizes_khr:proc(device:  Device, buildType:  AccelerationStructureBuildTypeKHR, pBuildInfo: ^AccelerationStructureBuildGeometryInfoKHR, pMaxPrimitiveCounts: ^u32, pSizeInfo: ^AccelerationStructureBuildSizesInfoKHR) ->  void;
@(link_name="reset_fences") reset_fences:proc(device:  Device, fenceCount:  u32, pFences: ^Fence) ->  Result;
@(link_name="get_physical_device_surface_support_khr") get_physical_device_surface_support_khr:proc(physicalDevice:  PhysicalDevice, queueFamilyIndex:  u32, surface:  SurfaceKHR, pSupported: ^Bool32) ->  Result;
@(link_name="cmd_trace_rays_nv") cmd_trace_rays_nv:proc(commandBuffer:  CommandBuffer, raygenShaderBindingTableBuffer:  Buffer, raygenShaderBindingOffset:  DeviceSize, missShaderBindingTableBuffer:  Buffer, missShaderBindingOffset:  DeviceSize, missShaderBindingStride:  DeviceSize, hitShaderBindingTableBuffer:  Buffer, hitShaderBindingOffset:  DeviceSize, hitShaderBindingStride:  DeviceSize, callableShaderBindingTableBuffer:  Buffer, callableShaderBindingOffset:  DeviceSize, callableShaderBindingStride:  DeviceSize, width:  u32, height:  u32, depth:  u32) ->  void;
@(link_name="allocate_memory") allocate_memory:proc(device:  Device, pAllocateInfo: ^MemoryAllocateInfo, pAllocator: ^AllocationCallbacks, pMemory: ^DeviceMemory) ->  Result;
@(link_name="reset_command_pool") reset_command_pool:proc(device:  Device, commandPool:  CommandPool, flags:  CommandPoolResetFlags) ->  Result;
@(link_name="get_physical_device_direct_fb_presentation_support_ext") get_physical_device_direct_fb_presentation_support_ext:proc(physicalDevice:  PhysicalDevice, queueFamilyIndex:  u32, dfb: ^IDirectFB) ->  Bool32;
@(link_name="allocate_descriptor_sets") allocate_descriptor_sets:proc(device:  Device, pAllocateInfo: ^DescriptorSetAllocateInfo, pDescriptorSets: ^DescriptorSet) ->  Result;
@(link_name="create_image") create_image:proc(device:  Device, pCreateInfo: ^ImageCreateInfo, pAllocator: ^AllocationCallbacks, pImage: ^Image) ->  Result;
@(link_name="enumerate_physical_devices") enumerate_physical_devices:proc(instance:  Instance, pPhysicalDeviceCount: ^u32, pPhysicalDevices: ^PhysicalDevice) ->  Result;
@(link_name="destroy_descriptor_pool") destroy_descriptor_pool:proc(device:  Device, descriptorPool:  DescriptorPool, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_copy_buffer") cmd_copy_buffer:proc(commandBuffer:  CommandBuffer, srcBuffer:  Buffer, dstBuffer:  Buffer, regionCount:  u32, pRegions: ^BufferCopy) ->  void;
@(link_name="create_xlib_surface_khr") create_xlib_surface_khr:proc(instance:  Instance, pCreateInfo: ^XlibSurfaceCreateInfoKHR, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="get_physical_device_surface_capabilities_2khr") get_physical_device_surface_capabilities_2khr:proc(physicalDevice:  PhysicalDevice, pSurfaceInfo: ^PhysicalDeviceSurfaceInfo2KHR, pSurfaceCapabilities: ^SurfaceCapabilities2KHR) ->  Result;
@(link_name="create_validation_cache_ext") create_validation_cache_ext:proc(device:  Device, pCreateInfo: ^ValidationCacheCreateInfoEXT, pAllocator: ^AllocationCallbacks, pValidationCache: ^ValidationCacheEXT) ->  Result;
@(link_name="queue_submit") queue_submit:proc(queue:  Queue, submitCount:  u32, pSubmits: ^SubmitInfo, fence:  Fence) ->  Result;
@(link_name="invalidate_mapped_memory_ranges") invalidate_mapped_memory_ranges:proc(device:  Device, memoryRangeCount:  u32, pMemoryRanges: ^MappedMemoryRange) ->  Result;
@(link_name="cmd_wait_events") cmd_wait_events:proc(commandBuffer:  CommandBuffer, eventCount:  u32, pEvents: ^Event, srcStageMask:  PipelineStageFlags, dstStageMask:  PipelineStageFlags, memoryBarrierCount:  u32, pMemoryBarriers: ^MemoryBarrier, bufferMemoryBarrierCount:  u32, pBufferMemoryBarriers: ^BufferMemoryBarrier, imageMemoryBarrierCount:  u32, pImageMemoryBarriers: ^ImageMemoryBarrier) ->  void;
@(link_name="create_android_surface_khr") create_android_surface_khr:proc(instance:  Instance, pCreateInfo: ^AndroidSurfaceCreateInfoKHR, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="get_physical_device_surface_capabilities_khr") get_physical_device_surface_capabilities_khr:proc(physicalDevice:  PhysicalDevice, surface:  SurfaceKHR, pSurfaceCapabilities: ^SurfaceCapabilitiesKHR) ->  Result;
@(link_name="create_screen_surface_qnx") create_screen_surface_qnx:proc(instance:  Instance, pCreateInfo: ^ScreenSurfaceCreateInfoQNX, pAllocator: ^AllocationCallbacks, pSurface: ^SurfaceKHR) ->  Result;
@(link_name="get_physical_device_image_format_properties") get_physical_device_image_format_properties:proc(physicalDevice:  PhysicalDevice, format:  Format, type:  ImageType, tiling:  ImageTiling, usage:  ImageUsageFlags, flags:  ImageCreateFlags, pImageFormatProperties: ^ImageFormatProperties) ->  Result;
@(link_name="get_swapchain_counter_ext") get_swapchain_counter_ext:proc(device:  Device, swapchain:  SwapchainKHR, counter:  SurfaceCounterFlagsEXT, pCounterValue: ^u64) ->  Result;
@(link_name="cmd_draw_indirect_count") cmd_draw_indirect_count:proc(commandBuffer:  CommandBuffer, buffer:  Buffer, offset:  DeviceSize, countBuffer:  Buffer, countBufferOffset:  DeviceSize, maxDrawCount:  u32, stride:  u32) ->  void;
@(link_name="cmd_bind_shading_rate_image_nv") cmd_bind_shading_rate_image_nv:proc(commandBuffer:  CommandBuffer, imageView:  ImageView, imageLayout:  ImageLayout) ->  void;
@(link_name="cmd_copy_acceleration_structure_khr") cmd_copy_acceleration_structure_khr:proc(commandBuffer:  CommandBuffer, pInfo: ^CopyAccelerationStructureInfoKHR) ->  void;
@(link_name="set_event") set_event:proc(device:  Device, event:  Event) ->  Result;
@(link_name="get_generated_commands_memory_requirements_nv") get_generated_commands_memory_requirements_nv:proc(device:  Device, pInfo: ^GeneratedCommandsMemoryRequirementsInfoNV, pMemoryRequirements: ^MemoryRequirements2) ->  void;
@(link_name="bind_image_memory_2") bind_image_memory_2:proc(device:  Device, bindInfoCount:  u32, pBindInfos: ^BindImageMemoryInfo) ->  Result;
@(link_name="enumerate_physical_device_groups") enumerate_physical_device_groups:proc(instance:  Instance, pPhysicalDeviceGroupCount: ^u32, pPhysicalDeviceGroupProperties: ^PhysicalDeviceGroupProperties) ->  Result;
@(link_name="get_past_presentation_timing_google") get_past_presentation_timing_google:proc(device:  Device, swapchain:  SwapchainKHR, pPresentationTimingCount: ^u32, pPresentationTimings: ^PastPresentationTimingGOOGLE) ->  Result;
@(link_name="create_query_pool") create_query_pool:proc(device:  Device, pCreateInfo: ^QueryPoolCreateInfo, pAllocator: ^AllocationCallbacks, pQueryPool: ^QueryPool) ->  Result;
@(link_name="get_physical_device_queue_family_performance_query_passes_khr") get_physical_device_queue_family_performance_query_passes_khr:proc(physicalDevice:  PhysicalDevice, pPerformanceQueryCreateInfo: ^QueryPoolPerformanceCreateInfoKHR, pNumPasses: ^u32) ->  void;
@(link_name="free_memory") free_memory:proc(device:  Device, memory:  DeviceMemory, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_set_depth_test_enable_ext") cmd_set_depth_test_enable_ext:proc(commandBuffer:  CommandBuffer, depthTestEnable:  Bool32) ->  void;
@(link_name="get_physical_device_memory_properties") get_physical_device_memory_properties:proc(physicalDevice:  PhysicalDevice, pMemoryProperties: ^PhysicalDeviceMemoryProperties) ->  void;
@(link_name="uninitialize_performance_api_intel") uninitialize_performance_api_intel:proc(device:  Device) ->  void;
@(link_name="reset_command_buffer") reset_command_buffer:proc(commandBuffer:  CommandBuffer, flags:  CommandBufferResetFlags) ->  Result;
@(link_name="get_refresh_cycle_duration_google") get_refresh_cycle_duration_google:proc(device:  Device, swapchain:  SwapchainKHR, pDisplayTimingProperties: ^RefreshCycleDurationGOOGLE) ->  Result;
@(link_name="get_physical_device_wayland_presentation_support_khr") get_physical_device_wayland_presentation_support_khr:proc(physicalDevice:  PhysicalDevice, queueFamilyIndex:  u32, display: ^wl_display) ->  Bool32;
@(link_name="cmd_set_checkpoint_nv") cmd_set_checkpoint_nv:proc(commandBuffer:  CommandBuffer, pCheckpointMarker: ^void) ->  void;
@(link_name="cmd_bind_transform_feedback_buffers_ext") cmd_bind_transform_feedback_buffers_ext:proc(commandBuffer:  CommandBuffer, firstBinding:  u32, bindingCount:  u32, pBuffers: ^Buffer, pOffsets: ^DeviceSize, pSizes: ^DeviceSize) ->  void;
@(link_name="get_fence_status") get_fence_status:proc(device:  Device, fence:  Fence) ->  Result;
@(link_name="create_buffer") create_buffer:proc(device:  Device, pCreateInfo: ^BufferCreateInfo, pAllocator: ^AllocationCallbacks, pBuffer: ^Buffer) ->  Result;
@(link_name="destroy_surface_khr") destroy_surface_khr:proc(instance:  Instance, surface:  SurfaceKHR, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_preprocess_generated_commands_nv") cmd_preprocess_generated_commands_nv:proc(commandBuffer:  CommandBuffer, pGeneratedCommandsInfo: ^GeneratedCommandsInfoNV) ->  void;
@(link_name="get_physical_device_sparse_image_format_properties_2") get_physical_device_sparse_image_format_properties_2:proc(physicalDevice:  PhysicalDevice, pFormatInfo: ^PhysicalDeviceSparseImageFormatInfo2, pPropertyCount: ^u32, pProperties: ^SparseImageFormatProperties2) ->  void;
@(link_name="allocate_command_buffers") allocate_command_buffers:proc(device:  Device, pAllocateInfo: ^CommandBufferAllocateInfo, pCommandBuffers: ^CommandBuffer) ->  Result;
@(link_name="cmd_begin_query") cmd_begin_query:proc(commandBuffer:  CommandBuffer, queryPool:  QueryPool, query:  u32, flags:  QueryControlFlags) ->  void;
@(link_name="create_display_mode_khr") create_display_mode_khr:proc(physicalDevice:  PhysicalDevice, display:  DisplayKHR, pCreateInfo: ^DisplayModeCreateInfoKHR, pAllocator: ^AllocationCallbacks, pMode: ^DisplayModeKHR) ->  Result;
@(link_name="create_swapchain_khr") create_swapchain_khr:proc(device:  Device, pCreateInfo: ^SwapchainCreateInfoKHR, pAllocator: ^AllocationCallbacks, pSwapchain: ^SwapchainKHR) ->  Result;
@(link_name="cmd_set_viewport_shading_rate_palette_nv") cmd_set_viewport_shading_rate_palette_nv:proc(commandBuffer:  CommandBuffer, firstViewport:  u32, viewportCount:  u32, pShadingRatePalettes: ^ShadingRatePaletteNV) ->  void;
@(link_name="cmd_copy_acceleration_structure_to_memory_khr") cmd_copy_acceleration_structure_to_memory_khr:proc(commandBuffer:  CommandBuffer, pInfo: ^CopyAccelerationStructureToMemoryInfoKHR) ->  void;
@(link_name="destroy_query_pool") destroy_query_pool:proc(device:  Device, queryPool:  QueryPool, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="cmd_dispatch_base") cmd_dispatch_base:proc(commandBuffer:  CommandBuffer, baseGroupX:  u32, baseGroupY:  u32, baseGroupZ:  u32, groupCountX:  u32, groupCountY:  u32, groupCountZ:  u32) ->  void;
@(link_name="get_validation_cache_data_ext") get_validation_cache_data_ext:proc(device:  Device, validationCache:  ValidationCacheEXT, pDataSize: ^uint, pData: ^void) ->  Result;
@(link_name="copy_memory_to_acceleration_structure_khr") copy_memory_to_acceleration_structure_khr:proc(device:  Device, deferredOperation:  DeferredOperationKHR, pInfo: ^CopyMemoryToAccelerationStructureInfoKHR) ->  Result;
@(link_name="cmd_trace_rays_khr") cmd_trace_rays_khr:proc(commandBuffer:  CommandBuffer, pRaygenShaderBindingTable: ^StridedDeviceAddressRegionKHR, pMissShaderBindingTable: ^StridedDeviceAddressRegionKHR, pHitShaderBindingTable: ^StridedDeviceAddressRegionKHR, pCallableShaderBindingTable: ^StridedDeviceAddressRegionKHR, width:  u32, height:  u32, depth:  u32) ->  void;
@(link_name="get_rand_r_output_display_ext") get_rand_r_output_display_ext:proc(physicalDevice:  PhysicalDevice, dpy: ^Display, rrOutput:  RROutput, pDisplay: ^DisplayKHR) ->  Result;
@(link_name="reset_query_pool") reset_query_pool:proc(device:  Device, queryPool:  QueryPool, firstQuery:  u32, queryCount:  u32) ->  void;
@(link_name="cmd_bind_index_buffer") cmd_bind_index_buffer:proc(commandBuffer:  CommandBuffer, buffer:  Buffer, offset:  DeviceSize, indexType:  IndexType) ->  void;
@(link_name="cmd_bind_vertex_buffers") cmd_bind_vertex_buffers:proc(commandBuffer:  CommandBuffer, firstBinding:  u32, bindingCount:  u32, pBuffers: ^Buffer, pOffsets: ^DeviceSize) ->  void;
@(link_name="create_render_pass") create_render_pass:proc(device:  Device, pCreateInfo: ^RenderPassCreateInfo, pAllocator: ^AllocationCallbacks, pRenderPass: ^RenderPass) ->  Result;
@(link_name="create_compute_pipelines") create_compute_pipelines:proc(device:  Device, pipelineCache:  PipelineCache, createInfoCount:  u32, pCreateInfos: ^ComputePipelineCreateInfo, pAllocator: ^AllocationCallbacks, pPipelines: ^Pipeline) ->  Result;
@(link_name="debug_marker_set_object_name_ext") debug_marker_set_object_name_ext:proc(device:  Device, pNameInfo: ^DebugMarkerObjectNameInfoEXT) ->  Result;
@(link_name="import_semaphore_fd_khr") import_semaphore_fd_khr:proc(device:  Device, pImportSemaphoreFdInfo: ^ImportSemaphoreFdInfoKHR) ->  Result;
@(link_name="get_instance_proc_addr") get_instance_proc_addr:proc(instance:  Instance, pName: cstring) ->  PFN_vkVoidFunction;
@(link_name="bind_buffer_memory_2") bind_buffer_memory_2:proc(device:  Device, bindInfoCount:  u32, pBindInfos: ^BindBufferMemoryInfo) ->  Result;
@(link_name="get_display_plane_capabilities_khr") get_display_plane_capabilities_khr:proc(physicalDevice:  PhysicalDevice, mode:  DisplayModeKHR, planeIndex:  u32, pCapabilities: ^DisplayPlaneCapabilitiesKHR) ->  Result;
@(link_name="cmd_clear_depth_stencil_image") cmd_clear_depth_stencil_image:proc(commandBuffer:  CommandBuffer, image:  Image, imageLayout:  ImageLayout, pDepthStencil: ^ClearDepthStencilValue, rangeCount:  u32, pRanges: ^ImageSubresourceRange) ->  void;
@(link_name="set_debug_utils_object_name_ext") set_debug_utils_object_name_ext:proc(device:  Device, pNameInfo: ^DebugUtilsObjectNameInfoEXT) ->  Result;
@(link_name="merge_pipeline_caches") merge_pipeline_caches:proc(device:  Device, dstCache:  PipelineCache, srcCacheCount:  u32, pSrcCaches: ^PipelineCache) ->  Result;
@(link_name="free_command_buffers") free_command_buffers:proc(device:  Device, commandPool:  CommandPool, commandBufferCount:  u32, pCommandBuffers: ^CommandBuffer) ->  void;
@(link_name="submit_debug_utils_message_ext") submit_debug_utils_message_ext:proc(instance:  Instance, messageSeverity:  DebugUtilsMessageSeverityFlagsEXT, messageTypes:  DebugUtilsMessageTypeFlagsEXT, pCallbackData: ^DebugUtilsMessengerCallbackDataEXT) ->  void;
@(link_name="destroy_pipeline") destroy_pipeline:proc(device:  Device, pipeline:  Pipeline, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_memory_host_pointer_properties_ext") get_memory_host_pointer_properties_ext:proc(device:  Device, handleType:  ExternalMemoryHandleTypeFlags, pHostPointer: ^void, pMemoryHostPointerProperties: ^MemoryHostPointerPropertiesEXT) ->  Result;
@(link_name="create_render_pass_2") create_render_pass_2:proc(device:  Device, pCreateInfo: ^RenderPassCreateInfo2, pAllocator: ^AllocationCallbacks, pRenderPass: ^RenderPass) ->  Result;
@(link_name="cmd_copy_memory_to_acceleration_structure_khr") cmd_copy_memory_to_acceleration_structure_khr:proc(commandBuffer:  CommandBuffer, pInfo: ^CopyMemoryToAccelerationStructureInfoKHR) ->  void;
@(link_name="get_acceleration_structure_handle_nv") get_acceleration_structure_handle_nv:proc(device:  Device, accelerationStructure:  AccelerationStructureNV, dataSize:  uint, pData: ^void) ->  Result;
@(link_name="destroy_fence") destroy_fence:proc(device:  Device, fence:  Fence, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="get_device_acceleration_structure_compatibility_khr") get_device_acceleration_structure_compatibility_khr:proc(device:  Device, pVersionInfo: ^AccelerationStructureVersionInfoKHR, pCompatibility: ^AccelerationStructureCompatibilityKHR) ->  void;
@(link_name="get_image_sparse_memory_requirements") get_image_sparse_memory_requirements:proc(device:  Device, image:  Image, pSparseMemoryRequirementCount: ^u32, pSparseMemoryRequirements: ^SparseImageMemoryRequirements) ->  void;
@(link_name="get_query_pool_results") get_query_pool_results:proc(device:  Device, queryPool:  QueryPool, firstQuery:  u32, queryCount:  u32, dataSize:  uint, pData: ^void, stride:  DeviceSize, flags:  QueryResultFlags) ->  Result;
@(link_name="cmd_set_stencil_write_mask") cmd_set_stencil_write_mask:proc(commandBuffer:  CommandBuffer, faceMask:  StencilFaceFlags, writeMask:  u32) ->  void;
@(link_name="import_fence_win_32_handle_khr") import_fence_win_32_handle_khr:proc(device:  Device, pImportFenceWin32HandleInfo: ^ImportFenceWin32HandleInfoKHR) ->  Result;
@(link_name="get_device_memory_opaque_capture_address") get_device_memory_opaque_capture_address:proc(device:  Device, pInfo: ^DeviceMemoryOpaqueCaptureAddressInfo) ->  u64;
@(link_name="cmd_set_line_stipple_ext") cmd_set_line_stipple_ext:proc(commandBuffer:  CommandBuffer, lineStippleFactor:  u32, lineStipplePattern:  u16) ->  void;
@(link_name="cmd_set_front_face_ext") cmd_set_front_face_ext:proc(commandBuffer:  CommandBuffer, frontFace:  FrontFace) ->  void;
@(link_name="cmd_draw_indexed_indirect") cmd_draw_indexed_indirect:proc(commandBuffer:  CommandBuffer, buffer:  Buffer, offset:  DeviceSize, drawCount:  u32, stride:  u32) ->  void;
@(link_name="cmd_reset_query_pool") cmd_reset_query_pool:proc(commandBuffer:  CommandBuffer, queryPool:  QueryPool, firstQuery:  u32, queryCount:  u32) ->  void;
@(link_name="release_full_screen_exclusive_mode_ext") release_full_screen_exclusive_mode_ext:proc(device:  Device, swapchain:  SwapchainKHR) ->  Result;
@(link_name="cmd_set_viewport_with_count_ext") cmd_set_viewport_with_count_ext:proc(commandBuffer:  CommandBuffer, viewportCount:  u32, pViewports: ^Viewport) ->  void;
@(link_name="cmd_begin_conditional_rendering_ext") cmd_begin_conditional_rendering_ext:proc(commandBuffer:  CommandBuffer, pConditionalRenderingBegin: ^ConditionalRenderingBeginInfoEXT) ->  void;
@(link_name="cmd_fill_buffer") cmd_fill_buffer:proc(commandBuffer:  CommandBuffer, dstBuffer:  Buffer, dstOffset:  DeviceSize, size:  DeviceSize, data:  u32) ->  void;
@(link_name="cmd_bind_vertex_buffers_2ext") cmd_bind_vertex_buffers_2ext:proc(commandBuffer:  CommandBuffer, firstBinding:  u32, bindingCount:  u32, pBuffers: ^Buffer, pOffsets: ^DeviceSize, pSizes: ^DeviceSize, pStrides: ^DeviceSize) ->  void;
@(link_name="cmd_set_fragment_shading_rate_enum_nv") cmd_set_fragment_shading_rate_enum_nv:proc(commandBuffer:  CommandBuffer, shadingRate:  FragmentShadingRateNV, combinerOps:  ^[2]FragmentShadingRateCombinerOpKHR) ->  void;
@(link_name="get_buffer_opaque_capture_address") get_buffer_opaque_capture_address:proc(device:  Device, pInfo: ^BufferDeviceAddressInfo) ->  u64;
@(link_name="create_acceleration_structure_khr") create_acceleration_structure_khr:proc(device:  Device, pCreateInfo: ^AccelerationStructureCreateInfoKHR, pAllocator: ^AllocationCallbacks, pAccelerationStructure: ^AccelerationStructureKHR) ->  Result;
@(link_name="cmd_set_depth_write_enable_ext") cmd_set_depth_write_enable_ext:proc(commandBuffer:  CommandBuffer, depthWriteEnable:  Bool32) ->  void;
@(link_name="destroy_debug_report_callback_ext") destroy_debug_report_callback_ext:proc(instance:  Instance, callback:  DebugReportCallbackEXT, pAllocator: ^AllocationCallbacks) ->  void;
@(link_name="flush_mapped_memory_ranges") flush_mapped_memory_ranges:proc(device:  Device, memoryRangeCount:  u32, pMemoryRanges: ^MappedMemoryRange) ->  Result;
MAX_DEVICE_GROUP_SIZE_KHR::MAX_DEVICE_GROUP_SIZE;
MAX_PHYSICAL_DEVICE_NAME_SIZE::256;
LUID_SIZE::8;
MAX_MEMORY_TYPES::32;
MAX_DESCRIPTION_SIZE::256;
UUID_SIZE::16;
LUID_SIZE_KHR::LUID_SIZE;
LOD_CLAMP_NONE::f32(1000);
QUEUE_FAMILY_FOREIGN_EXT::(~(u32(0))) - (2);
MAX_DRIVER_NAME_SIZE_KHR::MAX_DRIVER_NAME_SIZE;
MAX_DRIVER_INFO_SIZE_KHR::MAX_DRIVER_INFO_SIZE;
MAX_DRIVER_INFO_SIZE::256;
MAX_DRIVER_NAME_SIZE::256;
SHADER_UNUSED_KHR::~(u32(0));
MAX_EXTENSION_NAME_SIZE::256;
REMAINING_ARRAY_LAYERS::~(u32(0));
MAX_DEVICE_GROUP_SIZE::32;
ATTACHMENT_UNUSED::~(u32(0));
TRUE::1;
QUEUE_FAMILY_IGNORED::~(u32(0));
SHADER_UNUSED_NV::SHADER_UNUSED_KHR;
WHOLE_SIZE::~(u64(0));
QUEUE_FAMILY_EXTERNAL::(~(u32(0))) - (1);
FALSE::0;
MAX_MEMORY_HEAPS::16;
QUEUE_FAMILY_EXTERNAL_KHR::QUEUE_FAMILY_EXTERNAL;
REMAINING_MIP_LEVELS::~(u32(0));
SUBPASS_EXTERNAL::~(u32(0));
IndirectCommandsLayoutCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  IndirectCommandsLayoutUsageFlagsNV,
	pipelineBindPoint:  PipelineBindPoint,
	tokenCount:  u32,
	pTokens: ^IndirectCommandsLayoutTokenNV,
	streamCount:  u32,
	pStreamStrides: ^u32
}

PhysicalDeviceGroupProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	physicalDeviceCount:  u32,
	physicalDevices:  [MAX_DEVICE_GROUP_SIZE]PhysicalDevice,
	subsetAllocation:  Bool32
}

PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX::struct {
	sType:  StructureType,
	pNext: ^void,
	perViewPositionAllComponents:  Bool32
}

PhysicalDeviceDepthStencilResolveProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	supportedDepthResolveModes:  ResolveModeFlags,
	supportedStencilResolveModes:  ResolveModeFlags,
	independentResolveNone:  Bool32,
	independentResolve:  Bool32
}

PerformanceConfigurationAcquireInfoINTEL::struct {
	sType:  StructureType,
	pNext: ^void,
	type:  PerformanceConfigurationTypeINTEL
}

ImportAndroidHardwareBufferInfoANDROID::struct {
	sType:  StructureType,
	pNext: ^void,
	buffer: ^AHardwareBuffer
}

DisplayPresentInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcRect:  Rect2D,
	dstRect:  Rect2D,
	persistent:  Bool32
}

AttachmentReferenceStencilLayout::struct {
	sType:  StructureType,
	pNext: ^void,
	stencilLayout:  ImageLayout
}

PhysicalDeviceCustomBorderColorPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	maxCustomBorderColorSamplers:  u32
}

ImagePlaneMemoryRequirementsInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	planeAspect:  ImageAspectFlags
}

SubpassBeginInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	contents:  SubpassContents
}

BufferImageCopy2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	bufferOffset:  DeviceSize,
	bufferRowLength:  u32,
	bufferImageHeight:  u32,
	imageSubresource:  ImageSubresourceLayers,
	imageOffset:  Offset3D,
	imageExtent:  Extent3D
}

CooperativeMatrixPropertiesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	MSize:  u32,
	NSize:  u32,
	KSize:  u32,
	AType:  ComponentTypeNV,
	BType:  ComponentTypeNV,
	CType:  ComponentTypeNV,
	DType:  ComponentTypeNV,
	scope:  ScopeNV
}

ImageFormatListCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	viewFormatCount:  u32,
	pViewFormats: ^Format
}

CopyImageInfo2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcImage:  Image,
	srcImageLayout:  ImageLayout,
	dstImage:  Image,
	dstImageLayout:  ImageLayout,
	regionCount:  u32,
	pRegions: ^ImageCopy2KHR
}

PhysicalDeviceProtectedMemoryFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	protectedMemory:  Bool32
}

DescriptorPoolSize::struct {
	type:  DescriptorType,
	descriptorCount:  u32
}

SubpassSampleLocationsEXT::struct {
	subpassIndex:  u32,
	sampleLocationsInfo:  SampleLocationsInfoEXT
}

PipelineDynamicStateCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineDynamicStateCreateFlags,
	dynamicStateCount:  u32,
	pDynamicStates: ^DynamicState
}

SetStateFlagsIndirectCommandNV::struct {
	data:  u32
}

StencilOpState::struct {
	failOp:  StencilOp,
	passOp:  StencilOp,
	depthFailOp:  StencilOp,
	compareOp:  CompareOp,
	compareMask:  u32,
	writeMask:  u32,
	reference:  u32
}

PhysicalDeviceShaderSubgroupExtendedTypesFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderSubgroupExtendedTypes:  Bool32
}

SamplerYcbcrConversionImageFormatProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	combinedImageSamplerDescriptorCount:  u32
}

PhysicalDeviceFragmentDensityMapFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	fragmentDensityMap:  Bool32,
	fragmentDensityMapDynamic:  Bool32,
	fragmentDensityMapNonSubsampledImages:  Bool32
}

PipelineExecutableInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	pipeline:  Pipeline,
	executableIndex:  u32
}

DeviceDeviceMemoryReportCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DeviceMemoryReportFlagsEXT,
	pfnUserCallback:  PFN_vkDeviceMemoryReportCallbackEXT,
	pUserData: ^void
}

PipelineViewportExclusiveScissorStateCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	exclusiveScissorCount:  u32,
	pExclusiveScissors: ^Rect2D
}

MemoryDedicatedAllocateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	image:  Image,
	buffer:  Buffer
}

WriteDescriptorSetAccelerationStructureKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	accelerationStructureCount:  u32,
	pAccelerationStructures: ^AccelerationStructureKHR
}

PipelineCoverageReductionStateCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineCoverageReductionStateCreateFlagsNV,
	coverageReductionMode:  CoverageReductionModeNV
}

PipelineExecutableStatisticValueKHR::struct #raw_union {
	b32:  Bool32,
	i64:  i64,
	u64:  u64,
	f64:  f64
}

BufferCopy2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcOffset:  DeviceSize,
	dstOffset:  DeviceSize,
	size:  DeviceSize
}

CommandBufferInheritanceConditionalRenderingInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	conditionalRenderingEnable:  Bool32
}

PhysicalDeviceFragmentShadingRateEnumsPropertiesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	maxFragmentShadingRateInvocationCount:  SampleCountFlags
}

DescriptorSetVariableDescriptorCountLayoutSupport::struct {
	sType:  StructureType,
	pNext: ^void,
	maxVariableDescriptorCount:  u32
}

PipelineColorBlendStateCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineColorBlendStateCreateFlags,
	logicOpEnable:  Bool32,
	logicOp:  LogicOp,
	attachmentCount:  u32,
	pAttachments: ^PipelineColorBlendAttachmentState,
	blendConstants:  [4]f32
}

PhysicalDeviceSparseProperties::struct {
	residencyStandard2DBlockShape:  Bool32,
	residencyStandard2DMultisampleBlockShape:  Bool32,
	residencyStandard3DBlockShape:  Bool32,
	residencyAlignedMipSize:  Bool32,
	residencyNonResidentStrict:  Bool32
}

PhysicalDeviceSurfaceInfo2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	surface:  SurfaceKHR
}

RenderPassInputAttachmentAspectCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	aspectReferenceCount:  u32,
	pAspectReferences: ^InputAttachmentAspectReference
}

PhysicalDeviceCoherentMemoryFeaturesAMD::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceCoherentMemory:  Bool32
}

PipelineSampleLocationsStateCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	sampleLocationsEnable:  Bool32,
	sampleLocationsInfo:  SampleLocationsInfoEXT
}

DisplayPropertiesKHR::struct {
	display:  DisplayKHR,
	displayName: cstring,
	physicalDimensions:  Extent2D,
	physicalResolution:  Extent2D,
	supportedTransforms:  SurfaceTransformFlagsKHR,
	planeReorderPossible:  Bool32,
	persistentContent:  Bool32
}

PipelineRasterizationConservativeStateCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineRasterizationConservativeStateCreateFlagsEXT,
	conservativeRasterizationMode:  ConservativeRasterizationModeEXT,
	extraPrimitiveOverestimationSize:  f32
}

DeviceGroupSubmitInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	waitSemaphoreCount:  u32,
	pWaitSemaphoreDeviceIndices: ^u32,
	commandBufferCount:  u32,
	pCommandBufferDeviceMasks: ^u32,
	signalSemaphoreCount:  u32,
	pSignalSemaphoreDeviceIndices: ^u32
}

Extent2D::struct {
	width:  u32,
	height:  u32
}

PhysicalDeviceCooperativeMatrixPropertiesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	cooperativeMatrixSupportedStages:  ShaderStageFlags
}

StridedDeviceAddressRegionKHR::struct {
	deviceAddress:  DeviceAddress,
	stride:  DeviceSize,
	size:  DeviceSize
}

PhysicalDeviceBlendOperationAdvancedFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	advancedBlendCoherentOperations:  Bool32
}

PipelineTessellationDomainOriginStateCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	domainOrigin:  TessellationDomainOrigin
}

PhysicalDeviceYcbcrImageArraysFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	ycbcrImageArrays:  Bool32
}

PhysicalDeviceVulkan11Features::struct {
	sType:  StructureType,
	pNext: ^void,
	storageBuffer16BitAccess:  Bool32,
	uniformAndStorageBuffer16BitAccess:  Bool32,
	storagePushConstant16:  Bool32,
	storageInputOutput16:  Bool32,
	multiview:  Bool32,
	multiviewGeometryShader:  Bool32,
	multiviewTessellationShader:  Bool32,
	variablePointersStorageBuffer:  Bool32,
	variablePointers:  Bool32,
	protectedMemory:  Bool32,
	samplerYcbcrConversion:  Bool32,
	shaderDrawParameters:  Bool32
}

BufferViewCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  BufferViewCreateFlags,
	buffer:  Buffer,
	format:  Format,
	offset:  DeviceSize,
	range:  DeviceSize
}

PerformanceValueDataINTEL::struct #raw_union {
	value32:  u32,
	value64:  u64,
	valueFloat:  f32,
	valueBool:  Bool32,
	valueString: cstring
}

CopyAccelerationStructureInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	src:  AccelerationStructureKHR,
	dst:  AccelerationStructureKHR,
	mode:  CopyAccelerationStructureModeKHR
}

SurfaceFullScreenExclusiveWin32InfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	hmonitor:  HMONITOR
}

PhysicalDevicePortabilitySubsetFeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	constantAlphaColorBlendFactors:  Bool32,
	events:  Bool32,
	imageViewFormatReinterpretation:  Bool32,
	imageViewFormatSwizzle:  Bool32,
	imageView2DOn3DImage:  Bool32,
	multisampleArrayImage:  Bool32,
	mutableComparisonSamplers:  Bool32,
	pointPolygons:  Bool32,
	samplerMipLodBias:  Bool32,
	separateStencilMaskRef:  Bool32,
	shaderSampleRateInterpolationFunctions:  Bool32,
	tessellationIsolines:  Bool32,
	tessellationPointMode:  Bool32,
	triangleFans:  Bool32,
	vertexAttributeAccessBeyondStride:  Bool32
}

DebugUtilsLabelEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	pLabelName: cstring,
	color:  [4]f32
}

PhysicalDeviceTexelBufferAlignmentFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	texelBufferAlignment:  Bool32
}

PhysicalDeviceImagelessFramebufferFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	imagelessFramebuffer:  Bool32
}

CoarseSampleLocationNV::struct {
	pixelX:  u32,
	pixelY:  u32,
	sample:  u32
}

SurfaceFullScreenExclusiveInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	fullScreenExclusive:  FullScreenExclusiveEXT
}

PerformanceCounterResultKHR::struct #raw_union {
	int32:  i32,
	int64:  i64,
	uint32:  u32,
	uint64:  u64,
	float32:  f32,
	float64:  f64
}

RenderPassBeginInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	renderPass:  RenderPass,
	framebuffer:  Framebuffer,
	renderArea:  Rect2D,
	clearValueCount:  u32,
	pClearValues: ^ClearValue
}

ExternalImageFormatProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	externalMemoryProperties:  ExternalMemoryProperties
}

DeviceGroupDeviceCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	physicalDeviceCount:  u32,
	pPhysicalDevices: ^PhysicalDevice
}

RenderPassAttachmentBeginInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	attachmentCount:  u32,
	pAttachments: ^ImageView
}

ClearColorValue::struct #raw_union {
	float32:  [4]f32,
	int32:  [4]i32,
	uint32:  [4]u32
}

PhysicalDeviceMemoryPriorityFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	memoryPriority:  Bool32
}

PipelineLibraryCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	libraryCount:  u32,
	pLibraries: ^Pipeline
}

ImageDrmFormatModifierExplicitCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	drmFormatModifier:  u64,
	drmFormatModifierPlaneCount:  u32,
	pPlaneLayouts: ^SubresourceLayout
}

RenderPassCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  RenderPassCreateFlags,
	attachmentCount:  u32,
	pAttachments: ^AttachmentDescription,
	subpassCount:  u32,
	pSubpasses: ^SubpassDescription,
	dependencyCount:  u32,
	pDependencies: ^SubpassDependency
}

DeviceCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DeviceCreateFlags,
	queueCreateInfoCount:  u32,
	pQueueCreateInfos: ^DeviceQueueCreateInfo,
	enabledLayerCount:  u32,
	ppEnabledLayerNames: ^^u8,
	enabledExtensionCount:  u32,
	ppEnabledExtensionNames: ^^u8,
	pEnabledFeatures: ^PhysicalDeviceFeatures
}

QueueFamilyCheckpointPropertiesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	checkpointExecutionStageMask:  PipelineStageFlags
}

ExportFenceWin32HandleInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	pAttributes: ^SECURITY_ATTRIBUTES,
	dwAccess:  DWORD,
	name:  LPCWSTR
}

PhysicalDevicePCIBusInfoPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	pciDomain:  u32,
	pciBus:  u32,
	pciDevice:  u32,
	pciFunction:  u32
}

LayerProperties::struct {
	layerName:  [MAX_EXTENSION_NAME_SIZE]u8,
	specVersion:  u32,
	implementationVersion:  u32,
	description:  [MAX_DESCRIPTION_SIZE]u8
}

RenderPassSampleLocationsBeginInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	attachmentInitialSampleLocationsCount:  u32,
	pAttachmentInitialSampleLocations: ^AttachmentSampleLocationsEXT,
	postSubpassSampleLocationsCount:  u32,
	pPostSubpassSampleLocations: ^SubpassSampleLocationsEXT
}

CommandBufferAllocateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	commandPool:  CommandPool,
	level:  CommandBufferLevel,
	commandBufferCount:  u32
}

PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderIntegerFunctions2:  Bool32
}

AccelerationStructureInstanceKHR::struct {
	transform:  TransformMatrixKHR,
	instanceCustomIndex:  [3]u8,
	mask:  u8,
	instanceShaderBindingTableRecordOffset:  [3]u8,
	flags:  u8,
	accelerationStructureReference:  u64
}

CopyImageToBufferInfo2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcImage:  Image,
	srcImageLayout:  ImageLayout,
	dstBuffer:  Buffer,
	regionCount:  u32,
	pRegions: ^BufferImageCopy2KHR
}

MultisamplePropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	maxSampleLocationGridSize:  Extent2D
}

AcquireProfilingLockInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  AcquireProfilingLockFlagsKHR,
	timeout:  u64
}

Win32SurfaceCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  Win32SurfaceCreateFlagsKHR,
	hinstance:  HINSTANCE,
	hwnd:  HWND
}

PresentRegionsKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	swapchainCount:  u32,
	pRegions: ^PresentRegionKHR
}

ImportMemoryWin32HandleInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	handleType:  ExternalMemoryHandleTypeFlags,
	handle:  HANDLE,
	name:  LPCWSTR
}

SemaphoreSubmitInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	semaphore:  Semaphore,
	value:  u64,
	stageMask:  PipelineStageFlags2KHR,
	deviceIndex:  u32
}

GraphicsShaderGroupCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	stageCount:  u32,
	pStages: ^PipelineShaderStageCreateInfo,
	pVertexInputState: ^PipelineVertexInputStateCreateInfo,
	pTessellationState: ^PipelineTessellationStateCreateInfo
}

PipelineRasterizationLineStateCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	lineRasterizationMode:  LineRasterizationModeEXT,
	stippledLineEnable:  Bool32,
	lineStippleFactor:  u32,
	lineStipplePattern:  u16
}

InstanceCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  InstanceCreateFlags,
	pApplicationInfo: ^ApplicationInfo,
	enabledLayerCount:  u32,
	ppEnabledLayerNames: ^^u8,
	enabledExtensionCount:  u32,
	ppEnabledExtensionNames: ^^u8
}

PhysicalDeviceImageViewImageFormatInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	imageViewType:  ImageViewType
}

SubmitInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	waitSemaphoreCount:  u32,
	pWaitSemaphores: ^Semaphore,
	pWaitDstStageMask: ^PipelineStageFlags,
	commandBufferCount:  u32,
	pCommandBuffers: ^CommandBuffer,
	signalSemaphoreCount:  u32,
	pSignalSemaphores: ^Semaphore
}

DedicatedAllocationBufferCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	dedicatedAllocation:  Bool32
}

PhysicalDeviceIDProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceUUID:  [UUID_SIZE]u8,
	driverUUID:  [UUID_SIZE]u8,
	deviceLUID:  [LUID_SIZE]u8,
	deviceNodeMask:  u32,
	deviceLUIDValid:  Bool32
}

SurfaceCapabilities2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	surfaceCapabilities:  SurfaceCapabilitiesKHR
}

PhysicalDevicePointClippingProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	pointClippingBehavior:  PointClippingBehavior
}

SubpassDependency2::struct {
	sType:  StructureType,
	pNext: ^void,
	srcSubpass:  u32,
	dstSubpass:  u32,
	srcStageMask:  PipelineStageFlags,
	dstStageMask:  PipelineStageFlags,
	srcAccessMask:  AccessFlags,
	dstAccessMask:  AccessFlags,
	dependencyFlags:  DependencyFlags,
	viewOffset:  i32
}

BufferMemoryRequirementsInfo2::struct {
	sType:  StructureType,
	pNext: ^void,
	buffer:  Buffer
}

PhysicalDeviceInlineUniformBlockFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	inlineUniformBlock:  Bool32,
	descriptorBindingInlineUniformBlockUpdateAfterBind:  Bool32
}

AndroidHardwareBufferFormatPropertiesANDROID::struct {
	sType:  StructureType,
	pNext: ^void,
	format:  Format,
	externalFormat:  u64,
	formatFeatures:  FormatFeatureFlags,
	samplerYcbcrConversionComponents:  ComponentMapping,
	suggestedYcbcrModel:  SamplerYcbcrModelConversion,
	suggestedYcbcrRange:  SamplerYcbcrRange,
	suggestedXChromaOffset:  ChromaLocation,
	suggestedYChromaOffset:  ChromaLocation
}

DeviceGroupBindSparseInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	resourceDeviceIndex:  u32,
	memoryDeviceIndex:  u32
}

ImagePipeSurfaceCreateInfoFUCHSIA::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  ImagePipeSurfaceCreateFlagsFUCHSIA,
	imagePipeHandle:  zx_handle_t
}

FenceGetFdInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	fence:  Fence,
	handleType:  ExternalFenceHandleTypeFlags
}

PipelineViewportSwizzleStateCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineViewportSwizzleStateCreateFlagsNV,
	viewportCount:  u32,
	pViewportSwizzles: ^ViewportSwizzleNV
}

PhysicalDevicePipelineExecutablePropertiesFeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	pipelineExecutableInfo:  Bool32
}

DisplayModeCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DisplayModeCreateFlagsKHR,
	parameters:  DisplayModeParametersKHR
}

PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	dedicatedAllocationImageAliasing:  Bool32
}

ImageDrmFormatModifierPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	drmFormatModifier:  u64
}

PhysicalDeviceExternalMemoryHostPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	minImportedHostPointerAlignment:  DeviceSize
}

ImageStencilUsageCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	stencilUsage:  ImageUsageFlags
}

PipelineDiscardRectangleStateCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineDiscardRectangleStateCreateFlagsEXT,
	discardRectangleMode:  DiscardRectangleModeEXT,
	discardRectangleCount:  u32,
	pDiscardRectangles: ^Rect2D
}

PipelineViewportCoarseSampleOrderStateCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	sampleOrderType:  CoarseSampleOrderTypeNV,
	customSampleOrderCount:  u32,
	pCustomSampleOrders: ^CoarseSampleOrderCustomNV
}

PhysicalDevice16BitStorageFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	storageBuffer16BitAccess:  Bool32,
	uniformAndStorageBuffer16BitAccess:  Bool32,
	storagePushConstant16:  Bool32,
	storageInputOutput16:  Bool32
}

ConformanceVersion::struct {
	major:  u8,
	minor:  u8,
	subminor:  u8,
	patch:  u8
}

BufferMemoryBarrier2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcStageMask:  PipelineStageFlags2KHR,
	srcAccessMask:  AccessFlags2KHR,
	dstStageMask:  PipelineStageFlags2KHR,
	dstAccessMask:  AccessFlags2KHR,
	srcQueueFamilyIndex:  u32,
	dstQueueFamilyIndex:  u32,
	buffer:  Buffer,
	offset:  DeviceSize,
	size:  DeviceSize
}

PresentInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	waitSemaphoreCount:  u32,
	pWaitSemaphores: ^Semaphore,
	swapchainCount:  u32,
	pSwapchains: ^SwapchainKHR,
	pImageIndices: ^u32,
	pResults: ^Result
}

SubresourceLayout::struct {
	offset:  DeviceSize,
	size:  DeviceSize,
	rowPitch:  DeviceSize,
	arrayPitch:  DeviceSize,
	depthPitch:  DeviceSize
}

HdrMetadataEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	displayPrimaryRed:  XYColorEXT,
	displayPrimaryGreen:  XYColorEXT,
	displayPrimaryBlue:  XYColorEXT,
	whitePoint:  XYColorEXT,
	maxLuminance:  f32,
	minLuminance:  f32,
	maxContentLightLevel:  f32,
	maxFrameAverageLightLevel:  f32
}

ImageBlit::struct {
	srcSubresource:  ImageSubresourceLayers,
	srcOffsets:  [2]Offset3D,
	dstSubresource:  ImageSubresourceLayers,
	dstOffsets:  [2]Offset3D
}

SwapchainCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  SwapchainCreateFlagsKHR,
	surface:  SurfaceKHR,
	minImageCount:  u32,
	imageFormat:  Format,
	imageColorSpace:  ColorSpaceKHR,
	imageExtent:  Extent2D,
	imageArrayLayers:  u32,
	imageUsage:  ImageUsageFlags,
	imageSharingMode:  SharingMode,
	queueFamilyIndexCount:  u32,
	pQueueFamilyIndices: ^u32,
	preTransform:  SurfaceTransformFlagsKHR,
	compositeAlpha:  CompositeAlphaFlagsKHR,
	presentMode:  PresentModeKHR,
	clipped:  Bool32,
	oldSwapchain:  SwapchainKHR
}

DescriptorPoolInlineUniformBlockCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	maxInlineUniformBlockBindings:  u32
}

ImageViewAddressPropertiesNVX::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceAddress:  DeviceAddress,
	size:  DeviceSize
}

PhysicalDeviceLimits::struct {
	maxImageDimension1D:  u32,
	maxImageDimension2D:  u32,
	maxImageDimension3D:  u32,
	maxImageDimensionCube:  u32,
	maxImageArrayLayers:  u32,
	maxTexelBufferElements:  u32,
	maxUniformBufferRange:  u32,
	maxStorageBufferRange:  u32,
	maxPushConstantsSize:  u32,
	maxMemoryAllocationCount:  u32,
	maxSamplerAllocationCount:  u32,
	bufferImageGranularity:  DeviceSize,
	sparseAddressSpaceSize:  DeviceSize,
	maxBoundDescriptorSets:  u32,
	maxPerStageDescriptorSamplers:  u32,
	maxPerStageDescriptorUniformBuffers:  u32,
	maxPerStageDescriptorStorageBuffers:  u32,
	maxPerStageDescriptorSampledImages:  u32,
	maxPerStageDescriptorStorageImages:  u32,
	maxPerStageDescriptorInputAttachments:  u32,
	maxPerStageResources:  u32,
	maxDescriptorSetSamplers:  u32,
	maxDescriptorSetUniformBuffers:  u32,
	maxDescriptorSetUniformBuffersDynamic:  u32,
	maxDescriptorSetStorageBuffers:  u32,
	maxDescriptorSetStorageBuffersDynamic:  u32,
	maxDescriptorSetSampledImages:  u32,
	maxDescriptorSetStorageImages:  u32,
	maxDescriptorSetInputAttachments:  u32,
	maxVertexInputAttributes:  u32,
	maxVertexInputBindings:  u32,
	maxVertexInputAttributeOffset:  u32,
	maxVertexInputBindingStride:  u32,
	maxVertexOutputComponents:  u32,
	maxTessellationGenerationLevel:  u32,
	maxTessellationPatchSize:  u32,
	maxTessellationControlPerVertexInputComponents:  u32,
	maxTessellationControlPerVertexOutputComponents:  u32,
	maxTessellationControlPerPatchOutputComponents:  u32,
	maxTessellationControlTotalOutputComponents:  u32,
	maxTessellationEvaluationInputComponents:  u32,
	maxTessellationEvaluationOutputComponents:  u32,
	maxGeometryShaderInvocations:  u32,
	maxGeometryInputComponents:  u32,
	maxGeometryOutputComponents:  u32,
	maxGeometryOutputVertices:  u32,
	maxGeometryTotalOutputComponents:  u32,
	maxFragmentInputComponents:  u32,
	maxFragmentOutputAttachments:  u32,
	maxFragmentDualSrcAttachments:  u32,
	maxFragmentCombinedOutputResources:  u32,
	maxComputeSharedMemorySize:  u32,
	maxComputeWorkGroupCount:  [3]u32,
	maxComputeWorkGroupInvocations:  u32,
	maxComputeWorkGroupSize:  [3]u32,
	subPixelPrecisionBits:  u32,
	subTexelPrecisionBits:  u32,
	mipmapPrecisionBits:  u32,
	maxDrawIndexedIndexValue:  u32,
	maxDrawIndirectCount:  u32,
	maxSamplerLodBias:  f32,
	maxSamplerAnisotropy:  f32,
	maxViewports:  u32,
	maxViewportDimensions:  [2]u32,
	viewportBoundsRange:  [2]f32,
	viewportSubPixelBits:  u32,
	minMemoryMapAlignment:  uint,
	minTexelBufferOffsetAlignment:  DeviceSize,
	minUniformBufferOffsetAlignment:  DeviceSize,
	minStorageBufferOffsetAlignment:  DeviceSize,
	minTexelOffset:  i32,
	maxTexelOffset:  u32,
	minTexelGatherOffset:  i32,
	maxTexelGatherOffset:  u32,
	minInterpolationOffset:  f32,
	maxInterpolationOffset:  f32,
	subPixelInterpolationOffsetBits:  u32,
	maxFramebufferWidth:  u32,
	maxFramebufferHeight:  u32,
	maxFramebufferLayers:  u32,
	framebufferColorSampleCounts:  SampleCountFlags,
	framebufferDepthSampleCounts:  SampleCountFlags,
	framebufferStencilSampleCounts:  SampleCountFlags,
	framebufferNoAttachmentsSampleCounts:  SampleCountFlags,
	maxColorAttachments:  u32,
	sampledImageColorSampleCounts:  SampleCountFlags,
	sampledImageIntegerSampleCounts:  SampleCountFlags,
	sampledImageDepthSampleCounts:  SampleCountFlags,
	sampledImageStencilSampleCounts:  SampleCountFlags,
	storageImageSampleCounts:  SampleCountFlags,
	maxSampleMaskWords:  u32,
	timestampComputeAndGraphics:  Bool32,
	timestampPeriod:  f32,
	maxClipDistances:  u32,
	maxCullDistances:  u32,
	maxCombinedClipAndCullDistances:  u32,
	discreteQueuePriorities:  u32,
	pointSizeRange:  [2]f32,
	lineWidthRange:  [2]f32,
	pointSizeGranularity:  f32,
	lineWidthGranularity:  f32,
	strictLines:  Bool32,
	standardSampleLocations:  Bool32,
	optimalBufferCopyOffsetAlignment:  DeviceSize,
	optimalBufferCopyRowPitchAlignment:  DeviceSize,
	nonCoherentAtomSize:  DeviceSize
}

QueueFamilyProperties2::struct {
	sType:  StructureType,
	pNext: ^void,
	queueFamilyProperties:  QueueFamilyProperties
}

PhysicalDeviceSamplerFilterMinmaxProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	filterMinmaxSingleComponentFormats:  Bool32,
	filterMinmaxImageComponentMapping:  Bool32
}

CopyMemoryToAccelerationStructureInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	src:  DeviceOrHostAddressConstKHR,
	dst:  AccelerationStructureKHR,
	mode:  CopyAccelerationStructureModeKHR
}

PipelineFragmentShadingRateStateCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	fragmentSize:  Extent2D,
	combinerOps:  [2]FragmentShadingRateCombinerOpKHR
}

PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	requiredSubgroupSize:  u32
}

SharedPresentSurfaceCapabilitiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	sharedPresentSupportedUsageFlags:  ImageUsageFlags
}

PhysicalDeviceFloatControlsProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	denormBehaviorIndependence:  ShaderFloatControlsIndependence,
	roundingModeIndependence:  ShaderFloatControlsIndependence,
	shaderSignedZeroInfNanPreserveFloat16:  Bool32,
	shaderSignedZeroInfNanPreserveFloat32:  Bool32,
	shaderSignedZeroInfNanPreserveFloat64:  Bool32,
	shaderDenormPreserveFloat16:  Bool32,
	shaderDenormPreserveFloat32:  Bool32,
	shaderDenormPreserveFloat64:  Bool32,
	shaderDenormFlushToZeroFloat16:  Bool32,
	shaderDenormFlushToZeroFloat32:  Bool32,
	shaderDenormFlushToZeroFloat64:  Bool32,
	shaderRoundingModeRTEFloat16:  Bool32,
	shaderRoundingModeRTEFloat32:  Bool32,
	shaderRoundingModeRTEFloat64:  Bool32,
	shaderRoundingModeRTZFloat16:  Bool32,
	shaderRoundingModeRTZFloat32:  Bool32,
	shaderRoundingModeRTZFloat64:  Bool32
}

DebugMarkerObjectTagInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	objectType:  DebugReportObjectTypeEXT,
	object:  u64,
	tagName:  u64,
	tagSize:  uint,
	pTag: ^void
}

QueueFamilyCheckpointProperties2NV::struct {
	sType:  StructureType,
	pNext: ^void,
	checkpointExecutionStageMask:  PipelineStageFlags2KHR
}

ResolveImageInfo2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcImage:  Image,
	srcImageLayout:  ImageLayout,
	dstImage:  Image,
	dstImageLayout:  ImageLayout,
	regionCount:  u32,
	pRegions: ^ImageResolve2KHR
}

DescriptorSetAllocateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	descriptorPool:  DescriptorPool,
	descriptorSetCount:  u32,
	pSetLayouts: ^DescriptorSetLayout
}

ClearDepthStencilValue::struct {
	depth:  f32,
	stencil:  u32
}

DescriptorUpdateTemplateCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DescriptorUpdateTemplateCreateFlags,
	descriptorUpdateEntryCount:  u32,
	pDescriptorUpdateEntries: ^DescriptorUpdateTemplateEntry,
	templateType:  DescriptorUpdateTemplateType,
	descriptorSetLayout:  DescriptorSetLayout,
	pipelineBindPoint:  PipelineBindPoint,
	pipelineLayout:  PipelineLayout,
	set:  u32
}

PhysicalDeviceExclusiveScissorFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	exclusiveScissor:  Bool32
}

PhysicalDeviceImageRobustnessFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	robustImageAccess:  Bool32
}

SubmitInfo2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  SubmitFlagsKHR,
	waitSemaphoreInfoCount:  u32,
	pWaitSemaphoreInfos: ^SemaphoreSubmitInfoKHR,
	commandBufferInfoCount:  u32,
	pCommandBufferInfos: ^CommandBufferSubmitInfoKHR,
	signalSemaphoreInfoCount:  u32,
	pSignalSemaphoreInfos: ^SemaphoreSubmitInfoKHR
}

ImageCopy2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcSubresource:  ImageSubresourceLayers,
	srcOffset:  Offset3D,
	dstSubresource:  ImageSubresourceLayers,
	dstOffset:  Offset3D,
	extent:  Extent3D
}

DeviceQueueInfo2::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DeviceQueueCreateFlags,
	queueFamilyIndex:  u32,
	queueIndex:  u32
}

PhysicalDeviceMutableDescriptorTypeFeaturesVALVE::struct {
	sType:  StructureType,
	pNext: ^void,
	mutableDescriptorType:  Bool32
}

BindImageMemorySwapchainInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	swapchain:  SwapchainKHR,
	imageIndex:  u32
}

AndroidHardwareBufferUsageANDROID::struct {
	sType:  StructureType,
	pNext: ^void,
	androidHardwareBufferUsage:  u64
}

AllocationCallbacks::struct {
	pUserData: ^void,
	pfnAllocation:  PFN_vkAllocationFunction,
	pfnReallocation:  PFN_vkReallocationFunction,
	pfnFree:  PFN_vkFreeFunction,
	pfnInternalAllocation:  PFN_vkInternalAllocationNotification,
	pfnInternalFree:  PFN_vkInternalFreeNotification
}

AccelerationStructureBuildSizesInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	accelerationStructureSize:  DeviceSize,
	updateScratchSize:  DeviceSize,
	buildScratchSize:  DeviceSize
}

PipelineRasterizationStateRasterizationOrderAMD::struct {
	sType:  StructureType,
	pNext: ^void,
	rasterizationOrder:  RasterizationOrderAMD
}

PhysicalDeviceComputeShaderDerivativesFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	computeDerivativeGroupQuads:  Bool32,
	computeDerivativeGroupLinear:  Bool32
}

ExternalFenceProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	exportFromImportedHandleTypes:  ExternalFenceHandleTypeFlags,
	compatibleHandleTypes:  ExternalFenceHandleTypeFlags,
	externalFenceFeatures:  ExternalFenceFeatureFlags
}

PhysicalDeviceSynchronization2FeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	synchronization2:  Bool32
}

Rect2D::struct {
	offset:  Offset2D,
	extent:  Extent2D
}

PhysicalDeviceFragmentDensityMap2PropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	subsampledLoads:  Bool32,
	subsampledCoarseReconstructionEarlyAccess:  Bool32,
	maxSubsampledArrayLayers:  u32,
	maxDescriptorSetSubsampledSamplers:  u32
}

SpecializationMapEntry::struct {
	constantID:  u32,
	offset:  u32,
	size:  uint
}

PhysicalDeviceShaderFloat16Int8Features::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderFloat16:  Bool32,
	shaderInt8:  Bool32
}

ViewportSwizzleNV::struct {
	x:  ViewportCoordinateSwizzleNV,
	y:  ViewportCoordinateSwizzleNV,
	z:  ViewportCoordinateSwizzleNV,
	w:  ViewportCoordinateSwizzleNV
}

PhysicalDeviceFragmentShadingRatePropertiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	minFragmentShadingRateAttachmentTexelSize:  Extent2D,
	maxFragmentShadingRateAttachmentTexelSize:  Extent2D,
	maxFragmentShadingRateAttachmentTexelSizeAspectRatio:  u32,
	primitiveFragmentShadingRateWithMultipleViewports:  Bool32,
	layeredShadingRateAttachments:  Bool32,
	fragmentShadingRateNonTrivialCombinerOps:  Bool32,
	maxFragmentSize:  Extent2D,
	maxFragmentSizeAspectRatio:  u32,
	maxFragmentShadingRateCoverageSamples:  u32,
	maxFragmentShadingRateRasterizationSamples:  SampleCountFlags,
	fragmentShadingRateWithShaderDepthStencilWrites:  Bool32,
	fragmentShadingRateWithSampleMask:  Bool32,
	fragmentShadingRateWithShaderSampleMask:  Bool32,
	fragmentShadingRateWithConservativeRasterization:  Bool32,
	fragmentShadingRateWithFragmentShaderInterlock:  Bool32,
	fragmentShadingRateWithCustomSampleLocations:  Bool32,
	fragmentShadingRateStrictMultiplyCombiner:  Bool32
}

DedicatedAllocationMemoryAllocateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	image:  Image,
	buffer:  Buffer
}

DependencyInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	dependencyFlags:  DependencyFlags,
	memoryBarrierCount:  u32,
	pMemoryBarriers: ^MemoryBarrier2KHR,
	bufferMemoryBarrierCount:  u32,
	pBufferMemoryBarriers: ^BufferMemoryBarrier2KHR,
	imageMemoryBarrierCount:  u32,
	pImageMemoryBarriers: ^ImageMemoryBarrier2KHR
}

PhysicalDeviceShadingRateImageFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	shadingRateImage:  Bool32,
	shadingRateCoarseSampleOrder:  Bool32
}

BufferOpaqueCaptureAddressCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	opaqueCaptureAddress:  u64
}

PipelineShaderStageCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineShaderStageCreateFlags,
	stage:  ShaderStageFlags,
	module:  ShaderModule,
	pName: cstring,
	pSpecializationInfo: ^SpecializationInfo
}

WaylandSurfaceCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  WaylandSurfaceCreateFlagsKHR,
	display: ^wl_display,
	surface: ^wl_surface
}

BindAccelerationStructureMemoryInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	accelerationStructure:  AccelerationStructureNV,
	memory:  DeviceMemory,
	memoryOffset:  DeviceSize,
	deviceIndexCount:  u32,
	pDeviceIndices: ^u32
}

PipelineViewportStateCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineViewportStateCreateFlags,
	viewportCount:  u32,
	pViewports: ^Viewport,
	scissorCount:  u32,
	pScissors: ^Rect2D
}

ImportSemaphoreFdInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	semaphore:  Semaphore,
	flags:  SemaphoreImportFlags,
	handleType:  ExternalSemaphoreHandleTypeFlags,
	fd:  i32
}

GeneratedCommandsInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	pipelineBindPoint:  PipelineBindPoint,
	pipeline:  Pipeline,
	indirectCommandsLayout:  IndirectCommandsLayoutNV,
	streamCount:  u32,
	pStreams: ^IndirectCommandsStreamNV,
	sequencesCount:  u32,
	preprocessBuffer:  Buffer,
	preprocessOffset:  DeviceSize,
	preprocessSize:  DeviceSize,
	sequencesCountBuffer:  Buffer,
	sequencesCountOffset:  DeviceSize,
	sequencesIndexBuffer:  Buffer,
	sequencesIndexOffset:  DeviceSize
}

QueryPoolPerformanceQueryCreateInfoINTEL::struct {
	sType:  StructureType,
	pNext: ^void,
	performanceCountersSampling:  QueryPoolSamplingModeINTEL
}

ImageViewUsageCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	usage:  ImageUsageFlags
}

DeviceMemoryOpaqueCaptureAddressInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	memory:  DeviceMemory
}

PhysicalDeviceVulkan12Features::struct {
	sType:  StructureType,
	pNext: ^void,
	samplerMirrorClampToEdge:  Bool32,
	drawIndirectCount:  Bool32,
	storageBuffer8BitAccess:  Bool32,
	uniformAndStorageBuffer8BitAccess:  Bool32,
	storagePushConstant8:  Bool32,
	shaderBufferInt64Atomics:  Bool32,
	shaderSharedInt64Atomics:  Bool32,
	shaderFloat16:  Bool32,
	shaderInt8:  Bool32,
	descriptorIndexing:  Bool32,
	shaderInputAttachmentArrayDynamicIndexing:  Bool32,
	shaderUniformTexelBufferArrayDynamicIndexing:  Bool32,
	shaderStorageTexelBufferArrayDynamicIndexing:  Bool32,
	shaderUniformBufferArrayNonUniformIndexing:  Bool32,
	shaderSampledImageArrayNonUniformIndexing:  Bool32,
	shaderStorageBufferArrayNonUniformIndexing:  Bool32,
	shaderStorageImageArrayNonUniformIndexing:  Bool32,
	shaderInputAttachmentArrayNonUniformIndexing:  Bool32,
	shaderUniformTexelBufferArrayNonUniformIndexing:  Bool32,
	shaderStorageTexelBufferArrayNonUniformIndexing:  Bool32,
	descriptorBindingUniformBufferUpdateAfterBind:  Bool32,
	descriptorBindingSampledImageUpdateAfterBind:  Bool32,
	descriptorBindingStorageImageUpdateAfterBind:  Bool32,
	descriptorBindingStorageBufferUpdateAfterBind:  Bool32,
	descriptorBindingUniformTexelBufferUpdateAfterBind:  Bool32,
	descriptorBindingStorageTexelBufferUpdateAfterBind:  Bool32,
	descriptorBindingUpdateUnusedWhilePending:  Bool32,
	descriptorBindingPartiallyBound:  Bool32,
	descriptorBindingVariableDescriptorCount:  Bool32,
	runtimeDescriptorArray:  Bool32,
	samplerFilterMinmax:  Bool32,
	scalarBlockLayout:  Bool32,
	imagelessFramebuffer:  Bool32,
	uniformBufferStandardLayout:  Bool32,
	shaderSubgroupExtendedTypes:  Bool32,
	separateDepthStencilLayouts:  Bool32,
	hostQueryReset:  Bool32,
	timelineSemaphore:  Bool32,
	bufferDeviceAddress:  Bool32,
	bufferDeviceAddressCaptureReplay:  Bool32,
	bufferDeviceAddressMultiDevice:  Bool32,
	vulkanMemoryModel:  Bool32,
	vulkanMemoryModelDeviceScope:  Bool32,
	vulkanMemoryModelAvailabilityVisibilityChains:  Bool32,
	shaderOutputViewportIndex:  Bool32,
	shaderOutputLayer:  Bool32,
	subgroupBroadcastDynamicId:  Bool32
}

PipelineLayoutCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineLayoutCreateFlags,
	setLayoutCount:  u32,
	pSetLayouts: ^DescriptorSetLayout,
	pushConstantRangeCount:  u32,
	pPushConstantRanges: ^PushConstantRange
}

MetalSurfaceCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  MetalSurfaceCreateFlagsEXT,
	pLayer: ^CAMetalLayer
}

BindBufferMemoryInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	buffer:  Buffer,
	memory:  DeviceMemory,
	memoryOffset:  DeviceSize
}

PerformanceMarkerInfoINTEL::struct {
	sType:  StructureType,
	pNext: ^void,
	marker:  u64
}

ImageResolve2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcSubresource:  ImageSubresourceLayers,
	srcOffset:  Offset3D,
	dstSubresource:  ImageSubresourceLayers,
	dstOffset:  Offset3D,
	extent:  Extent3D
}

DrmFormatModifierPropertiesEXT::struct {
	drmFormatModifier:  u64,
	drmFormatModifierPlaneCount:  u32,
	drmFormatModifierTilingFeatures:  FormatFeatureFlags
}

IndirectCommandsStreamNV::struct {
	buffer:  Buffer,
	offset:  DeviceSize
}

PipelineExecutablePropertiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	stages:  ShaderStageFlags,
	name:  [MAX_DESCRIPTION_SIZE]u8,
	description:  [MAX_DESCRIPTION_SIZE]u8,
	subgroupSize:  u32
}

PhysicalDevicePrivateDataFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	privateData:  Bool32
}

ExportMemoryWin32HandleInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	pAttributes: ^SECURITY_ATTRIBUTES,
	dwAccess:  DWORD,
	name:  LPCWSTR
}

PhysicalDeviceAccelerationStructureFeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	accelerationStructure:  Bool32,
	accelerationStructureCaptureReplay:  Bool32,
	accelerationStructureIndirectBuild:  Bool32,
	accelerationStructureHostCommands:  Bool32,
	descriptorBindingAccelerationStructureUpdateAfterBind:  Bool32
}

ImportSemaphoreWin32HandleInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	semaphore:  Semaphore,
	flags:  SemaphoreImportFlags,
	handleType:  ExternalSemaphoreHandleTypeFlags,
	handle:  HANDLE,
	name:  LPCWSTR
}

RayTracingShaderGroupCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	type:  RayTracingShaderGroupTypeKHR,
	generalShader:  u32,
	closestHitShader:  u32,
	anyHitShader:  u32,
	intersectionShader:  u32,
	pShaderGroupCaptureReplayHandle: ^void
}

BindImageMemoryDeviceGroupInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceIndexCount:  u32,
	pDeviceIndices: ^u32,
	splitInstanceBindRegionCount:  u32,
	pSplitInstanceBindRegions: ^Rect2D
}

DebugUtilsObjectTagInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	objectType:  ObjectType,
	objectHandle:  u64,
	tagName:  u64,
	tagSize:  uint,
	pTag: ^void
}

ImageDrmFormatModifierListCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	drmFormatModifierCount:  u32,
	pDrmFormatModifiers: ^u64
}

ValidationFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	enabledValidationFeatureCount:  u32,
	pEnabledValidationFeatures: ^ValidationFeatureEnableEXT,
	disabledValidationFeatureCount:  u32,
	pDisabledValidationFeatures: ^ValidationFeatureDisableEXT
}

PhysicalDevicePushDescriptorPropertiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	maxPushDescriptors:  u32
}

DeviceMemoryOverallocationCreateInfoAMD::struct {
	sType:  StructureType,
	pNext: ^void,
	overallocationBehavior:  MemoryOverallocationBehaviorAMD
}

PhysicalDeviceExternalSemaphoreInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	handleType:  ExternalSemaphoreHandleTypeFlags
}

MemoryRequirements::struct {
	size:  DeviceSize,
	alignment:  DeviceSize,
	memoryTypeBits:  u32
}

MemoryGetWin32HandleInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	memory:  DeviceMemory,
	handleType:  ExternalMemoryHandleTypeFlags
}

BindBufferMemoryDeviceGroupInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceIndexCount:  u32,
	pDeviceIndices: ^u32
}

MemoryHostPointerPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	memoryTypeBits:  u32
}

PipelineExecutableStatisticKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	name:  [MAX_DESCRIPTION_SIZE]u8,
	description:  [MAX_DESCRIPTION_SIZE]u8,
	format:  PipelineExecutableStatisticFormatKHR,
	value:  PipelineExecutableStatisticValueKHR
}

MemoryRequirements2::struct {
	sType:  StructureType,
	pNext: ^void,
	memoryRequirements:  MemoryRequirements
}

PhysicalDeviceFragmentDensityMap2FeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	fragmentDensityMapDeferred:  Bool32
}

PhysicalDeviceDescriptorIndexingFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderInputAttachmentArrayDynamicIndexing:  Bool32,
	shaderUniformTexelBufferArrayDynamicIndexing:  Bool32,
	shaderStorageTexelBufferArrayDynamicIndexing:  Bool32,
	shaderUniformBufferArrayNonUniformIndexing:  Bool32,
	shaderSampledImageArrayNonUniformIndexing:  Bool32,
	shaderStorageBufferArrayNonUniformIndexing:  Bool32,
	shaderStorageImageArrayNonUniformIndexing:  Bool32,
	shaderInputAttachmentArrayNonUniformIndexing:  Bool32,
	shaderUniformTexelBufferArrayNonUniformIndexing:  Bool32,
	shaderStorageTexelBufferArrayNonUniformIndexing:  Bool32,
	descriptorBindingUniformBufferUpdateAfterBind:  Bool32,
	descriptorBindingSampledImageUpdateAfterBind:  Bool32,
	descriptorBindingStorageImageUpdateAfterBind:  Bool32,
	descriptorBindingStorageBufferUpdateAfterBind:  Bool32,
	descriptorBindingUniformTexelBufferUpdateAfterBind:  Bool32,
	descriptorBindingStorageTexelBufferUpdateAfterBind:  Bool32,
	descriptorBindingUpdateUnusedWhilePending:  Bool32,
	descriptorBindingPartiallyBound:  Bool32,
	descriptorBindingVariableDescriptorCount:  Bool32,
	runtimeDescriptorArray:  Bool32
}

PipelineVertexInputDivisorStateCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	vertexBindingDivisorCount:  u32,
	pVertexBindingDivisors: ^VertexInputBindingDivisorDescriptionEXT
}

ImageSparseMemoryRequirementsInfo2::struct {
	sType:  StructureType,
	pNext: ^void,
	image:  Image
}

ViSurfaceCreateInfoNN::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  ViSurfaceCreateFlagsNN,
	window: ^void
}

DisplayPlaneProperties2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	displayPlaneProperties:  DisplayPlanePropertiesKHR
}

CalibratedTimestampInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	timeDomain:  TimeDomainEXT
}

CommandBufferBeginInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  CommandBufferUsageFlags,
	pInheritanceInfo: ^CommandBufferInheritanceInfo
}

PhysicalDeviceShaderClockFeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderSubgroupClock:  Bool32,
	shaderDeviceClock:  Bool32
}

PhysicalDeviceRepresentativeFragmentTestFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	representativeFragmentTest:  Bool32
}

PhysicalDeviceRobustness2PropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	robustStorageBufferAccessSizeAlignment:  DeviceSize,
	robustUniformBufferAccessSizeAlignment:  DeviceSize
}

PhysicalDeviceDeviceGeneratedCommandsFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceGeneratedCommands:  Bool32
}

MemoryOpaqueCaptureAddressAllocateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	opaqueCaptureAddress:  u64
}

ComputePipelineCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineCreateFlags,
	stage:  PipelineShaderStageCreateInfo,
	layout:  PipelineLayout,
	basePipelineHandle:  Pipeline,
	basePipelineIndex:  i32
}

PhysicalDeviceCoverageReductionModeFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	coverageReductionMode:  Bool32
}

CopyCommandTransformInfoQCOM::struct {
	sType:  StructureType,
	pNext: ^void,
	transform:  SurfaceTransformFlagsKHR
}

AccelerationStructureGeometryTrianglesDataKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	vertexFormat:  Format,
	vertexData:  DeviceOrHostAddressConstKHR,
	vertexStride:  DeviceSize,
	maxVertex:  u32,
	indexType:  IndexType,
	indexData:  DeviceOrHostAddressConstKHR,
	transformData:  DeviceOrHostAddressConstKHR
}

DeviceDiagnosticsConfigCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DeviceDiagnosticsConfigFlagsNV
}

PhysicalDeviceMultiviewFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	multiview:  Bool32,
	multiviewGeometryShader:  Bool32,
	multiviewTessellationShader:  Bool32
}

AccelerationStructureGeometryAabbsDataKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	data:  DeviceOrHostAddressConstKHR,
	stride:  DeviceSize
}

ShaderModuleCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  ShaderModuleCreateFlags,
	codeSize:  uint,
	pCode: ^u32
}

PhysicalDeviceTimelineSemaphoreFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	timelineSemaphore:  Bool32
}

PhysicalDeviceRayTracingPipelineFeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	rayTracingPipeline:  Bool32,
	rayTracingPipelineShaderGroupHandleCaptureReplay:  Bool32,
	rayTracingPipelineShaderGroupHandleCaptureReplayMixed:  Bool32,
	rayTracingPipelineTraceRaysIndirect:  Bool32,
	rayTraversalPrimitiveCulling:  Bool32
}

PhysicalDeviceVulkanMemoryModelFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	vulkanMemoryModel:  Bool32,
	vulkanMemoryModelDeviceScope:  Bool32,
	vulkanMemoryModelAvailabilityVisibilityChains:  Bool32
}

GeometryTrianglesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	vertexData:  Buffer,
	vertexOffset:  DeviceSize,
	vertexCount:  u32,
	vertexStride:  DeviceSize,
	vertexFormat:  Format,
	indexData:  Buffer,
	indexOffset:  DeviceSize,
	indexCount:  u32,
	indexType:  IndexType,
	transformData:  Buffer,
	transformOffset:  DeviceSize
}

ClearValue::struct #raw_union {
	color:  ClearColorValue,
	depthStencil:  ClearDepthStencilValue
}

PipelineCreationFeedbackCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	pPipelineCreationFeedback: ^PipelineCreationFeedbackEXT,
	pipelineStageCreationFeedbackCount:  u32,
	pPipelineStageCreationFeedbacks: ^PipelineCreationFeedbackEXT
}

PhysicalDeviceMemoryProperties::struct {
	memoryTypeCount:  u32,
	memoryTypes:  [MAX_MEMORY_TYPES]MemoryType,
	memoryHeapCount:  u32,
	memoryHeaps:  [MAX_MEMORY_HEAPS]MemoryHeap
}

PhysicalDeviceTexelBufferAlignmentPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	storageTexelBufferOffsetAlignmentBytes:  DeviceSize,
	storageTexelBufferOffsetSingleTexelAlignment:  Bool32,
	uniformTexelBufferOffsetAlignmentBytes:  DeviceSize,
	uniformTexelBufferOffsetSingleTexelAlignment:  Bool32
}

RayTracingPipelineInterfaceCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	maxPipelineRayPayloadSize:  u32,
	maxPipelineRayHitAttributeSize:  u32
}

PhysicalDeviceRayTracingPropertiesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderGroupHandleSize:  u32,
	maxRecursionDepth:  u32,
	maxShaderGroupStride:  u32,
	shaderGroupBaseAlignment:  u32,
	maxGeometryCount:  u64,
	maxInstanceCount:  u64,
	maxTriangleCount:  u64,
	maxDescriptorSetAccelerationStructures:  u32
}

IOSSurfaceCreateInfoMVK::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  IOSSurfaceCreateFlagsMVK,
	pView: ^void
}

PhysicalDevicePortabilitySubsetPropertiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	minVertexInputBindingStrideAlignment:  u32
}

CommandBufferSubmitInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	commandBuffer:  CommandBuffer,
	deviceMask:  u32
}

DebugUtilsObjectNameInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	objectType:  ObjectType,
	objectHandle:  u64,
	pObjectName: cstring
}

PushConstantRange::struct {
	stageFlags:  ShaderStageFlags,
	offset:  u32,
	size:  u32
}

DeviceGroupSwapchainCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	modes:  DeviceGroupPresentModeFlagsKHR
}

DeviceOrHostAddressKHR::struct #raw_union {
	deviceAddress:  DeviceAddress,
	hostAddress: ^void
}

QueryPoolCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  QueryPoolCreateFlags,
	queryType:  QueryType,
	queryCount:  u32,
	pipelineStatistics:  QueryPipelineStatisticFlags
}

PhysicalDeviceRayQueryFeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	rayQuery:  Bool32
}

PerformanceValueINTEL::struct {
	type:  PerformanceValueTypeINTEL,
	data:  PerformanceValueDataINTEL
}

DrawMeshTasksIndirectCommandNV::struct {
	taskCount:  u32,
	firstTask:  u32
}

DebugReportCallbackCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DebugReportFlagsEXT,
	pfnCallback:  PFN_vkDebugReportCallbackEXT,
	pUserData: ^void
}

PipelineRepresentativeFragmentTestStateCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	representativeFragmentTestEnable:  Bool32
}

RefreshCycleDurationGOOGLE::struct {
	refreshDuration:  u64
}

BaseInStructure::struct {
	sType:  StructureType,
	pNext: ^BaseInStructure
}

GraphicsPipelineShaderGroupsCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	groupCount:  u32,
	pGroups: ^GraphicsShaderGroupCreateInfoNV,
	pipelineCount:  u32,
	pPipelines: ^Pipeline
}

MemoryType::struct {
	propertyFlags:  MemoryPropertyFlags,
	heapIndex:  u32
}

PipelineCoverageModulationStateCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineCoverageModulationStateCreateFlagsNV,
	coverageModulationMode:  CoverageModulationModeNV,
	coverageModulationTableEnable:  Bool32,
	coverageModulationTableCount:  u32,
	pCoverageModulationTable: ^f32
}

BufferCopy::struct {
	srcOffset:  DeviceSize,
	dstOffset:  DeviceSize,
	size:  DeviceSize
}

PipelineTessellationStateCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineTessellationStateCreateFlags,
	patchControlPoints:  u32
}

PhysicalDeviceProperties::struct {
	apiVersion:  u32,
	driverVersion:  u32,
	vendorID:  u32,
	deviceID:  u32,
	deviceType:  PhysicalDeviceType,
	deviceName:  [MAX_PHYSICAL_DEVICE_NAME_SIZE]u8,
	pipelineCacheUUID:  [UUID_SIZE]u8,
	limits:  PhysicalDeviceLimits,
	sparseProperties:  PhysicalDeviceSparseProperties
}

PhysicalDeviceProperties2::struct {
	sType:  StructureType,
	pNext: ^void,
	properties:  PhysicalDeviceProperties
}

PhysicalDeviceTransformFeedbackPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	maxTransformFeedbackStreams:  u32,
	maxTransformFeedbackBuffers:  u32,
	maxTransformFeedbackBufferSize:  DeviceSize,
	maxTransformFeedbackStreamDataSize:  u32,
	maxTransformFeedbackBufferDataSize:  u32,
	maxTransformFeedbackBufferDataStride:  u32,
	transformFeedbackQueries:  Bool32,
	transformFeedbackStreamsLinesTriangles:  Bool32,
	transformFeedbackRasterizationStreamSelect:  Bool32,
	transformFeedbackDraw:  Bool32
}

PhysicalDeviceImageDrmFormatModifierInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	drmFormatModifier:  u64,
	sharingMode:  SharingMode,
	queueFamilyIndexCount:  u32,
	pQueueFamilyIndices: ^u32
}

SubpassDescription::struct {
	flags:  SubpassDescriptionFlags,
	pipelineBindPoint:  PipelineBindPoint,
	inputAttachmentCount:  u32,
	pInputAttachments: ^AttachmentReference,
	colorAttachmentCount:  u32,
	pColorAttachments: ^AttachmentReference,
	pResolveAttachments: ^AttachmentReference,
	pDepthStencilAttachment: ^AttachmentReference,
	preserveAttachmentCount:  u32,
	pPreserveAttachments: ^u32
}

AttachmentDescription2::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  AttachmentDescriptionFlags,
	format:  Format,
	samples:  SampleCountFlags,
	loadOp:  AttachmentLoadOp,
	storeOp:  AttachmentStoreOp,
	stencilLoadOp:  AttachmentLoadOp,
	stencilStoreOp:  AttachmentStoreOp,
	initialLayout:  ImageLayout,
	finalLayout:  ImageLayout
}

ImageResolve::struct {
	srcSubresource:  ImageSubresourceLayers,
	srcOffset:  Offset3D,
	dstSubresource:  ImageSubresourceLayers,
	dstOffset:  Offset3D,
	extent:  Extent3D
}

DedicatedAllocationImageCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	dedicatedAllocation:  Bool32
}

PhysicalDeviceDiagnosticsConfigFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	diagnosticsConfig:  Bool32
}

PhysicalDeviceShaderTerminateInvocationFeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderTerminateInvocation:  Bool32
}

ImageSubresource::struct {
	aspectMask:  ImageAspectFlags,
	mipLevel:  u32,
	arrayLayer:  u32
}

DescriptorPoolCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DescriptorPoolCreateFlags,
	maxSets:  u32,
	poolSizeCount:  u32,
	pPoolSizes: ^DescriptorPoolSize
}

DeviceEventInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceEvent:  DeviceEventTypeEXT
}

MemoryDedicatedRequirements::struct {
	sType:  StructureType,
	pNext: ^void,
	prefersDedicatedAllocation:  Bool32,
	requiresDedicatedAllocation:  Bool32
}

PhysicalDeviceDescriptorIndexingProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	maxUpdateAfterBindDescriptorsInAllPools:  u32,
	shaderUniformBufferArrayNonUniformIndexingNative:  Bool32,
	shaderSampledImageArrayNonUniformIndexingNative:  Bool32,
	shaderStorageBufferArrayNonUniformIndexingNative:  Bool32,
	shaderStorageImageArrayNonUniformIndexingNative:  Bool32,
	shaderInputAttachmentArrayNonUniformIndexingNative:  Bool32,
	robustBufferAccessUpdateAfterBind:  Bool32,
	quadDivergentImplicitLod:  Bool32,
	maxPerStageDescriptorUpdateAfterBindSamplers:  u32,
	maxPerStageDescriptorUpdateAfterBindUniformBuffers:  u32,
	maxPerStageDescriptorUpdateAfterBindStorageBuffers:  u32,
	maxPerStageDescriptorUpdateAfterBindSampledImages:  u32,
	maxPerStageDescriptorUpdateAfterBindStorageImages:  u32,
	maxPerStageDescriptorUpdateAfterBindInputAttachments:  u32,
	maxPerStageUpdateAfterBindResources:  u32,
	maxDescriptorSetUpdateAfterBindSamplers:  u32,
	maxDescriptorSetUpdateAfterBindUniformBuffers:  u32,
	maxDescriptorSetUpdateAfterBindUniformBuffersDynamic:  u32,
	maxDescriptorSetUpdateAfterBindStorageBuffers:  u32,
	maxDescriptorSetUpdateAfterBindStorageBuffersDynamic:  u32,
	maxDescriptorSetUpdateAfterBindSampledImages:  u32,
	maxDescriptorSetUpdateAfterBindStorageImages:  u32,
	maxDescriptorSetUpdateAfterBindInputAttachments:  u32
}

TraceRaysIndirectCommandKHR::struct {
	width:  u32,
	height:  u32,
	depth:  u32
}

PerformanceOverrideInfoINTEL::struct {
	sType:  StructureType,
	pNext: ^void,
	type:  PerformanceOverrideTypeINTEL,
	enable:  Bool32,
	parameter:  u64
}

AabbPositionsKHR::struct {
	minX:  f32,
	minY:  f32,
	minZ:  f32,
	maxX:  f32,
	maxY:  f32,
	maxZ:  f32
}

SemaphoreCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  SemaphoreCreateFlags
}

ShaderStatisticsInfoAMD::struct {
	shaderStageMask:  ShaderStageFlags,
	resourceUsage:  ShaderResourceUsageAMD,
	numPhysicalVgprs:  u32,
	numPhysicalSgprs:  u32,
	numAvailableVgprs:  u32,
	numAvailableSgprs:  u32,
	computeWorkGroupSize:  [3]u32
}

MemoryBarrier2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcStageMask:  PipelineStageFlags2KHR,
	srcAccessMask:  AccessFlags2KHR,
	dstStageMask:  PipelineStageFlags2KHR,
	dstAccessMask:  AccessFlags2KHR
}

TimelineSemaphoreSubmitInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	waitSemaphoreValueCount:  u32,
	pWaitSemaphoreValues: ^u64,
	signalSemaphoreValueCount:  u32,
	pSignalSemaphoreValues: ^u64
}

DisplayModePropertiesKHR::struct {
	displayMode:  DisplayModeKHR,
	parameters:  DisplayModeParametersKHR
}

SemaphoreGetFdInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	semaphore:  Semaphore,
	handleType:  ExternalSemaphoreHandleTypeFlags
}

PresentTimesInfoGOOGLE::struct {
	sType:  StructureType,
	pNext: ^void,
	swapchainCount:  u32,
	pTimes: ^PresentTimeGOOGLE
}

PhysicalDeviceShaderCorePropertiesAMD::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderEngineCount:  u32,
	shaderArraysPerEngineCount:  u32,
	computeUnitsPerShaderArray:  u32,
	simdPerComputeUnit:  u32,
	wavefrontsPerSimd:  u32,
	wavefrontSize:  u32,
	sgprsPerSimd:  u32,
	minSgprAllocation:  u32,
	maxSgprAllocation:  u32,
	sgprAllocationGranularity:  u32,
	vgprsPerSimd:  u32,
	minVgprAllocation:  u32,
	maxVgprAllocation:  u32,
	vgprAllocationGranularity:  u32
}

IndirectCommandsLayoutTokenNV::struct {
	sType:  StructureType,
	pNext: ^void,
	tokenType:  IndirectCommandsTokenTypeNV,
	stream:  u32,
	offset:  u32,
	vertexBindingUnit:  u32,
	vertexDynamicStride:  Bool32,
	pushconstantPipelineLayout:  PipelineLayout,
	pushconstantShaderStageFlags:  ShaderStageFlags,
	pushconstantOffset:  u32,
	pushconstantSize:  u32,
	indirectStateFlags:  IndirectStateFlagsNV,
	indexTypeCount:  u32,
	pIndexTypes: ^IndexType,
	pIndexTypeValues: ^u32
}

PhysicalDeviceASTCDecodeFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	decodeModeSharedExponent:  Bool32
}

PhysicalDeviceCooperativeMatrixFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	cooperativeMatrix:  Bool32,
	cooperativeMatrixRobustBufferAccess:  Bool32
}

PhysicalDeviceTimelineSemaphoreProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	maxTimelineSemaphoreValueDifference:  u64
}

ImageBlit2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcSubresource:  ImageSubresourceLayers,
	srcOffsets:  [2]Offset3D,
	dstSubresource:  ImageSubresourceLayers,
	dstOffsets:  [2]Offset3D
}

CopyBufferInfo2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcBuffer:  Buffer,
	dstBuffer:  Buffer,
	regionCount:  u32,
	pRegions: ^BufferCopy2KHR
}

ClearAttachment::struct {
	aspectMask:  ImageAspectFlags,
	colorAttachment:  u32,
	clearValue:  ClearValue
}

ValidationFlagsEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	disabledValidationCheckCount:  u32,
	pDisabledValidationChecks: ^ValidationCheckEXT
}

SamplerCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  SamplerCreateFlags,
	magFilter:  Filter,
	minFilter:  Filter,
	mipmapMode:  SamplerMipmapMode,
	addressModeU:  SamplerAddressMode,
	addressModeV:  SamplerAddressMode,
	addressModeW:  SamplerAddressMode,
	mipLodBias:  f32,
	anisotropyEnable:  Bool32,
	maxAnisotropy:  f32,
	compareEnable:  Bool32,
	compareOp:  CompareOp,
	minLod:  f32,
	maxLod:  f32,
	borderColor:  BorderColor,
	unnormalizedCoordinates:  Bool32
}

SamplerReductionModeCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	reductionMode:  SamplerReductionMode
}

BufferImageCopy::struct {
	bufferOffset:  DeviceSize,
	bufferRowLength:  u32,
	bufferImageHeight:  u32,
	imageSubresource:  ImageSubresourceLayers,
	imageOffset:  Offset3D,
	imageExtent:  Extent3D
}

PhysicalDeviceAccelerationStructurePropertiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	maxGeometryCount:  u64,
	maxInstanceCount:  u64,
	maxPrimitiveCount:  u64,
	maxPerStageDescriptorAccelerationStructures:  u32,
	maxPerStageDescriptorUpdateAfterBindAccelerationStructures:  u32,
	maxDescriptorSetAccelerationStructures:  u32,
	maxDescriptorSetUpdateAfterBindAccelerationStructures:  u32,
	minAccelerationStructureScratchOffsetAlignment:  u32
}

AccelerationStructureBuildGeometryInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	type:  AccelerationStructureTypeKHR,
	flags:  BuildAccelerationStructureFlagsKHR,
	mode:  BuildAccelerationStructureModeKHR,
	srcAccelerationStructure:  AccelerationStructureKHR,
	dstAccelerationStructure:  AccelerationStructureKHR,
	geometryCount:  u32,
	pGeometries: ^AccelerationStructureGeometryKHR,
	ppGeometries: ^^AccelerationStructureGeometryKHR,
	scratchData:  DeviceOrHostAddressKHR
}

SemaphoreSignalInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	semaphore:  Semaphore,
	value:  u64
}

SamplerYcbcrConversionCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	format:  Format,
	ycbcrModel:  SamplerYcbcrModelConversion,
	ycbcrRange:  SamplerYcbcrRange,
	components:  ComponentMapping,
	xChromaOffset:  ChromaLocation,
	yChromaOffset:  ChromaLocation,
	chromaFilter:  Filter,
	forceExplicitReconstruction:  Bool32
}

PhysicalDeviceUniformBufferStandardLayoutFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	uniformBufferStandardLayout:  Bool32
}

DescriptorSetLayoutCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DescriptorSetLayoutCreateFlags,
	bindingCount:  u32,
	pBindings: ^DescriptorSetLayoutBinding
}

PhysicalDeviceProtectedMemoryProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	protectedNoFault:  Bool32
}

GeometryNV::struct {
	sType:  StructureType,
	pNext: ^void,
	geometryType:  GeometryTypeKHR,
	geometry:  GeometryDataNV,
	flags:  GeometryFlagsKHR
}

SubpassDescriptionDepthStencilResolve::struct {
	sType:  StructureType,
	pNext: ^void,
	depthResolveMode:  ResolveModeFlags,
	stencilResolveMode:  ResolveModeFlags,
	pDepthStencilResolveAttachment: ^AttachmentReference2
}

AndroidSurfaceCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  AndroidSurfaceCreateFlagsKHR,
	window: ^ANativeWindow
}

ValidationCacheCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  ValidationCacheCreateFlagsEXT,
	initialDataSize:  uint,
	pInitialData: ^void
}

PhysicalDeviceMaintenance3Properties::struct {
	sType:  StructureType,
	pNext: ^void,
	maxPerSetDescriptors:  u32,
	maxMemoryAllocationSize:  DeviceSize
}

PhysicalDeviceImageFormatInfo2::struct {
	sType:  StructureType,
	pNext: ^void,
	format:  Format,
	type:  ImageType,
	tiling:  ImageTiling,
	usage:  ImageUsageFlags,
	flags:  ImageCreateFlags
}

SurfaceProtectedCapabilitiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	supportsProtected:  Bool32
}

SparseImageFormatProperties::struct {
	aspectMask:  ImageAspectFlags,
	imageGranularity:  Extent3D,
	flags:  SparseImageFormatFlags
}

PrivateDataSlotCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PrivateDataSlotCreateFlagsEXT
}

SampleLocationsInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	sampleLocationsPerPixel:  SampleCountFlags,
	sampleLocationGridSize:  Extent2D,
	sampleLocationsCount:  u32,
	pSampleLocations: ^SampleLocationEXT
}

MemoryGetAndroidHardwareBufferInfoANDROID::struct {
	sType:  StructureType,
	pNext: ^void,
	memory:  DeviceMemory
}

CopyAccelerationStructureToMemoryInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	src:  AccelerationStructureKHR,
	dst:  DeviceOrHostAddressKHR,
	mode:  CopyAccelerationStructureModeKHR
}

BindShaderGroupIndirectCommandNV::struct {
	groupIndex:  u32
}

DescriptorImageInfo::struct {
	sampler:  Sampler,
	imageView:  ImageView,
	imageLayout:  ImageLayout
}

BufferCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  BufferCreateFlags,
	size:  DeviceSize,
	usage:  BufferUsageFlags,
	sharingMode:  SharingMode,
	queueFamilyIndexCount:  u32,
	pQueueFamilyIndices: ^u32
}

ImageFormatProperties2::struct {
	sType:  StructureType,
	pNext: ^void,
	imageFormatProperties:  ImageFormatProperties
}

ExportSemaphoreCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	handleTypes:  ExternalSemaphoreHandleTypeFlags
}

PhysicalDeviceSubgroupProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	subgroupSize:  u32,
	supportedStages:  ShaderStageFlags,
	supportedOperations:  SubgroupFeatureFlags,
	quadOperationsInAllStages:  Bool32
}

PipelineColorBlendAttachmentState::struct {
	blendEnable:  Bool32,
	srcColorBlendFactor:  BlendFactor,
	dstColorBlendFactor:  BlendFactor,
	colorBlendOp:  BlendOp,
	srcAlphaBlendFactor:  BlendFactor,
	dstAlphaBlendFactor:  BlendFactor,
	alphaBlendOp:  BlendOp,
	colorWriteMask:  ColorComponentFlags
}

DescriptorSetLayoutSupport::struct {
	sType:  StructureType,
	pNext: ^void,
	supported:  Bool32
}

ExternalSemaphoreProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	exportFromImportedHandleTypes:  ExternalSemaphoreHandleTypeFlags,
	compatibleHandleTypes:  ExternalSemaphoreHandleTypeFlags,
	externalSemaphoreFeatures:  ExternalSemaphoreFeatureFlags
}

RayTracingPipelineCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineCreateFlags,
	stageCount:  u32,
	pStages: ^PipelineShaderStageCreateInfo,
	groupCount:  u32,
	pGroups: ^RayTracingShaderGroupCreateInfoKHR,
	maxPipelineRayRecursionDepth:  u32,
	pLibraryInfo: ^PipelineLibraryCreateInfoKHR,
	pLibraryInterface: ^RayTracingPipelineInterfaceCreateInfoKHR,
	pDynamicState: ^PipelineDynamicStateCreateInfo,
	layout:  PipelineLayout,
	basePipelineHandle:  Pipeline,
	basePipelineIndex:  i32
}

DebugMarkerMarkerInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	pMarkerName: cstring,
	color:  [4]f32
}

DeviceGroupPresentInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	swapchainCount:  u32,
	pDeviceMasks: ^u32,
	mode:  DeviceGroupPresentModeFlagsKHR
}

AccelerationStructureBuildRangeInfoKHR::struct {
	primitiveCount:  u32,
	primitiveOffset:  u32,
	firstVertex:  u32,
	transformOffset:  u32
}

MemoryPriorityAllocateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	priority:  f32
}

ImportMemoryFdInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	handleType:  ExternalMemoryHandleTypeFlags,
	fd:  i32
}

SpecializationInfo::struct {
	mapEntryCount:  u32,
	pMapEntries: ^SpecializationMapEntry,
	dataSize:  uint,
	pData: ^void
}

DeviceOrHostAddressConstKHR::struct #raw_union {
	deviceAddress:  DeviceAddress,
	hostAddress: ^void
}

PhysicalDeviceFeatures2::struct {
	sType:  StructureType,
	pNext: ^void,
	features:  PhysicalDeviceFeatures
}

ImportMemoryHostPointerInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	handleType:  ExternalMemoryHandleTypeFlags,
	pHostPointer: ^void
}

PipelineFragmentShadingRateEnumStateCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	shadingRateType:  FragmentShadingRateTypeNV,
	shadingRate:  FragmentShadingRateNV,
	combinerOps:  [2]FragmentShadingRateCombinerOpKHR
}

SparseImageMemoryRequirements::struct {
	formatProperties:  SparseImageFormatProperties,
	imageMipTailFirstLod:  u32,
	imageMipTailSize:  DeviceSize,
	imageMipTailOffset:  DeviceSize,
	imageMipTailStride:  DeviceSize
}

MemoryHeap::struct {
	size:  DeviceSize,
	flags:  MemoryHeapFlags
}

ConditionalRenderingBeginInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	buffer:  Buffer,
	offset:  DeviceSize,
	flags:  ConditionalRenderingFlagsEXT
}

CommandBufferInheritanceInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	renderPass:  RenderPass,
	subpass:  u32,
	framebuffer:  Framebuffer,
	occlusionQueryEnable:  Bool32,
	queryFlags:  QueryControlFlags,
	pipelineStatistics:  QueryPipelineStatisticFlags
}

QueryPoolPerformanceCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	queueFamilyIndex:  u32,
	counterIndexCount:  u32,
	pCounterIndices: ^u32
}

DescriptorBufferInfo::struct {
	buffer:  Buffer,
	offset:  DeviceSize,
	range:  DeviceSize
}

ImageCopy::struct {
	srcSubresource:  ImageSubresourceLayers,
	srcOffset:  Offset3D,
	dstSubresource:  ImageSubresourceLayers,
	dstOffset:  Offset3D,
	extent:  Extent3D
}

GraphicsPipelineCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineCreateFlags,
	stageCount:  u32,
	pStages: ^PipelineShaderStageCreateInfo,
	pVertexInputState: ^PipelineVertexInputStateCreateInfo,
	pInputAssemblyState: ^PipelineInputAssemblyStateCreateInfo,
	pTessellationState: ^PipelineTessellationStateCreateInfo,
	pViewportState: ^PipelineViewportStateCreateInfo,
	pRasterizationState: ^PipelineRasterizationStateCreateInfo,
	pMultisampleState: ^PipelineMultisampleStateCreateInfo,
	pDepthStencilState: ^PipelineDepthStencilStateCreateInfo,
	pColorBlendState: ^PipelineColorBlendStateCreateInfo,
	pDynamicState: ^PipelineDynamicStateCreateInfo,
	layout:  PipelineLayout,
	renderPass:  RenderPass,
	subpass:  u32,
	basePipelineHandle:  Pipeline,
	basePipelineIndex:  i32
}

AccelerationStructureMemoryRequirementsInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	type:  AccelerationStructureMemoryRequirementsTypeNV,
	accelerationStructure:  AccelerationStructureNV
}

PhysicalDevicePerformanceQueryFeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	performanceCounterQueryPools:  Bool32,
	performanceCounterMultipleQueryPools:  Bool32
}

AttachmentDescriptionStencilLayout::struct {
	sType:  StructureType,
	pNext: ^void,
	stencilInitialLayout:  ImageLayout,
	stencilFinalLayout:  ImageLayout
}

MutableDescriptorTypeCreateInfoVALVE::struct {
	sType:  StructureType,
	pNext: ^void,
	mutableDescriptorTypeListCount:  u32,
	pMutableDescriptorTypeLists: ^MutableDescriptorTypeListVALVE
}

PipelineRasterizationStateCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineRasterizationStateCreateFlags,
	depthClampEnable:  Bool32,
	rasterizerDiscardEnable:  Bool32,
	polygonMode:  PolygonMode,
	cullMode:  CullModeFlags,
	frontFace:  FrontFace,
	depthBiasEnable:  Bool32,
	depthBiasConstantFactor:  f32,
	depthBiasClamp:  f32,
	depthBiasSlopeFactor:  f32,
	lineWidth:  f32
}

SparseImageMemoryBind::struct {
	subresource:  ImageSubresource,
	offset:  Offset3D,
	extent:  Extent3D,
	memory:  DeviceMemory,
	memoryOffset:  DeviceSize,
	flags:  SparseMemoryBindFlags
}

InitializePerformanceApiInfoINTEL::struct {
	sType:  StructureType,
	pNext: ^void,
	pUserData: ^void
}

PhysicalDeviceIndexTypeUint8FeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	indexTypeUint8:  Bool32
}

ImageMemoryRequirementsInfo2::struct {
	sType:  StructureType,
	pNext: ^void,
	image:  Image
}

D3D12FenceSubmitInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	waitSemaphoreValuesCount:  u32,
	pWaitSemaphoreValues: ^u64,
	signalSemaphoreValuesCount:  u32,
	pSignalSemaphoreValues: ^u64
}

DescriptorSetLayoutBindingFlagsCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	bindingCount:  u32,
	pBindingFlags: ^DescriptorBindingFlags
}

PhysicalDeviceLineRasterizationPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	lineSubPixelPrecisionBits:  u32
}

RenderPassTransformBeginInfoQCOM::struct {
	sType:  StructureType,
	pNext: ^void,
	transform:  SurfaceTransformFlagsKHR
}

FramebufferCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  FramebufferCreateFlags,
	renderPass:  RenderPass,
	attachmentCount:  u32,
	pAttachments: ^ImageView,
	width:  u32,
	height:  u32,
	layers:  u32
}

PipelineVertexInputStateCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineVertexInputStateCreateFlags,
	vertexBindingDescriptionCount:  u32,
	pVertexBindingDescriptions: ^VertexInputBindingDescription,
	vertexAttributeDescriptionCount:  u32,
	pVertexAttributeDescriptions: ^VertexInputAttributeDescription
}

PhysicalDeviceDeviceMemoryReportFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceMemoryReport:  Bool32
}

PhysicalDeviceDiscardRectanglePropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	maxDiscardRectangles:  u32
}

SamplerCustomBorderColorCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	customBorderColor:  ClearColorValue,
	format:  Format
}

ExportFenceCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	handleTypes:  ExternalFenceHandleTypeFlags
}

DevicePrivateDataCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	privateDataSlotRequestCount:  u32
}

SparseBufferMemoryBindInfo::struct {
	buffer:  Buffer,
	bindCount:  u32,
	pBinds: ^SparseMemoryBind
}

PerformanceQuerySubmitInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	counterPassIndex:  u32
}

DrmFormatModifierPropertiesListEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	drmFormatModifierCount:  u32,
	pDrmFormatModifierProperties: ^DrmFormatModifierPropertiesEXT
}

RectLayerKHR::struct {
	offset:  Offset2D,
	extent:  Extent2D,
	layer:  u32
}

ExportSemaphoreWin32HandleInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	pAttributes: ^SECURITY_ATTRIBUTES,
	dwAccess:  DWORD,
	name:  LPCWSTR
}

PhysicalDeviceConditionalRenderingFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	conditionalRendering:  Bool32,
	inheritedConditionalRendering:  Bool32
}

ScreenSurfaceCreateInfoQNX::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  ScreenSurfaceCreateFlagsQNX,
	ctx: ^_screen_context,
	window: ^_screen_window
}

MutableDescriptorTypeListVALVE::struct {
	descriptorTypeCount:  u32,
	pDescriptorTypes: ^DescriptorType
}

PhysicalDeviceMultiviewProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	maxMultiviewViewCount:  u32,
	maxMultiviewInstanceIndex:  u32
}

MemoryGetFdInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	memory:  DeviceMemory,
	handleType:  ExternalMemoryHandleTypeFlags
}

AccelerationStructureGeometryDataKHR::struct #raw_union {
	triangles:  AccelerationStructureGeometryTrianglesDataKHR,
	aabbs:  AccelerationStructureGeometryAabbsDataKHR,
	instances:  AccelerationStructureGeometryInstancesDataKHR
}

DirectFBSurfaceCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DirectFBSurfaceCreateFlagsEXT,
	dfb: ^IDirectFB,
	surface: ^IDirectFBSurface
}

ExternalMemoryProperties::struct {
	externalMemoryFeatures:  ExternalMemoryFeatureFlags,
	exportFromImportedHandleTypes:  ExternalMemoryHandleTypeFlags,
	compatibleHandleTypes:  ExternalMemoryHandleTypeFlags
}

ImageFormatProperties::struct {
	maxExtent:  Extent3D,
	maxMipLevels:  u32,
	maxArrayLayers:  u32,
	sampleCounts:  SampleCountFlags,
	maxResourceSize:  DeviceSize
}

PresentFrameTokenGGP::struct {
	sType:  StructureType,
	pNext: ^void,
	frameToken:  GgpFrameToken
}

PhysicalDeviceFragmentShaderBarycentricFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	fragmentShaderBarycentric:  Bool32
}

RenderPassFragmentDensityMapCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	fragmentDensityMapAttachment:  AttachmentReference
}

PhysicalDeviceShaderAtomicFloatFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderBufferFloat32Atomics:  Bool32,
	shaderBufferFloat32AtomicAdd:  Bool32,
	shaderBufferFloat64Atomics:  Bool32,
	shaderBufferFloat64AtomicAdd:  Bool32,
	shaderSharedFloat32Atomics:  Bool32,
	shaderSharedFloat32AtomicAdd:  Bool32,
	shaderSharedFloat64Atomics:  Bool32,
	shaderSharedFloat64AtomicAdd:  Bool32,
	shaderImageFloat32Atomics:  Bool32,
	shaderImageFloat32AtomicAdd:  Bool32,
	sparseImageFloat32Atomics:  Bool32,
	sparseImageFloat32AtomicAdd:  Bool32
}

CheckpointDataNV::struct {
	sType:  StructureType,
	pNext: ^void,
	stage:  PipelineStageFlags,
	pCheckpointMarker: ^void
}

DescriptorSetLayoutBinding::struct {
	binding:  u32,
	descriptorType:  DescriptorType,
	descriptorCount:  u32,
	stageFlags:  ShaderStageFlags,
	pImmutableSamplers: ^Sampler
}

BindImagePlaneMemoryInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	planeAspect:  ImageAspectFlags
}

SparseImageMemoryRequirements2::struct {
	sType:  StructureType,
	pNext: ^void,
	memoryRequirements:  SparseImageMemoryRequirements
}

PhysicalDeviceShaderAtomicInt64Features::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderBufferInt64Atomics:  Bool32,
	shaderSharedInt64Atomics:  Bool32
}

PhysicalDeviceMeshShaderFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	taskShader:  Bool32,
	meshShader:  Bool32
}

PhysicalDeviceFragmentShaderInterlockFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	fragmentShaderSampleInterlock:  Bool32,
	fragmentShaderPixelInterlock:  Bool32,
	fragmentShaderShadingRateInterlock:  Bool32
}

DeviceMemoryReportCallbackDataEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DeviceMemoryReportFlagsEXT,
	type:  DeviceMemoryReportEventTypeEXT,
	memoryObjectId:  u64,
	size:  DeviceSize,
	objectType:  ObjectType,
	objectHandle:  u64,
	heapIndex:  u32
}

Offset2D::struct {
	x:  i32,
	y:  i32
}

PhysicalDeviceConservativeRasterizationPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	primitiveOverestimationSize:  f32,
	maxExtraPrimitiveOverestimationSize:  f32,
	extraPrimitiveOverestimationSizeGranularity:  f32,
	primitiveUnderestimation:  Bool32,
	conservativePointAndLineRasterization:  Bool32,
	degenerateTrianglesRasterized:  Bool32,
	degenerateLinesRasterized:  Bool32,
	fullyCoveredFragmentShaderInputVariable:  Bool32,
	conservativeRasterizationPostDepthCoverage:  Bool32
}

GeometryAABBNV::struct {
	sType:  StructureType,
	pNext: ^void,
	aabbData:  Buffer,
	numAABBs:  u32,
	stride:  u32,
	offset:  DeviceSize
}

PhysicalDeviceShaderDrawParametersFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderDrawParameters:  Bool32
}

DeviceGroupCommandBufferBeginInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceMask:  u32
}

SwapchainDisplayNativeHdrCreateInfoAMD::struct {
	sType:  StructureType,
	pNext: ^void,
	localDimmingEnable:  Bool32
}

DescriptorSetVariableDescriptorCountAllocateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	descriptorSetCount:  u32,
	pDescriptorCounts: ^u32
}

ImageSubresourceLayers::struct {
	aspectMask:  ImageAspectFlags,
	mipLevel:  u32,
	baseArrayLayer:  u32,
	layerCount:  u32
}

SparseMemoryBind::struct {
	resourceOffset:  DeviceSize,
	size:  DeviceSize,
	memory:  DeviceMemory,
	memoryOffset:  DeviceSize,
	flags:  SparseMemoryBindFlags
}

ExternalImageFormatPropertiesNV::struct {
	imageFormatProperties:  ImageFormatProperties,
	externalMemoryFeatures:  ExternalMemoryFeatureFlagsNV,
	exportFromImportedHandleTypes:  ExternalMemoryHandleTypeFlagsNV,
	compatibleHandleTypes:  ExternalMemoryHandleTypeFlagsNV
}

ExternalBufferProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	externalMemoryProperties:  ExternalMemoryProperties
}

PhysicalDeviceShaderImageAtomicInt64FeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderImageInt64Atomics:  Bool32,
	sparseImageInt64Atomics:  Bool32
}

PipelineRasterizationDepthClipStateCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineRasterizationDepthClipStateCreateFlagsEXT,
	depthClipEnable:  Bool32
}

SubpassDependency::struct {
	srcSubpass:  u32,
	dstSubpass:  u32,
	srcStageMask:  PipelineStageFlags,
	dstStageMask:  PipelineStageFlags,
	srcAccessMask:  AccessFlags,
	dstAccessMask:  AccessFlags,
	dependencyFlags:  DependencyFlags
}

RenderPassMultiviewCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	subpassCount:  u32,
	pViewMasks: ^u32,
	dependencyCount:  u32,
	pViewOffsets: ^i32,
	correlationMaskCount:  u32,
	pCorrelationMasks: ^u32
}

ExportMemoryAllocateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	handleTypes:  ExternalMemoryHandleTypeFlags
}

GeometryDataNV::struct {
	triangles:  GeometryTrianglesNV,
	aabbs:  GeometryAABBNV
}

InputAttachmentAspectReference::struct {
	subpass:  u32,
	inputAttachmentIndex:  u32,
	aspectMask:  ImageAspectFlags
}

ImageSwapchainCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	swapchain:  SwapchainKHR
}

DisplayPlanePropertiesKHR::struct {
	currentDisplay:  DisplayKHR,
	currentStackIndex:  u32
}

XcbSurfaceCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  XcbSurfaceCreateFlagsKHR,
	connection: ^xcb_connection_t,
	window:  xcb_window_t
}

ClearRect::struct {
	rect:  Rect2D,
	baseArrayLayer:  u32,
	layerCount:  u32
}

VertexInputAttributeDescription::struct {
	location:  u32,
	binding:  u32,
	format:  Format,
	offset:  u32
}

SurfaceCapabilitiesKHR::struct {
	minImageCount:  u32,
	maxImageCount:  u32,
	currentExtent:  Extent2D,
	minImageExtent:  Extent2D,
	maxImageExtent:  Extent2D,
	maxImageArrayLayers:  u32,
	supportedTransforms:  SurfaceTransformFlagsKHR,
	currentTransform:  SurfaceTransformFlagsKHR,
	supportedCompositeAlpha:  CompositeAlphaFlagsKHR,
	supportedUsageFlags:  ImageUsageFlags
}

ImageMemoryBarrier::struct {
	sType:  StructureType,
	pNext: ^void,
	srcAccessMask:  AccessFlags,
	dstAccessMask:  AccessFlags,
	oldLayout:  ImageLayout,
	newLayout:  ImageLayout,
	srcQueueFamilyIndex:  u32,
	dstQueueFamilyIndex:  u32,
	image:  Image,
	subresourceRange:  ImageSubresourceRange
}

SampleLocationEXT::struct {
	x:  f32,
	y:  f32
}

Extent3D::struct {
	width:  u32,
	height:  u32,
	depth:  u32
}

ImageCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  ImageCreateFlags,
	imageType:  ImageType,
	format:  Format,
	extent:  Extent3D,
	mipLevels:  u32,
	arrayLayers:  u32,
	samples:  SampleCountFlags,
	tiling:  ImageTiling,
	usage:  ImageUsageFlags,
	sharingMode:  SharingMode,
	queueFamilyIndexCount:  u32,
	pQueueFamilyIndices: ^u32,
	initialLayout:  ImageLayout
}

PhysicalDeviceExternalImageFormatInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	handleType:  ExternalMemoryHandleTypeFlags
}

DebugUtilsMessengerCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DebugUtilsMessengerCreateFlagsEXT,
	messageSeverity:  DebugUtilsMessageSeverityFlagsEXT,
	messageType:  DebugUtilsMessageTypeFlagsEXT,
	pfnUserCallback:  PFN_vkDebugUtilsMessengerCallbackEXT,
	pUserData: ^void
}

ExternalMemoryImageCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	handleTypes:  ExternalMemoryHandleTypeFlags
}

SubpassDescription2::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  SubpassDescriptionFlags,
	pipelineBindPoint:  PipelineBindPoint,
	viewMask:  u32,
	inputAttachmentCount:  u32,
	pInputAttachments: ^AttachmentReference2,
	colorAttachmentCount:  u32,
	pColorAttachments: ^AttachmentReference2,
	pResolveAttachments: ^AttachmentReference2,
	pDepthStencilAttachment: ^AttachmentReference2,
	preserveAttachmentCount:  u32,
	pPreserveAttachments: ^u32
}

DisplayEventInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	displayEvent:  DisplayEventTypeEXT
}

SubpassEndInfo::struct {
	sType:  StructureType,
	pNext: ^void
}

PhysicalDevicePipelineCreationCacheControlFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	pipelineCreationCacheControl:  Bool32
}

PipelineInputAssemblyStateCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineInputAssemblyStateCreateFlags,
	topology:  PrimitiveTopology,
	primitiveRestartEnable:  Bool32
}

PhysicalDeviceSeparateDepthStencilLayoutsFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	separateDepthStencilLayouts:  Bool32
}

PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	workgroupMemoryExplicitLayout:  Bool32,
	workgroupMemoryExplicitLayoutScalarBlockLayout:  Bool32,
	workgroupMemoryExplicitLayout8BitAccess:  Bool32,
	workgroupMemoryExplicitLayout16BitAccess:  Bool32
}

PhysicalDevice4444FormatsFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	formatA4R4G4B4:  Bool32,
	formatA4B4G4R4:  Bool32
}

AttachmentSampleLocationsEXT::struct {
	attachmentIndex:  u32,
	sampleLocationsInfo:  SampleLocationsInfoEXT
}

PhysicalDeviceFragmentShadingRateKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	sampleCounts:  SampleCountFlags,
	fragmentSize:  Extent2D
}

PastPresentationTimingGOOGLE::struct {
	presentID:  u32,
	desiredPresentTime:  u64,
	actualPresentTime:  u64,
	earliestPresentTime:  u64,
	presentMargin:  u64
}

PipelineColorBlendAdvancedStateCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	srcPremultiplied:  Bool32,
	dstPremultiplied:  Bool32,
	blendOverlap:  BlendOverlapEXT
}

FramebufferAttachmentsCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	attachmentImageInfoCount:  u32,
	pAttachmentImageInfos: ^FramebufferAttachmentImageInfo
}

ExportMemoryAllocateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	handleTypes:  ExternalMemoryHandleTypeFlagsNV
}

ImportFenceWin32HandleInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	fence:  Fence,
	flags:  FenceImportFlags,
	handleType:  ExternalFenceHandleTypeFlags,
	handle:  HANDLE,
	name:  LPCWSTR
}

ProtectedSubmitInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	protectedSubmit:  Bool32
}

FramebufferMixedSamplesCombinationNV::struct {
	sType:  StructureType,
	pNext: ^void,
	coverageReductionMode:  CoverageReductionModeNV,
	rasterizationSamples:  SampleCountFlags,
	depthStencilSamples:  SampleCountFlags,
	colorSamples:  SampleCountFlags
}

Win32KeyedMutexAcquireReleaseInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	acquireCount:  u32,
	pAcquireSyncs: ^DeviceMemory,
	pAcquireKeys: ^u64,
	pAcquireTimeouts: ^u32,
	releaseCount:  u32,
	pReleaseSyncs: ^DeviceMemory,
	pReleaseKeys: ^u64
}

PhysicalDeviceExtendedDynamicStateFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	extendedDynamicState:  Bool32
}

PhysicalDeviceSparseImageFormatInfo2::struct {
	sType:  StructureType,
	pNext: ^void,
	format:  Format,
	type:  ImageType,
	samples:  SampleCountFlags,
	usage:  ImageUsageFlags,
	tiling:  ImageTiling
}

PipelineCreationFeedbackEXT::struct {
	flags:  PipelineCreationFeedbackFlagsEXT,
	duration:  u64
}

SparseImageOpaqueMemoryBindInfo::struct {
	image:  Image,
	bindCount:  u32,
	pBinds: ^SparseMemoryBind
}

PhysicalDeviceToolPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	name:  [MAX_EXTENSION_NAME_SIZE]u8,
	version:  [MAX_EXTENSION_NAME_SIZE]u8,
	purposes:  ToolPurposeFlagsEXT,
	description:  [MAX_DESCRIPTION_SIZE]u8,
	layer:  [MAX_EXTENSION_NAME_SIZE]u8
}

ImageViewCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  ImageViewCreateFlags,
	image:  Image,
	viewType:  ImageViewType,
	format:  Format,
	components:  ComponentMapping,
	subresourceRange:  ImageSubresourceRange
}

BlitImageInfo2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcImage:  Image,
	srcImageLayout:  ImageLayout,
	dstImage:  Image,
	dstImageLayout:  ImageLayout,
	regionCount:  u32,
	pRegions: ^ImageBlit2KHR,
	filter:  Filter
}

RenderPassCreateInfo2::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  RenderPassCreateFlags,
	attachmentCount:  u32,
	pAttachments: ^AttachmentDescription2,
	subpassCount:  u32,
	pSubpasses: ^SubpassDescription2,
	dependencyCount:  u32,
	pDependencies: ^SubpassDependency2,
	correlatedViewMaskCount:  u32,
	pCorrelatedViewMasks: ^u32
}

DisplayProperties2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	displayProperties:  DisplayPropertiesKHR
}

PhysicalDeviceShadingRateImagePropertiesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	shadingRateTexelSize:  Extent2D,
	shadingRatePaletteSize:  u32,
	shadingRateMaxCoarseSamples:  u32
}

XYColorEXT::struct {
	x:  f32,
	y:  f32
}

PhysicalDeviceMemoryBudgetPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	heapBudget:  [MAX_MEMORY_HEAPS]DeviceSize,
	heapUsage:  [MAX_MEMORY_HEAPS]DeviceSize
}

PipelineViewportWScalingStateCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	viewportWScalingEnable:  Bool32,
	viewportCount:  u32,
	pViewportWScalings: ^ViewportWScalingNV
}

PipelineDepthStencilStateCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineDepthStencilStateCreateFlags,
	depthTestEnable:  Bool32,
	depthWriteEnable:  Bool32,
	depthCompareOp:  CompareOp,
	depthBoundsTestEnable:  Bool32,
	stencilTestEnable:  Bool32,
	front:  StencilOpState,
	back:  StencilOpState,
	minDepthBounds:  f32,
	maxDepthBounds:  f32
}

PhysicalDeviceShaderSMBuiltinsPropertiesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderSMCount:  u32,
	shaderWarpsPerSM:  u32
}

CommandBufferInheritanceRenderPassTransformInfoQCOM::struct {
	sType:  StructureType,
	pNext: ^void,
	transform:  SurfaceTransformFlagsKHR,
	renderArea:  Rect2D
}

BindSparseInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	waitSemaphoreCount:  u32,
	pWaitSemaphores: ^Semaphore,
	bufferBindCount:  u32,
	pBufferBinds: ^SparseBufferMemoryBindInfo,
	imageOpaqueBindCount:  u32,
	pImageOpaqueBinds: ^SparseImageOpaqueMemoryBindInfo,
	imageBindCount:  u32,
	pImageBinds: ^SparseImageMemoryBindInfo,
	signalSemaphoreCount:  u32,
	pSignalSemaphores: ^Semaphore
}

AndroidHardwareBufferPropertiesANDROID::struct {
	sType:  StructureType,
	pNext: ^void,
	allocationSize:  DeviceSize,
	memoryTypeBits:  u32
}

SemaphoreWaitInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  SemaphoreWaitFlags,
	semaphoreCount:  u32,
	pSemaphores: ^Semaphore,
	pValues: ^u64
}

PhysicalDeviceRobustness2FeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	robustBufferAccess2:  Bool32,
	robustImageAccess2:  Bool32,
	nullDescriptor:  Bool32
}

PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderZeroInitializeWorkgroupMemory:  Bool32
}

ExternalMemoryBufferCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	handleTypes:  ExternalMemoryHandleTypeFlags
}

PipelineRasterizationStateStreamCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineRasterizationStateStreamCreateFlagsEXT,
	rasterizationStream:  u32
}

ShaderResourceUsageAMD::struct {
	numUsedVgprs:  u32,
	numUsedSgprs:  u32,
	ldsSizePerLocalWorkGroup:  u32,
	ldsUsageSizeInBytes:  uint,
	scratchMemUsageInBytes:  uint
}

QueueFamilyProperties::struct {
	queueFlags:  QueueFlags,
	queueCount:  u32,
	timestampValidBits:  u32,
	minImageTransferGranularity:  Extent3D
}

AccelerationStructureInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	type:  AccelerationStructureTypeNV,
	flags:  BuildAccelerationStructureFlagsNV,
	instanceCount:  u32,
	geometryCount:  u32,
	pGeometries: ^GeometryNV
}

SurfaceCapabilitiesFullScreenExclusiveEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	fullScreenExclusiveSupported:  Bool32
}

PhysicalDeviceSubgroupSizeControlFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	subgroupSizeControl:  Bool32,
	computeFullSubgroups:  Bool32
}

FilterCubicImageViewImageFormatPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	filterCubic:  Bool32,
	filterCubicMinmax:  Bool32
}

MemoryWin32HandlePropertiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	memoryTypeBits:  u32
}

PhysicalDeviceDepthClipEnableFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	depthClipEnable:  Bool32
}

BindImageMemoryInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	image:  Image,
	memory:  DeviceMemory,
	memoryOffset:  DeviceSize
}

SamplerYcbcrConversionInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	conversion:  SamplerYcbcrConversion
}

PhysicalDeviceBlendOperationAdvancedPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	advancedBlendMaxColorAttachments:  u32,
	advancedBlendIndependentBlend:  Bool32,
	advancedBlendNonPremultipliedSrcColor:  Bool32,
	advancedBlendNonPremultipliedDstColor:  Bool32,
	advancedBlendCorrelatedOverlap:  Bool32,
	advancedBlendAllOperations:  Bool32
}

PipelineCoverageToColorStateCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineCoverageToColorStateCreateFlagsNV,
	coverageToColorEnable:  Bool32,
	coverageToColorLocation:  u32
}

DisplayPlaneInfo2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	mode:  DisplayModeKHR,
	planeIndex:  u32
}

MemoryAllocateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	allocationSize:  DeviceSize,
	memoryTypeIndex:  u32
}

WriteDescriptorSetInlineUniformBlockEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	dataSize:  u32,
	pData: ^void
}

AccelerationStructureDeviceAddressInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	accelerationStructure:  AccelerationStructureKHR
}

DeviceGroupRenderPassBeginInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceMask:  u32,
	deviceRenderAreaCount:  u32,
	pDeviceRenderAreas: ^Rect2D
}

ExportMemoryWin32HandleInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	pAttributes: ^SECURITY_ATTRIBUTES,
	dwAccess:  DWORD
}

PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderDemoteToHelperInvocation:  Bool32
}

CommandPoolCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  CommandPoolCreateFlags,
	queueFamilyIndex:  u32
}

PhysicalDeviceVertexAttributeDivisorPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	maxVertexAttribDivisor:  u32
}

CoarseSampleOrderCustomNV::struct {
	shadingRate:  ShadingRatePaletteEntryNV,
	sampleCount:  u32,
	sampleLocationCount:  u32,
	pSampleLocations: ^CoarseSampleLocationNV
}

PhysicalDeviceVulkan11Properties::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceUUID:  [UUID_SIZE]u8,
	driverUUID:  [UUID_SIZE]u8,
	deviceLUID:  [LUID_SIZE]u8,
	deviceNodeMask:  u32,
	deviceLUIDValid:  Bool32,
	subgroupSize:  u32,
	subgroupSupportedStages:  ShaderStageFlags,
	subgroupSupportedOperations:  SubgroupFeatureFlags,
	subgroupQuadOperationsInAllStages:  Bool32,
	pointClippingBehavior:  PointClippingBehavior,
	maxMultiviewViewCount:  u32,
	maxMultiviewInstanceIndex:  u32,
	protectedNoFault:  Bool32,
	maxPerSetDescriptors:  u32,
	maxMemoryAllocationSize:  DeviceSize
}

PhysicalDeviceDeviceGeneratedCommandsPropertiesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	maxGraphicsShaderGroupCount:  u32,
	maxIndirectSequenceCount:  u32,
	maxIndirectCommandsTokenCount:  u32,
	maxIndirectCommandsStreamCount:  u32,
	maxIndirectCommandsTokenOffset:  u32,
	maxIndirectCommandsStreamStride:  u32,
	minSequencesCountBufferOffsetAlignment:  u32,
	minSequencesIndexBufferOffsetAlignment:  u32,
	minIndirectCommandsBufferOffsetAlignment:  u32
}

PhysicalDeviceVulkan12Properties::struct {
	sType:  StructureType,
	pNext: ^void,
	driverID:  DriverId,
	driverName:  [MAX_DRIVER_NAME_SIZE]u8,
	driverInfo:  [MAX_DRIVER_INFO_SIZE]u8,
	conformanceVersion:  ConformanceVersion,
	denormBehaviorIndependence:  ShaderFloatControlsIndependence,
	roundingModeIndependence:  ShaderFloatControlsIndependence,
	shaderSignedZeroInfNanPreserveFloat16:  Bool32,
	shaderSignedZeroInfNanPreserveFloat32:  Bool32,
	shaderSignedZeroInfNanPreserveFloat64:  Bool32,
	shaderDenormPreserveFloat16:  Bool32,
	shaderDenormPreserveFloat32:  Bool32,
	shaderDenormPreserveFloat64:  Bool32,
	shaderDenormFlushToZeroFloat16:  Bool32,
	shaderDenormFlushToZeroFloat32:  Bool32,
	shaderDenormFlushToZeroFloat64:  Bool32,
	shaderRoundingModeRTEFloat16:  Bool32,
	shaderRoundingModeRTEFloat32:  Bool32,
	shaderRoundingModeRTEFloat64:  Bool32,
	shaderRoundingModeRTZFloat16:  Bool32,
	shaderRoundingModeRTZFloat32:  Bool32,
	shaderRoundingModeRTZFloat64:  Bool32,
	maxUpdateAfterBindDescriptorsInAllPools:  u32,
	shaderUniformBufferArrayNonUniformIndexingNative:  Bool32,
	shaderSampledImageArrayNonUniformIndexingNative:  Bool32,
	shaderStorageBufferArrayNonUniformIndexingNative:  Bool32,
	shaderStorageImageArrayNonUniformIndexingNative:  Bool32,
	shaderInputAttachmentArrayNonUniformIndexingNative:  Bool32,
	robustBufferAccessUpdateAfterBind:  Bool32,
	quadDivergentImplicitLod:  Bool32,
	maxPerStageDescriptorUpdateAfterBindSamplers:  u32,
	maxPerStageDescriptorUpdateAfterBindUniformBuffers:  u32,
	maxPerStageDescriptorUpdateAfterBindStorageBuffers:  u32,
	maxPerStageDescriptorUpdateAfterBindSampledImages:  u32,
	maxPerStageDescriptorUpdateAfterBindStorageImages:  u32,
	maxPerStageDescriptorUpdateAfterBindInputAttachments:  u32,
	maxPerStageUpdateAfterBindResources:  u32,
	maxDescriptorSetUpdateAfterBindSamplers:  u32,
	maxDescriptorSetUpdateAfterBindUniformBuffers:  u32,
	maxDescriptorSetUpdateAfterBindUniformBuffersDynamic:  u32,
	maxDescriptorSetUpdateAfterBindStorageBuffers:  u32,
	maxDescriptorSetUpdateAfterBindStorageBuffersDynamic:  u32,
	maxDescriptorSetUpdateAfterBindSampledImages:  u32,
	maxDescriptorSetUpdateAfterBindStorageImages:  u32,
	maxDescriptorSetUpdateAfterBindInputAttachments:  u32,
	supportedDepthResolveModes:  ResolveModeFlags,
	supportedStencilResolveModes:  ResolveModeFlags,
	independentResolveNone:  Bool32,
	independentResolve:  Bool32,
	filterMinmaxSingleComponentFormats:  Bool32,
	filterMinmaxImageComponentMapping:  Bool32,
	maxTimelineSemaphoreValueDifference:  u64,
	framebufferIntegerColorSampleCounts:  SampleCountFlags
}

PresentTimeGOOGLE::struct {
	presentID:  u32,
	desiredPresentTime:  u64
}

FenceCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  FenceCreateFlags
}

PhysicalDeviceBufferDeviceAddressFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	bufferDeviceAddress:  Bool32,
	bufferDeviceAddressCaptureReplay:  Bool32,
	bufferDeviceAddressMultiDevice:  Bool32
}

DeviceGroupPresentCapabilitiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	presentMask:  [MAX_DEVICE_GROUP_SIZE]u32,
	modes:  DeviceGroupPresentModeFlagsKHR
}

PhysicalDeviceFeatures::struct {
	robustBufferAccess:  Bool32,
	fullDrawIndexUint32:  Bool32,
	imageCubeArray:  Bool32,
	independentBlend:  Bool32,
	geometryShader:  Bool32,
	tessellationShader:  Bool32,
	sampleRateShading:  Bool32,
	dualSrcBlend:  Bool32,
	logicOp:  Bool32,
	multiDrawIndirect:  Bool32,
	drawIndirectFirstInstance:  Bool32,
	depthClamp:  Bool32,
	depthBiasClamp:  Bool32,
	fillModeNonSolid:  Bool32,
	depthBounds:  Bool32,
	wideLines:  Bool32,
	largePoints:  Bool32,
	alphaToOne:  Bool32,
	multiViewport:  Bool32,
	samplerAnisotropy:  Bool32,
	textureCompressionETC2:  Bool32,
	textureCompressionASTC_LDR:  Bool32,
	textureCompressionBC:  Bool32,
	occlusionQueryPrecise:  Bool32,
	pipelineStatisticsQuery:  Bool32,
	vertexPipelineStoresAndAtomics:  Bool32,
	fragmentStoresAndAtomics:  Bool32,
	shaderTessellationAndGeometryPointSize:  Bool32,
	shaderImageGatherExtended:  Bool32,
	shaderStorageImageExtendedFormats:  Bool32,
	shaderStorageImageMultisample:  Bool32,
	shaderStorageImageReadWithoutFormat:  Bool32,
	shaderStorageImageWriteWithoutFormat:  Bool32,
	shaderUniformBufferArrayDynamicIndexing:  Bool32,
	shaderSampledImageArrayDynamicIndexing:  Bool32,
	shaderStorageBufferArrayDynamicIndexing:  Bool32,
	shaderStorageImageArrayDynamicIndexing:  Bool32,
	shaderClipDistance:  Bool32,
	shaderCullDistance:  Bool32,
	shaderFloat64:  Bool32,
	shaderInt64:  Bool32,
	shaderInt16:  Bool32,
	shaderResourceResidency:  Bool32,
	shaderResourceMinLod:  Bool32,
	sparseBinding:  Bool32,
	sparseResidencyBuffer:  Bool32,
	sparseResidencyImage2D:  Bool32,
	sparseResidencyImage3D:  Bool32,
	sparseResidency2Samples:  Bool32,
	sparseResidency4Samples:  Bool32,
	sparseResidency8Samples:  Bool32,
	sparseResidency16Samples:  Bool32,
	sparseResidencyAliased:  Bool32,
	variableMultisampleRate:  Bool32,
	inheritedQueries:  Bool32
}

DrawIndirectCommand::struct {
	vertexCount:  u32,
	instanceCount:  u32,
	firstVertex:  u32,
	firstInstance:  u32
}

BindIndexBufferIndirectCommandNV::struct {
	bufferAddress:  DeviceAddress,
	size:  u32,
	indexType:  IndexType
}

SemaphoreGetWin32HandleInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	semaphore:  Semaphore,
	handleType:  ExternalSemaphoreHandleTypeFlags
}

PerformanceCounterKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	unit:  PerformanceCounterUnitKHR,
	scope:  PerformanceCounterScopeKHR,
	storage:  PerformanceCounterStorageKHR,
	uuid:  [UUID_SIZE]u8
}

Viewport::struct {
	x:  f32,
	y:  f32,
	width:  f32,
	height:  f32,
	minDepth:  f32,
	maxDepth:  f32
}

ImageMemoryBarrier2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcStageMask:  PipelineStageFlags2KHR,
	srcAccessMask:  AccessFlags2KHR,
	dstStageMask:  PipelineStageFlags2KHR,
	dstAccessMask:  AccessFlags2KHR,
	oldLayout:  ImageLayout,
	newLayout:  ImageLayout,
	srcQueueFamilyIndex:  u32,
	dstQueueFamilyIndex:  u32,
	image:  Image,
	subresourceRange:  ImageSubresourceRange
}

BindVertexBufferIndirectCommandNV::struct {
	bufferAddress:  DeviceAddress,
	size:  u32,
	stride:  u32
}

VertexInputBindingDivisorDescriptionEXT::struct {
	binding:  u32,
	divisor:  u32
}

PhysicalDeviceSamplerYcbcrConversionFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	samplerYcbcrConversion:  Bool32
}

PhysicalDevicePerformanceQueryPropertiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	allowCommandBufferQueryCopies:  Bool32
}

WriteDescriptorSetAccelerationStructureNV::struct {
	sType:  StructureType,
	pNext: ^void,
	accelerationStructureCount:  u32,
	pAccelerationStructures: ^AccelerationStructureNV
}

AccelerationStructureCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	compactedSize:  DeviceSize,
	info:  AccelerationStructureInfoNV
}

PhysicalDevice8BitStorageFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	storageBuffer8BitAccess:  Bool32,
	uniformAndStorageBuffer8BitAccess:  Bool32,
	storagePushConstant8:  Bool32
}

PerformanceCounterDescriptionKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PerformanceCounterDescriptionFlagsKHR,
	name:  [MAX_DESCRIPTION_SIZE]u8,
	category:  [MAX_DESCRIPTION_SIZE]u8,
	description:  [MAX_DESCRIPTION_SIZE]u8
}

CopyBufferToImageInfo2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	srcBuffer:  Buffer,
	dstImage:  Image,
	dstImageLayout:  ImageLayout,
	regionCount:  u32,
	pRegions: ^BufferImageCopy2KHR
}

ImportMemoryWin32HandleInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	handleType:  ExternalMemoryHandleTypeFlagsNV,
	handle:  HANDLE
}

GeneratedCommandsMemoryRequirementsInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	pipelineBindPoint:  PipelineBindPoint,
	pipeline:  Pipeline,
	indirectCommandsLayout:  IndirectCommandsLayoutNV,
	maxSequencesCount:  u32
}

MappedMemoryRange::struct {
	sType:  StructureType,
	pNext: ^void,
	memory:  DeviceMemory,
	offset:  DeviceSize,
	size:  DeviceSize
}

PhysicalDeviceVariablePointersFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	variablePointersStorageBuffer:  Bool32,
	variablePointers:  Bool32
}

RayTracingShaderGroupCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	type:  RayTracingShaderGroupTypeKHR,
	generalShader:  u32,
	closestHitShader:  u32,
	anyHitShader:  u32,
	intersectionShader:  u32
}

PerformanceStreamMarkerInfoINTEL::struct {
	sType:  StructureType,
	pNext: ^void,
	marker:  u32
}

DisplayPlaneCapabilities2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	capabilities:  DisplayPlaneCapabilitiesKHR
}

ExternalMemoryImageCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	handleTypes:  ExternalMemoryHandleTypeFlagsNV
}

DrawIndexedIndirectCommand::struct {
	indexCount:  u32,
	instanceCount:  u32,
	firstIndex:  u32,
	vertexOffset:  i32,
	firstInstance:  u32
}

PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	textureCompressionASTC_HDR:  Bool32
}

PhysicalDeviceShaderSMBuiltinsFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderSMBuiltins:  Bool32
}

PipelineInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	pipeline:  Pipeline
}

AttachmentReference::struct {
	attachment:  u32,
	layout:  ImageLayout
}

PhysicalDeviceExternalFenceInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	handleType:  ExternalFenceHandleTypeFlags
}

Offset3D::struct {
	x:  i32,
	y:  i32,
	z:  i32
}

PhysicalDeviceRayTracingPipelinePropertiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderGroupHandleSize:  u32,
	maxRayRecursionDepth:  u32,
	maxShaderGroupStride:  u32,
	shaderGroupBaseAlignment:  u32,
	shaderGroupHandleCaptureReplaySize:  u32,
	maxRayDispatchInvocationCount:  u32,
	shaderGroupHandleAlignment:  u32,
	maxRayHitAttributeSize:  u32
}

CheckpointData2NV::struct {
	sType:  StructureType,
	pNext: ^void,
	stage:  PipelineStageFlags2KHR,
	pCheckpointMarker: ^void
}

PhysicalDeviceShaderCoreProperties2AMD::struct {
	sType:  StructureType,
	pNext: ^void,
	shaderCoreFeatures:  ShaderCorePropertiesFlagsAMD,
	activeComputeUnitCount:  u32
}

DisplaySurfaceCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DisplaySurfaceCreateFlagsKHR,
	displayMode:  DisplayModeKHR,
	planeIndex:  u32,
	planeStackIndex:  u32,
	transform:  SurfaceTransformFlagsKHR,
	globalAlpha:  f32,
	alphaMode:  DisplayPlaneAlphaFlagsKHR,
	imageExtent:  Extent2D
}

TextureLODGatherFormatPropertiesAMD::struct {
	sType:  StructureType,
	pNext: ^void,
	supportsTextureGatherLODBiasAMD:  Bool32
}

PhysicalDeviceScalarBlockLayoutFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	scalarBlockLayout:  Bool32
}

ShadingRatePaletteNV::struct {
	shadingRatePaletteEntryCount:  u32,
	pShadingRatePaletteEntries: ^ShadingRatePaletteEntryNV
}

DebugUtilsMessengerCallbackDataEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DebugUtilsMessengerCallbackDataFlagsEXT,
	pMessageIdName: cstring,
	messageIdNumber:  i32,
	pMessage: cstring,
	queueLabelCount:  u32,
	pQueueLabels: ^DebugUtilsLabelEXT,
	cmdBufLabelCount:  u32,
	pCmdBufLabels: ^DebugUtilsLabelEXT,
	objectCount:  u32,
	pObjects: ^DebugUtilsObjectNameInfoEXT
}

DeviceQueueGlobalPriorityCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	globalPriority:  QueueGlobalPriorityEXT
}

Win32KeyedMutexAcquireReleaseInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	acquireCount:  u32,
	pAcquireSyncs: ^DeviceMemory,
	pAcquireKeys: ^u64,
	pAcquireTimeoutMilliseconds: ^u32,
	releaseCount:  u32,
	pReleaseSyncs: ^DeviceMemory,
	pReleaseKeys: ^u64
}

PipelineCompilerControlCreateInfoAMD::struct {
	sType:  StructureType,
	pNext: ^void,
	compilerControlFlags:  PipelineCompilerControlFlagsAMD
}

PipelineExecutableInternalRepresentationKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	name:  [MAX_DESCRIPTION_SIZE]u8,
	description:  [MAX_DESCRIPTION_SIZE]u8,
	isText:  Bool32,
	dataSize:  uint,
	pData: ^void
}

TransformMatrixKHR::struct {
	matrix:  [4][3]f32
}

FragmentShadingRateAttachmentInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	pFragmentShadingRateAttachment: ^AttachmentReference2,
	shadingRateAttachmentTexelSize:  Extent2D
}

PhysicalDeviceCornerSampledImageFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	cornerSampledImage:  Bool32
}

EventCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  EventCreateFlags
}

FenceGetWin32HandleInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	fence:  Fence,
	handleType:  ExternalFenceHandleTypeFlags
}

DeviceQueueCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  DeviceQueueCreateFlags,
	queueFamilyIndex:  u32,
	queueCount:  u32,
	pQueuePriorities: ^f32
}

SurfaceFormatKHR::struct {
	format:  Format,
	colorSpace:  ColorSpaceKHR
}

SurfaceCapabilities2EXT::struct {
	sType:  StructureType,
	pNext: ^void,
	minImageCount:  u32,
	maxImageCount:  u32,
	currentExtent:  Extent2D,
	minImageExtent:  Extent2D,
	maxImageExtent:  Extent2D,
	maxImageArrayLayers:  u32,
	supportedTransforms:  SurfaceTransformFlagsKHR,
	currentTransform:  SurfaceTransformFlagsKHR,
	supportedCompositeAlpha:  CompositeAlphaFlagsKHR,
	supportedUsageFlags:  ImageUsageFlags,
	supportedSurfaceCounters:  SurfaceCounterFlagsEXT
}

SparseImageFormatProperties2::struct {
	sType:  StructureType,
	pNext: ^void,
	properties:  SparseImageFormatProperties
}

ImageSubresourceRange::struct {
	aspectMask:  ImageAspectFlags,
	baseMipLevel:  u32,
	levelCount:  u32,
	baseArrayLayer:  u32,
	layerCount:  u32
}

SparseImageMemoryBindInfo::struct {
	image:  Image,
	bindCount:  u32,
	pBinds: ^SparseImageMemoryBind
}

DisplayPlaneCapabilitiesKHR::struct {
	supportedAlpha:  DisplayPlaneAlphaFlagsKHR,
	minSrcPosition:  Offset2D,
	maxSrcPosition:  Offset2D,
	minSrcExtent:  Extent2D,
	maxSrcExtent:  Extent2D,
	minDstPosition:  Offset2D,
	maxDstPosition:  Offset2D,
	minDstExtent:  Extent2D,
	maxDstExtent:  Extent2D
}

PhysicalDeviceMeshShaderPropertiesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	maxDrawMeshTasksCount:  u32,
	maxTaskWorkGroupInvocations:  u32,
	maxTaskWorkGroupSize:  [3]u32,
	maxTaskTotalMemorySize:  u32,
	maxTaskOutputCount:  u32,
	maxMeshWorkGroupInvocations:  u32,
	maxMeshWorkGroupSize:  [3]u32,
	maxMeshTotalMemorySize:  u32,
	maxMeshOutputVertices:  u32,
	maxMeshOutputPrimitives:  u32,
	maxMeshMultiviewViewCount:  u32,
	meshOutputPerVertexGranularity:  u32,
	meshOutputPerPrimitiveGranularity:  u32
}

ViewportWScalingNV::struct {
	xcoeff:  f32,
	ycoeff:  f32
}

RayTracingPipelineCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineCreateFlags,
	stageCount:  u32,
	pStages: ^PipelineShaderStageCreateInfo,
	groupCount:  u32,
	pGroups: ^RayTracingShaderGroupCreateInfoNV,
	maxRecursionDepth:  u32,
	layout:  PipelineLayout,
	basePipelineHandle:  Pipeline,
	basePipelineIndex:  i32
}

AttachmentDescription::struct {
	flags:  AttachmentDescriptionFlags,
	format:  Format,
	samples:  SampleCountFlags,
	loadOp:  AttachmentLoadOp,
	storeOp:  AttachmentStoreOp,
	stencilLoadOp:  AttachmentLoadOp,
	stencilStoreOp:  AttachmentStoreOp,
	initialLayout:  ImageLayout,
	finalLayout:  ImageLayout
}

ImageViewASTCDecodeModeEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	decodeMode:  Format
}

AccelerationStructureGeometryKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	geometryType:  GeometryTypeKHR,
	geometry:  AccelerationStructureGeometryDataKHR,
	flags:  GeometryFlagsKHR
}

AccelerationStructureGeometryInstancesDataKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	arrayOfPointers:  Bool32,
	data:  DeviceOrHostAddressConstKHR
}

HeadlessSurfaceCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  HeadlessSurfaceCreateFlagsEXT
}

PhysicalDeviceMemoryProperties2::struct {
	sType:  StructureType,
	pNext: ^void,
	memoryProperties:  PhysicalDeviceMemoryProperties
}

SwapchainCounterCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	surfaceCounters:  SurfaceCounterFlagsEXT
}

ExtensionProperties::struct {
	extensionName:  [MAX_EXTENSION_NAME_SIZE]u8,
	specVersion:  u32
}

FramebufferAttachmentImageInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  ImageCreateFlags,
	usage:  ImageUsageFlags,
	width:  u32,
	height:  u32,
	layerCount:  u32,
	viewFormatCount:  u32,
	pViewFormats: ^Format
}

XlibSurfaceCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  XlibSurfaceCreateFlagsKHR,
	dpy: ^Display,
	window:  Window
}

PhysicalDeviceSubgroupSizeControlPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	minSubgroupSize:  u32,
	maxSubgroupSize:  u32,
	maxComputeWorkgroupSubgroups:  u32,
	requiredSubgroupSizeStages:  ShaderStageFlags
}

BufferDeviceAddressCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	deviceAddress:  DeviceAddress
}

PhysicalDeviceDriverProperties::struct {
	sType:  StructureType,
	pNext: ^void,
	driverID:  DriverId,
	driverName:  [MAX_DRIVER_NAME_SIZE]u8,
	driverInfo:  [MAX_DRIVER_INFO_SIZE]u8,
	conformanceVersion:  ConformanceVersion
}

PhysicalDeviceInlineUniformBlockPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	maxInlineUniformBlockSize:  u32,
	maxPerStageDescriptorInlineUniformBlocks:  u32,
	maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks:  u32,
	maxDescriptorSetInlineUniformBlocks:  u32,
	maxDescriptorSetUpdateAfterBindInlineUniformBlocks:  u32
}

DisplayNativeHdrSurfaceCapabilitiesAMD::struct {
	sType:  StructureType,
	pNext: ^void,
	localDimmingSupport:  Bool32
}

CopyDescriptorSet::struct {
	sType:  StructureType,
	pNext: ^void,
	srcSet:  DescriptorSet,
	srcBinding:  u32,
	srcArrayElement:  u32,
	dstSet:  DescriptorSet,
	dstBinding:  u32,
	dstArrayElement:  u32,
	descriptorCount:  u32
}

PhysicalDeviceExternalBufferInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  BufferCreateFlags,
	usage:  BufferUsageFlags,
	handleType:  ExternalMemoryHandleTypeFlags
}

PhysicalDeviceHostQueryResetFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	hostQueryReset:  Bool32
}

VertexInputBindingDescription::struct {
	binding:  u32,
	stride:  u32,
	inputRate:  VertexInputRate
}

ApplicationInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	pApplicationName: cstring,
	applicationVersion:  u32,
	pEngineName: cstring,
	engineVersion:  u32,
	apiVersion:  u32
}

AcquireNextImageInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	swapchain:  SwapchainKHR,
	timeout:  u64,
	semaphore:  Semaphore,
	fence:  Fence,
	deviceMask:  u32
}

PhysicalDeviceTransformFeedbackFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	transformFeedback:  Bool32,
	geometryStreams:  Bool32
}

ImportFenceFdInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	fence:  Fence,
	flags:  FenceImportFlags,
	handleType:  ExternalFenceHandleTypeFlags,
	fd:  i32
}

DisplayModeParametersKHR::struct {
	visibleRegion:  Extent2D,
	refreshRate:  u32
}

PipelineViewportShadingRateImageStateCreateInfoNV::struct {
	sType:  StructureType,
	pNext: ^void,
	shadingRateImageEnable:  Bool32,
	viewportCount:  u32,
	pShadingRatePalettes: ^ShadingRatePaletteNV
}

DisplayPowerInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	powerState:  DisplayPowerStateEXT
}

PipelineCacheCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineCacheCreateFlags,
	initialDataSize:  uint,
	pInitialData: ^void
}

DispatchIndirectCommand::struct {
	x:  u32,
	y:  u32,
	z:  u32
}

DebugMarkerObjectNameInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	objectType:  DebugReportObjectTypeEXT,
	object:  u64,
	pObjectName: cstring
}

PresentRegionKHR::struct {
	rectangleCount:  u32,
	pRectangles: ^RectLayerKHR
}

MemoryAllocateFlagsInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  MemoryAllocateFlags,
	deviceMask:  u32
}

SurfaceFormat2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	surfaceFormat:  SurfaceFormatKHR
}

ExternalFormatANDROID::struct {
	sType:  StructureType,
	pNext: ^void,
	externalFormat:  u64
}

PhysicalDeviceBufferDeviceAddressFeatures::struct {
	sType:  StructureType,
	pNext: ^void,
	bufferDeviceAddress:  Bool32,
	bufferDeviceAddressCaptureReplay:  Bool32,
	bufferDeviceAddressMultiDevice:  Bool32
}

PhysicalDeviceFragmentDensityMapPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	minFragmentDensityTexelSize:  Extent2D,
	maxFragmentDensityTexelSize:  Extent2D,
	fragmentDensityInvocations:  Bool32
}

FormatProperties2::struct {
	sType:  StructureType,
	pNext: ^void,
	formatProperties:  FormatProperties
}

PhysicalDeviceSampleLocationsPropertiesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	sampleLocationSampleCounts:  SampleCountFlags,
	maxSampleLocationGridSize:  Extent2D,
	sampleLocationCoordinateRange:  [2]f32,
	sampleLocationSubPixelBits:  u32,
	variableSampleLocations:  Bool32
}

BufferDeviceAddressInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	buffer:  Buffer
}

PhysicalDeviceLineRasterizationFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	rectangularLines:  Bool32,
	bresenhamLines:  Bool32,
	smoothLines:  Bool32,
	stippledRectangularLines:  Bool32,
	stippledBresenhamLines:  Bool32,
	stippledSmoothLines:  Bool32
}

PhysicalDeviceCustomBorderColorFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	customBorderColors:  Bool32,
	customBorderColorWithoutFormat:  Bool32
}

PhysicalDeviceFragmentShadingRateFeaturesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	pipelineFragmentShadingRate:  Bool32,
	primitiveFragmentShadingRate:  Bool32,
	attachmentFragmentShadingRate:  Bool32
}

WriteDescriptorSet::struct {
	sType:  StructureType,
	pNext: ^void,
	dstSet:  DescriptorSet,
	dstBinding:  u32,
	dstArrayElement:  u32,
	descriptorCount:  u32,
	descriptorType:  DescriptorType,
	pImageInfo: ^DescriptorImageInfo,
	pBufferInfo: ^DescriptorBufferInfo,
	pTexelBufferView: ^BufferView
}

BufferMemoryBarrier::struct {
	sType:  StructureType,
	pNext: ^void,
	srcAccessMask:  AccessFlags,
	dstAccessMask:  AccessFlags,
	srcQueueFamilyIndex:  u32,
	dstQueueFamilyIndex:  u32,
	buffer:  Buffer,
	offset:  DeviceSize,
	size:  DeviceSize
}

DescriptorUpdateTemplateEntry::struct {
	dstBinding:  u32,
	dstArrayElement:  u32,
	descriptorCount:  u32,
	descriptorType:  DescriptorType,
	offset:  uint,
	stride:  uint
}

ComponentMapping::struct {
	r:  ComponentSwizzle,
	g:  ComponentSwizzle,
	b:  ComponentSwizzle,
	a:  ComponentSwizzle
}

FormatProperties::struct {
	linearTilingFeatures:  FormatFeatureFlags,
	optimalTilingFeatures:  FormatFeatureFlags,
	bufferFeatures:  FormatFeatureFlags
}

BaseOutStructure::struct {
	sType:  StructureType,
	pNext: ^BaseOutStructure
}

SemaphoreTypeCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	semaphoreType:  SemaphoreType,
	initialValue:  u64
}

PipelineMultisampleStateCreateInfo::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  PipelineMultisampleStateCreateFlags,
	rasterizationSamples:  SampleCountFlags,
	sampleShadingEnable:  Bool32,
	minSampleShading:  f32,
	pSampleMask: ^SampleMask,
	alphaToCoverageEnable:  Bool32,
	alphaToOneEnable:  Bool32
}

PhysicalDeviceShaderImageFootprintFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	imageFootprint:  Bool32
}

ImageViewHandleInfoNVX::struct {
	sType:  StructureType,
	pNext: ^void,
	imageView:  ImageView,
	descriptorType:  DescriptorType,
	sampler:  Sampler
}

PhysicalDeviceFragmentShadingRateEnumsFeaturesNV::struct {
	sType:  StructureType,
	pNext: ^void,
	fragmentShadingRateEnums:  Bool32,
	supersampleFragmentShadingRates:  Bool32,
	noInvocationFragmentShadingRates:  Bool32
}

PhysicalDeviceVertexAttributeDivisorFeaturesEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	vertexAttributeInstanceRateDivisor:  Bool32,
	vertexAttributeInstanceRateZeroDivisor:  Bool32
}

ShaderModuleValidationCacheCreateInfoEXT::struct {
	sType:  StructureType,
	pNext: ^void,
	validationCache:  ValidationCacheEXT
}

MacOSSurfaceCreateInfoMVK::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  MacOSSurfaceCreateFlagsMVK,
	pView: ^void
}

AccelerationStructureCreateInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	createFlags:  AccelerationStructureCreateFlagsKHR,
	buffer:  Buffer,
	offset:  DeviceSize,
	size:  DeviceSize,
	type:  AccelerationStructureTypeKHR,
	deviceAddress:  DeviceAddress
}

AttachmentReference2::struct {
	sType:  StructureType,
	pNext: ^void,
	attachment:  u32,
	layout:  ImageLayout,
	aspectMask:  ImageAspectFlags
}

AccelerationStructureVersionInfoKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	pVersionData: ^u8
}

StreamDescriptorSurfaceCreateInfoGGP::struct {
	sType:  StructureType,
	pNext: ^void,
	flags:  StreamDescriptorSurfaceCreateFlagsGGP,
	streamDescriptor:  GgpStreamDescriptor
}

MemoryBarrier::struct {
	sType:  StructureType,
	pNext: ^void,
	srcAccessMask:  AccessFlags,
	dstAccessMask:  AccessFlags
}

DisplayModeProperties2KHR::struct {
	sType:  StructureType,
	pNext: ^void,
	displayModeProperties:  DisplayModePropertiesKHR
}

MemoryFdPropertiesKHR::struct {
	sType:  StructureType,
	pNext: ^void,
	memoryTypeBits:  u32
}

CommandBuffer::distinct uint;
Pipeline::distinct uint;
DeviceMemory::distinct uint;
PipelineLayout::distinct uint;
DescriptorSetLayout::distinct uint;
RenderPass::distinct uint;
AccelerationStructureKHR::distinct uint;
PerformanceConfigurationINTEL::distinct uint;
ImageView::distinct uint;
ShaderModule::distinct uint;
PrivateDataSlotEXT::distinct uint;
DescriptorUpdateTemplate::distinct uint;
PhysicalDevice::distinct uint;
Fence::distinct uint;
DescriptorPool::distinct uint;
DescriptorSet::distinct uint;
SamplerYcbcrConversion::distinct uint;
AccelerationStructureNV::distinct uint;
Framebuffer::distinct uint;
ValidationCacheEXT::distinct uint;
Event::distinct uint;
Image::distinct uint;
SurfaceKHR::distinct uint;
DeferredOperationKHR::distinct uint;
DisplayKHR::distinct uint;
Instance::distinct uint;
Device::distinct uint;
Queue::distinct uint;
Sampler::distinct uint;
PipelineCache::distinct uint;
Buffer::distinct uint;
DisplayModeKHR::distinct uint;
SwapchainKHR::distinct uint;
Semaphore::distinct uint;
QueryPool::distinct uint;
DebugReportCallbackEXT::distinct uint;
BufferView::distinct uint;
IndirectCommandsLayoutNV::distinct uint;
DebugUtilsMessengerEXT::distinct uint;
CommandPool::distinct uint;
BindImageMemoryInfoKHR::distinct BindImageMemoryInfo;
SemaphoreWaitFlagBitsKHR::distinct SemaphoreWaitFlags;
PhysicalDeviceGroupPropertiesKHR::distinct PhysicalDeviceGroupProperties;
SamplerYcbcrConversionInfoKHR::distinct SamplerYcbcrConversionInfo;
PhysicalDeviceMaintenance3PropertiesKHR::distinct PhysicalDeviceMaintenance3Properties;
CommandPoolTrimFlagsKHR::distinct CommandPoolTrimFlags;
ExternalFenceHandleTypeFlagBitsKHR::distinct ExternalFenceHandleTypeFlags;
PhysicalDeviceDepthStencilResolvePropertiesKHR::distinct PhysicalDeviceDepthStencilResolveProperties;
AttachmentReferenceStencilLayoutKHR::distinct AttachmentReferenceStencilLayout;
GeometryInstanceFlagBitsNV::distinct GeometryInstanceFlagsKHR;
ImageFormatProperties2KHR::distinct ImageFormatProperties2;
ExportSemaphoreCreateInfoKHR::distinct ExportSemaphoreCreateInfo;
ImagePlaneMemoryRequirementsInfoKHR::distinct ImagePlaneMemoryRequirementsInfo;
DescriptorSetLayoutSupportKHR::distinct DescriptorSetLayoutSupport;
SubpassBeginInfoKHR::distinct SubpassBeginInfo;
ExternalSemaphorePropertiesKHR::distinct ExternalSemaphoreProperties;
ExternalFencePropertiesKHR::distinct ExternalFenceProperties;
SemaphoreTypeKHR::distinct SemaphoreType;
ImageFormatListCreateInfoKHR::distinct ImageFormatListCreateInfo;
MemoryAllocateFlagsKHR::distinct MemoryAllocateFlags;
DeviceGroupRenderPassBeginInfoKHR::distinct DeviceGroupRenderPassBeginInfo;
PhysicalDeviceShaderFloat16Int8FeaturesKHR::distinct PhysicalDeviceShaderFloat16Int8Features;
PhysicalDeviceFloat16Int8FeaturesKHR::distinct PhysicalDeviceShaderFloat16Int8Features;
SamplerYcbcrConversionImageFormatPropertiesKHR::distinct SamplerYcbcrConversionImageFormatProperties;
BuildAccelerationStructureFlagBitsNV::distinct BuildAccelerationStructureFlagsKHR;
DescriptorUpdateTemplateTypeKHR::distinct DescriptorUpdateTemplateType;
PhysicalDeviceFeatures2KHR::distinct PhysicalDeviceFeatures2;
PhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR::distinct PhysicalDeviceShaderSubgroupExtendedTypesFeatures;
MemoryDedicatedAllocateInfoKHR::distinct MemoryDedicatedAllocateInfo;
SemaphoreWaitFlagsKHR::distinct SemaphoreWaitFlags;
ANativeWindow::distinct uint;
AHardwareBuffer::distinct uint;
CAMetalLayer::distinct uint;
BufferOpaqueCaptureAddressCreateInfoKHR::distinct BufferOpaqueCaptureAddressCreateInfo;
SemaphoreImportFlagBitsKHR::distinct SemaphoreImportFlags;
PhysicalDeviceBufferAddressFeaturesEXT::distinct PhysicalDeviceBufferDeviceAddressFeaturesEXT;
DescriptorSetVariableDescriptorCountLayoutSupportEXT::distinct DescriptorSetVariableDescriptorCountLayoutSupport;
AttachmentDescriptionStencilLayoutKHR::distinct AttachmentDescriptionStencilLayout;
DescriptorBindingFlagsEXT::distinct DescriptorBindingFlags;
QueryPoolCreateInfoINTEL::distinct QueryPoolPerformanceQueryCreateInfoINTEL;
RenderPassInputAttachmentAspectCreateInfoKHR::distinct RenderPassInputAttachmentAspectCreateInfo;
ImageViewUsageCreateInfoKHR::distinct ImageViewUsageCreateInfo;
DeviceMemoryOpaqueCaptureAddressInfoKHR::distinct DeviceMemoryOpaqueCaptureAddressInfo;
PeerMemoryFeatureFlagsKHR::distinct PeerMemoryFeatureFlags;
ImageMemoryRequirementsInfo2KHR::distinct ImageMemoryRequirementsInfo2;
DescriptorSetLayoutBindingFlagsCreateInfoEXT::distinct DescriptorSetLayoutBindingFlagsCreateInfo;
BindBufferMemoryInfoKHR::distinct BindBufferMemoryInfo;
GeometryFlagBitsNV::distinct GeometryFlagsKHR;
GeometryFlagsNV::distinct GeometryFlagsKHR;
DeviceGroupSubmitInfoKHR::distinct DeviceGroupSubmitInfo;
ExportFenceCreateInfoKHR::distinct ExportFenceCreateInfo;
DescriptorUpdateTemplateKHR::distinct DescriptorUpdateTemplate;
PhysicalDeviceSamplerYcbcrConversionFeaturesKHR::distinct PhysicalDeviceSamplerYcbcrConversionFeatures;
ExternalFenceFeatureFlagsKHR::distinct ExternalFenceFeatureFlags;
ExternalFenceHandleTypeFlagsKHR::distinct ExternalFenceHandleTypeFlags;
PipelineTessellationDomainOriginStateCreateInfoKHR::distinct PipelineTessellationDomainOriginStateCreateInfo;
SamplerYcbcrConversionKHR::distinct SamplerYcbcrConversion;
PhysicalDevice8BitStorageFeaturesKHR::distinct PhysicalDevice8BitStorageFeatures;
BindImageMemoryDeviceGroupInfoKHR::distinct BindImageMemoryDeviceGroupInfo;
PhysicalDeviceMultiviewPropertiesKHR::distinct PhysicalDeviceMultiviewProperties;
ExternalMemoryHandleTypeFlagBitsKHR::distinct ExternalMemoryHandleTypeFlags;
ExternalMemoryHandleTypeFlagsKHR::distinct ExternalMemoryHandleTypeFlags;
PeerMemoryFeatureFlagBitsKHR::distinct PeerMemoryFeatureFlags;
PhysicalDeviceVariablePointersFeaturesKHR::distinct PhysicalDeviceVariablePointersFeatures;
PhysicalDeviceVariablePointerFeaturesKHR::distinct PhysicalDeviceVariablePointersFeatures;
PhysicalDeviceVariablePointerFeatures::distinct PhysicalDeviceVariablePointersFeatures;
GeometryInstanceFlagsNV::distinct GeometryInstanceFlagsKHR;
ExternalMemoryPropertiesKHR::distinct ExternalMemoryProperties;
SampleMask::distinct u32;
Bool32::distinct u32;
Flags::distinct u32;
PhysicalDeviceExternalSemaphoreInfoKHR::distinct PhysicalDeviceExternalSemaphoreInfo;
BindBufferMemoryDeviceGroupInfoKHR::distinct BindBufferMemoryDeviceGroupInfo;
PhysicalDeviceImagelessFramebufferFeaturesKHR::distinct PhysicalDeviceImagelessFramebufferFeatures;
ResolveModeFlagsKHR::distinct ResolveModeFlags;
PhysicalDeviceExternalFenceInfoKHR::distinct PhysicalDeviceExternalFenceInfo;
ExternalImageFormatPropertiesKHR::distinct ExternalImageFormatProperties;
MemoryRequirements2KHR::distinct MemoryRequirements2;
ShaderFloatControlsIndependenceKHR::distinct ShaderFloatControlsIndependence;
DeviceGroupDeviceCreateInfoKHR::distinct DeviceGroupDeviceCreateInfo;
SamplerYcbcrModelConversionKHR::distinct SamplerYcbcrModelConversion;
PhysicalDeviceDescriptorIndexingFeaturesEXT::distinct PhysicalDeviceDescriptorIndexingFeatures;
BindImagePlaneMemoryInfoKHR::distinct BindImagePlaneMemoryInfo;
ImageSparseMemoryRequirementsInfo2KHR::distinct ImageSparseMemoryRequirementsInfo2;
PhysicalDeviceScalarBlockLayoutFeaturesEXT::distinct PhysicalDeviceScalarBlockLayoutFeatures;
SparseImageMemoryRequirements2KHR::distinct SparseImageMemoryRequirements2;
MemoryAllocateFlagBitsKHR::distinct MemoryAllocateFlags;
PhysicalDeviceShaderAtomicInt64FeaturesKHR::distinct PhysicalDeviceShaderAtomicInt64Features;
RenderPassAttachmentBeginInfoKHR::distinct RenderPassAttachmentBeginInfo;
TransformMatrixNV::distinct TransformMatrixKHR;
MemoryOpaqueCaptureAddressAllocateInfoKHR::distinct MemoryOpaqueCaptureAddressAllocateInfo;
PhysicalDeviceShaderDrawParameterFeatures::distinct PhysicalDeviceShaderDrawParametersFeatures;
AccelerationStructureTypeNV::distinct AccelerationStructureTypeKHR;
BuildAccelerationStructureFlagsNV::distinct BuildAccelerationStructureFlagsKHR;
DeviceGroupCommandBufferBeginInfoKHR::distinct DeviceGroupCommandBufferBeginInfo;
PhysicalDeviceMultiviewFeaturesKHR::distinct PhysicalDeviceMultiviewFeatures;
DescriptorSetVariableDescriptorCountAllocateInfoEXT::distinct DescriptorSetVariableDescriptorCountAllocateInfo;
AccelerationStructureInstanceNV::distinct AccelerationStructureInstanceKHR;
SparseImageFormatProperties2KHR::distinct SparseImageFormatProperties2;
ExternalBufferPropertiesKHR::distinct ExternalBufferProperties;
DriverIdKHR::distinct DriverId;
SamplerYcbcrRangeKHR::distinct SamplerYcbcrRange;
PhysicalDeviceTimelineSemaphoreFeaturesKHR::distinct PhysicalDeviceTimelineSemaphoreFeatures;
RayTracingShaderGroupTypeNV::distinct RayTracingShaderGroupTypeKHR;
PhysicalDeviceVulkanMemoryModelFeaturesKHR::distinct PhysicalDeviceVulkanMemoryModelFeatures;
RenderPassMultiviewCreateInfoKHR::distinct RenderPassMultiviewCreateInfo;
FenceImportFlagsKHR::distinct FenceImportFlags;
SamplerReductionModeEXT::distinct SamplerReductionMode;
ExportMemoryAllocateInfoKHR::distinct ExportMemoryAllocateInfo;
InputAttachmentAspectReferenceKHR::distinct InputAttachmentAspectReference;
SemaphoreImportFlagsKHR::distinct SemaphoreImportFlags;
PhysicalDeviceMemoryProperties2KHR::distinct PhysicalDeviceMemoryProperties2;
PhysicalDeviceIDPropertiesKHR::distinct PhysicalDeviceIDProperties;
PhysicalDeviceExternalImageFormatInfoKHR::distinct PhysicalDeviceExternalImageFormatInfo;
PhysicalDevicePointClippingPropertiesKHR::distinct PhysicalDevicePointClippingProperties;
SubpassEndInfoKHR::distinct SubpassEndInfo;
SubpassDependency2KHR::distinct SubpassDependency2;
ExternalMemoryImageCreateInfoKHR::distinct ExternalMemoryImageCreateInfo;
BufferMemoryRequirementsInfo2KHR::distinct BufferMemoryRequirementsInfo2;
SubpassDescription2KHR::distinct SubpassDescription2;
FramebufferAttachmentImageInfoKHR::distinct FramebufferAttachmentImageInfo;
PhysicalDeviceDriverPropertiesKHR::distinct PhysicalDeviceDriverProperties;
QueryPoolCreateFlags::distinct Flags;
PipelineLayoutCreateFlags::distinct Flags;
PipelineDepthStencilStateCreateFlags::distinct Flags;
PipelineDynamicStateCreateFlags::distinct Flags;
PipelineColorBlendStateCreateFlags::distinct Flags;
PipelineMultisampleStateCreateFlags::distinct Flags;
PipelineRasterizationStateCreateFlags::distinct Flags;
PipelineViewportStateCreateFlags::distinct Flags;
PipelineTessellationStateCreateFlags::distinct Flags;
PipelineInputAssemblyStateCreateFlags::distinct Flags;
PipelineVertexInputStateCreateFlags::distinct Flags;
BufferViewCreateFlags::distinct Flags;
InstanceCreateFlags::distinct Flags;
DeviceCreateFlags::distinct Flags;
SemaphoreCreateFlags::distinct Flags;
MemoryMapFlags::distinct Flags;
DescriptorPoolResetFlags::distinct Flags;
DescriptorUpdateTemplateCreateFlags::distinct Flags;
DisplayModeCreateFlagsKHR::distinct Flags;
DisplaySurfaceCreateFlagsKHR::distinct Flags;
AndroidSurfaceCreateFlagsKHR::distinct Flags;
ViSurfaceCreateFlagsNN::distinct Flags;
WaylandSurfaceCreateFlagsKHR::distinct Flags;
Win32SurfaceCreateFlagsKHR::distinct Flags;
XlibSurfaceCreateFlagsKHR::distinct Flags;
XcbSurfaceCreateFlagsKHR::distinct Flags;
DirectFBSurfaceCreateFlagsEXT::distinct Flags;
IOSSurfaceCreateFlagsMVK::distinct Flags;
MacOSSurfaceCreateFlagsMVK::distinct Flags;
MetalSurfaceCreateFlagsEXT::distinct Flags;
ImagePipeSurfaceCreateFlagsFUCHSIA::distinct Flags;
StreamDescriptorSurfaceCreateFlagsGGP::distinct Flags;
HeadlessSurfaceCreateFlagsEXT::distinct Flags;
ScreenSurfaceCreateFlagsQNX::distinct Flags;
CommandPoolTrimFlags::distinct Flags;
PipelineViewportSwizzleStateCreateFlagsNV::distinct Flags;
PipelineDiscardRectangleStateCreateFlagsEXT::distinct Flags;
PipelineCoverageToColorStateCreateFlagsNV::distinct Flags;
PipelineCoverageModulationStateCreateFlagsNV::distinct Flags;
PipelineCoverageReductionStateCreateFlagsNV::distinct Flags;
ValidationCacheCreateFlagsEXT::distinct Flags;
DebugUtilsMessengerCreateFlagsEXT::distinct Flags;
DebugUtilsMessengerCallbackDataFlagsEXT::distinct Flags;
DeviceMemoryReportFlagsEXT::distinct Flags;
PipelineRasterizationConservativeStateCreateFlagsEXT::distinct Flags;
PipelineRasterizationStateStreamCreateFlagsEXT::distinct Flags;
PipelineRasterizationDepthClipStateCreateFlagsEXT::distinct Flags;
TessellationDomainOriginKHR::distinct TessellationDomainOrigin;
ExternalFenceFeatureFlagBitsKHR::distinct ExternalFenceFeatureFlags;
DeviceGroupBindSparseInfoKHR::distinct DeviceGroupBindSparseInfo;
PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR::distinct PhysicalDeviceSeparateDepthStencilLayoutsFeatures;
PhysicalDeviceExternalBufferInfoKHR::distinct PhysicalDeviceExternalBufferInfo;
PhysicalDeviceHostQueryResetFeaturesEXT::distinct PhysicalDeviceHostQueryResetFeatures;
PhysicalDeviceProperties2KHR::distinct PhysicalDeviceProperties2;
FramebufferAttachmentsCreateInfoKHR::distinct FramebufferAttachmentsCreateInfo;
CopyAccelerationStructureModeNV::distinct CopyAccelerationStructureModeKHR;
AttachmentDescription2KHR::distinct AttachmentDescription2;
MemoryAllocateFlagsInfoKHR::distinct MemoryAllocateFlagsInfo;
PhysicalDeviceDescriptorIndexingPropertiesEXT::distinct PhysicalDeviceDescriptorIndexingProperties;
DescriptorUpdateTemplateCreateFlagsKHR::distinct DescriptorUpdateTemplateCreateFlags;
MemoryDedicatedRequirementsKHR::distinct MemoryDedicatedRequirements;
ExternalSemaphoreFeatureFlagBitsKHR::distinct ExternalSemaphoreFeatureFlags;
ImageStencilUsageCreateInfoEXT::distinct ImageStencilUsageCreateInfo;
PhysicalDevice16BitStorageFeaturesKHR::distinct PhysicalDevice16BitStorageFeatures;
ConformanceVersionKHR::distinct ConformanceVersion;
PhysicalDeviceSparseImageFormatInfo2KHR::distinct PhysicalDeviceSparseImageFormatInfo2;
FormatProperties2KHR::distinct FormatProperties2;
PhysicalDeviceBufferDeviceAddressFeaturesKHR::distinct PhysicalDeviceBufferDeviceAddressFeatures;
BufferDeviceAddressInfoKHR::distinct BufferDeviceAddressInfo;
BufferDeviceAddressInfoEXT::distinct BufferDeviceAddressInfo;
ResolveModeFlagBitsKHR::distinct ResolveModeFlags;
AabbPositionsNV::distinct AabbPositionsKHR;
TimelineSemaphoreSubmitInfoKHR::distinct TimelineSemaphoreSubmitInfo;
RenderPassCreateInfo2KHR::distinct RenderPassCreateInfo2;
ExternalSemaphoreHandleTypeFlagBitsKHR::distinct ExternalSemaphoreHandleTypeFlags;
ExternalSemaphoreHandleTypeFlagsKHR::distinct ExternalSemaphoreHandleTypeFlags;
ExternalMemoryFeatureFlagBitsKHR::distinct ExternalMemoryFeatureFlags;
QueueFamilyProperties2KHR::distinct QueueFamilyProperties2;
DescriptorUpdateTemplateEntryKHR::distinct DescriptorUpdateTemplateEntry;
ExternalSemaphoreFeatureFlagsKHR::distinct ExternalSemaphoreFeatureFlags;
GeometryTypeNV::distinct GeometryTypeKHR;
ChromaLocationKHR::distinct ChromaLocation;
PhysicalDeviceSamplerFilterMinmaxPropertiesEXT::distinct PhysicalDeviceSamplerFilterMinmaxProperties;
PointClippingBehaviorKHR::distinct PointClippingBehavior;
PhysicalDeviceTimelineSemaphorePropertiesKHR::distinct PhysicalDeviceTimelineSemaphoreProperties;
SemaphoreTypeCreateInfoKHR::distinct SemaphoreTypeCreateInfo;
ExternalMemoryFeatureFlagsKHR::distinct ExternalMemoryFeatureFlags;
PhysicalDeviceFloatControlsPropertiesKHR::distinct PhysicalDeviceFloatControlsProperties;
SamplerReductionModeCreateInfoEXT::distinct SamplerReductionModeCreateInfo;
Flags64::distinct u64;
DeviceSize::distinct u64;
DeviceAddress::distinct u64;
SemaphoreWaitInfoKHR::distinct SemaphoreWaitInfo;
DescriptorBindingFlagBitsEXT::distinct DescriptorBindingFlags;
SemaphoreSignalInfoKHR::distinct SemaphoreSignalInfo;
SamplerYcbcrConversionCreateInfoKHR::distinct SamplerYcbcrConversionCreateInfo;
PhysicalDeviceUniformBufferStandardLayoutFeaturesKHR::distinct PhysicalDeviceUniformBufferStandardLayoutFeatures;
ExternalMemoryBufferCreateInfoKHR::distinct ExternalMemoryBufferCreateInfo;
AttachmentReference2KHR::distinct AttachmentReference2;
DescriptorUpdateTemplateCreateInfoKHR::distinct DescriptorUpdateTemplateCreateInfo;
SubpassDescriptionDepthStencilResolveKHR::distinct SubpassDescriptionDepthStencilResolve;
FenceImportFlagBitsKHR::distinct FenceImportFlags;
PhysicalDeviceImageFormatInfo2KHR::distinct PhysicalDeviceImageFormatInfo2;
SamplerAddressMode::enum u32 {
	Repeat = 0,
	MirroredRepeat = 1,
	ClampToEdge = 2,
	ClampToBorder = 3,
	MirrorClampToEdge = 4
}

SparseImageFormatFlags::enum u32 {
	SingleMiptailBit = 0x1,
	AlignedMipSizeBit = 0x2,
	NonstandardBlockSizeBit = 0x4
}

SemaphoreWaitFlags::enum u32 {
	AnyBit = 0x1
}

ConservativeRasterizationModeEXT::enum u32 {
	DisabledExt = 0,
	OverestimateExt = 1,
	UnderestimateExt = 2
}

SubpassDescriptionFlags::enum u32 {
	PerViewAttributesBitNvx = 0x1,
	PerViewPositionXOnlyBitNvx = 0x2,
	FragmentRegionBitQcom = 0x4,
	ShaderResolveBitQcom = 0x8
}

MemoryHeapFlags::enum u32 {
	DeviceLocalBit = 0x1,
	MultiInstanceBit = 0x2
}

DisplayPlaneAlphaFlagsKHR::enum u32 {
	OpaqueBitKhr = 0x1,
	GlobalBitKhr = 0x2,
	PerPixelBitKhr = 0x4,
	PerPixelPremultipliedBitKhr = 0x8
}

SwapchainImageUsageFlagsANDROID::enum u32 {
	SharedBitAndroid = 0x1
}

ExternalFenceHandleTypeFlags::enum u32 {
	OpaqueFdBit = 0x1,
	OpaqueWin32Bit = 0x2,
	OpaqueWin32KmtBit = 0x4,
	SyncFdBit = 0x8
}

QueryPipelineStatisticFlags::enum u32 {
	InputAssemblyVerticesBit = 0x1,
	InputAssemblyPrimitivesBit = 0x2,
	VertexShaderInvocationsBit = 0x4,
	GeometryShaderInvocationsBit = 0x8,
	GeometryShaderPrimitivesBit = 0x10,
	ClippingInvocationsBit = 0x20,
	ClippingPrimitivesBit = 0x40,
	FragmentShaderInvocationsBit = 0x80,
	TessellationControlShaderPatchesBit = 0x100,
	TessellationEvaluationShaderInvocationsBit = 0x200,
	ComputeShaderInvocationsBit = 0x400
}

VendorId::enum u32 {
	Viv = 65537,
	Vsi = 65538,
	Kazan = 65539,
	Codeplay = 65540,
	Mesa = 65541,
	Pocl = 65542
}

GeometryInstanceFlagsKHR::enum u32 {
	TriangleFacingCullDisableBitKhr = 0x1,
	TriangleFrontCounterclockwiseBitKhr = 0x2,
	ForceOpaqueBitKhr = 0x4,
	ForceNoOpaqueBitKhr = 0x8
}

BlendFactor::enum u32 {
	Zero = 0,
	One = 1,
	SrcColor = 2,
	OneMinusSrcColor = 3,
	DstColor = 4,
	OneMinusDstColor = 5,
	SrcAlpha = 6,
	OneMinusSrcAlpha = 7,
	DstAlpha = 8,
	OneMinusDstAlpha = 9,
	ConstantColor = 10,
	OneMinusConstantColor = 11,
	ConstantAlpha = 12,
	OneMinusConstantAlpha = 13,
	SrcAlphaSaturate = 14,
	Src1Color = 15,
	OneMinusSrc1Color = 16,
	Src1Alpha = 17,
	OneMinusSrc1Alpha = 18
}

LogicOp::enum u32 {
	Clear = 0,
	And = 1,
	AndReverse = 2,
	Copy = 3,
	AndInverted = 4,
	NoOp = 5,
	Xor = 6,
	Or = 7,
	Nor = 8,
	Equivalent = 9,
	Invert = 10,
	OrReverse = 11,
	CopyInverted = 12,
	OrInverted = 13,
	Nand = 14,
	Set = 15
}

DeviceDiagnosticsConfigFlagsNV::enum u32 {
	EnableShaderDebugInfoBitNv = 0x1,
	EnableResourceTrackingBitNv = 0x2,
	EnableAutomaticCheckpointsBitNv = 0x4
}

DebugUtilsMessageSeverityFlagsEXT::enum u32 {
	VerboseBitExt = 0x1,
	InfoBitExt = 0x10,
	WarningBitExt = 0x100,
	ErrorBitExt = 0x1000
}

PerformanceValueTypeINTEL::enum u32 {
	Uint32Intel = 0,
	Uint64Intel = 1,
	FloatIntel = 2,
	BoolIntel = 3,
	StringIntel = 4
}

QueryPoolSamplingModeINTEL::enum u32 {
	ManualIntel = 0
}

QueryType::enum u32 {
	Occlusion = 0,
	PipelineStatistics = 1,
	Timestamp = 2,
	TransformFeedbackStreamExt = 1000028004,
	PerformanceQueryKhr = 1000116000,
	AccelerationStructureCompactedSizeKhr = 1000150000,
	AccelerationStructureSerializationSizeKhr = 1000150001,
	AccelerationStructureCompactedSizeNv = 1000165000,
	PerformanceQueryIntel = 1000210000
}

PipelineCacheCreateFlags::enum u32 {
	ExternallySynchronizedBitExt = 0x1
}

SamplerCreateFlags::enum u32 {
	SubsampledBitExt = 0x1,
	SubsampledCoarseReconstructionBitExt = 0x2
}

SemaphoreType::enum u32 {
	Binary = 0,
	Timeline = 1
}

SystemAllocationScope::enum u32 {
	Command = 0,
	Object = 1,
	Cache = 2,
	Device = 3,
	Instance = 4
}

IndirectStateFlagsNV::enum u32 {
	FlagFrontfaceBitNv = 0x1
}

SubpassContents::enum u32 {
	Inline = 0,
	SecondaryCommandBuffers = 1
}

PipelineCreateFlags::enum u32 {
	DisableOptimizationBit = 0x1,
	AllowDerivativesBit = 0x2,
	DerivativeBit = 0x4,
	ViewIndexFromDeviceIndexBit = 0x8,
	DispatchBaseBit = 0x10,
	DeferCompileBitNv = 0x20,
	CaptureStatisticsBitKhr = 0x40,
	CaptureInternalRepresentationsBitKhr = 0x80,
	FailOnPipelineCompileRequiredBitExt = 0x100,
	EarlyReturnOnFailureBitExt = 0x200,
	LibraryBitKhr = 0x800,
	RayTracingSkipTrianglesBitKhr = 0x1000,
	RayTracingSkipAabbsBitKhr = 0x2000,
	RayTracingNoNullAnyHitShadersBitKhr = 0x4000,
	RayTracingNoNullClosestHitShadersBitKhr = 0x8000,
	RayTracingNoNullMissShadersBitKhr = 0x10000,
	RayTracingNoNullIntersectionShadersBitKhr = 0x20000,
	IndirectBindableBitNv = 0x40000,
	RayTracingShaderGroupHandleCaptureReplayBitKhr = 0x80000
}

ConditionalRenderingFlagsEXT::enum u32 {
	InvertedBitExt = 0x1
}

LineRasterizationModeEXT::enum u32 {
	DefaultExt = 0,
	RectangularExt = 1,
	BresenhamExt = 2,
	RectangularSmoothExt = 3
}

BuildAccelerationStructureFlagsKHR::enum u32 {
	AllowUpdateBitKhr = 0x1,
	AllowCompactionBitKhr = 0x2,
	PreferFastTraceBitKhr = 0x4,
	PreferFastBuildBitKhr = 0x8,
	LowMemoryBitKhr = 0x10
}

DescriptorUpdateTemplateType::enum u32 {
	DescriptorSet = 0,
	PushDescriptorsKhr = 1
}

FrontFace::enum u32 {
	CounterClockwise = 0,
	Clockwise = 1
}

PerformanceParameterTypeINTEL::enum u32 {
	HwCountersSupportedIntel = 0,
	StreamMarkerValidBitsIntel = 1
}

SurfaceCounterFlagsEXT::enum u32 {
	VblankBitExt = 0x1
}

BufferCreateFlags::enum u32 {
	SparseBindingBit = 0x1,
	SparseResidencyBit = 0x2,
	SparseAliasedBit = 0x4,
	ProtectedBit = 0x8,
	DeviceAddressCaptureReplayBit = 0x10
}

CompositeAlphaFlagsKHR::enum u32 {
	OpaqueBitKhr = 0x1,
	PreMultipliedBitKhr = 0x2,
	PostMultipliedBitKhr = 0x4,
	InheritBitKhr = 0x8
}

MemoryOverallocationBehaviorAMD::enum u32 {
	DefaultAmd = 0,
	AllowedAmd = 1,
	DisallowedAmd = 2
}

EventCreateFlags::enum u32 {
	DeviceOnlyBitKhr = 0x1
}

SemaphoreImportFlags::enum u32 {
	TemporaryBit = 0x1
}

StencilFaceFlags::enum u32 {
	FrontBit = 0x1,
	BackBit = 0x2,
	FrontAndBack = 0x3
}

Result::enum u32 {
	VkErrorUnknown = 4294967283,
	VkErrorFragmentedPool = 4294967284,
	VkErrorFormatNotSupported = 4294967285,
	VkErrorTooManyObjects = 4294967286,
	VkErrorIncompatibleDriver = 4294967287,
	VkErrorFeatureNotPresent = 4294967288,
	VkErrorExtensionNotPresent = 4294967289,
	VkErrorLayerNotPresent = 4294967290,
	VkErrorMemoryMapFailed = 4294967291,
	VkErrorDeviceLost = 4294967292,
	VkErrorInitializationFailed = 4294967293,
	VkErrorOutOfDeviceMemory = 4294967294,
	VkErrorOutOfHostMemory = 4294967295,
	VkSuccess = 0,
	VkNotReady = 1,
	VkTimeout = 2,
	VkEventSet = 3,
	VkEventReset = 4,
	VkIncomplete = 5,
	VkErrorSurfaceLostKhr = 1000000000,
	VkErrorNativeWindowInUseKhr = 1000000001,
	VkSuboptimalKhr = 1000001003,
	VkErrorOutOfDateKhr = 1000001004,
	VkErrorIncompatibleDisplayKhr = 1000003001,
	VkErrorValidationFailedExt = 1000011001,
	VkErrorInvalidShaderNv = 1000012000,
	VkErrorOutOfPoolMemory = 1000069000,
	VkErrorInvalidExternalHandle = 1000072003,
	VkErrorInvalidDrmFormatModifierPlaneLayoutExt = 1000158000,
	VkErrorFragmentation = 1000161000,
	VkErrorNotPermittedExt = 1000174001,
	VkErrorFullScreenExclusiveModeLostExt = 1000255000,
	VkErrorInvalidOpaqueCaptureAddress = 1000257000,
	VkThreadIdleKhr = 1000268000,
	VkThreadDoneKhr = 1000268001,
	VkOperationDeferredKhr = 1000268002,
	VkOperationNotDeferredKhr = 1000268003,
	VkPipelineCompileRequiredExt = 1000297000
}

DeviceQueueCreateFlags::enum u32 {
	ProtectedBit = 0x1
}

ValidationCacheHeaderVersionEXT::enum u32 {
	OneExt = 1
}

ShaderStageFlags::enum u32 {
	VertexBit = 0x1,
	TessellationControlBit = 0x2,
	TessellationEvaluationBit = 0x4,
	GeometryBit = 0x8,
	FragmentBit = 0x10,
	AllGraphics = 0x1F,
	ComputeBit = 0x20,
	TaskBitNv = 0x40,
	MeshBitNv = 0x80,
	RaygenBitKhr = 0x100,
	AnyHitBitKhr = 0x200,
	ClosestHitBitKhr = 0x400,
	MissBitKhr = 0x800,
	IntersectionBitKhr = 0x1000,
	CallableBitKhr = 0x2000,
	All = 0x7FFFFFFF
}

DeviceMemoryReportEventTypeEXT::enum u32 {
	AllocateExt = 0,
	FreeExt = 1,
	ImportExt = 2,
	UnimportExt = 3,
	AllocationFailedExt = 4
}

ImageViewType::enum u32 {
	_1D = 0,
	_2D = 1,
	_3D = 2,
	Cube = 3,
	_1DArray = 4,
	_2DArray = 5,
	CubeArray = 6
}

DiscardRectangleModeEXT::enum u32 {
	InclusiveExt = 0,
	ExclusiveExt = 1
}

PipelineCacheHeaderVersion::enum u32 {
	One = 1
}

IndirectCommandsLayoutUsageFlagsNV::enum u32 {
	ExplicitPreprocessBitNv = 0x1,
	IndexedSequencesBitNv = 0x2,
	UnorderedSequencesBitNv = 0x4
}

PolygonMode::enum u32 {
	Fill = 0,
	Line = 1,
	Point = 2,
	FillRectangleNv = 1000153000
}

Format::enum u32 {
	Undefined = 0,
	R4G4UnormPack8 = 1,
	R4G4B4A4UnormPack16 = 2,
	B4G4R4A4UnormPack16 = 3,
	R5G6B5UnormPack16 = 4,
	B5G6R5UnormPack16 = 5,
	R5G5B5A1UnormPack16 = 6,
	B5G5R5A1UnormPack16 = 7,
	A1R5G5B5UnormPack16 = 8,
	R8Unorm = 9,
	R8Snorm = 10,
	R8Uscaled = 11,
	R8Sscaled = 12,
	R8Uint = 13,
	R8Sint = 14,
	R8Srgb = 15,
	R8G8Unorm = 16,
	R8G8Snorm = 17,
	R8G8Uscaled = 18,
	R8G8Sscaled = 19,
	R8G8Uint = 20,
	R8G8Sint = 21,
	R8G8Srgb = 22,
	R8G8B8Unorm = 23,
	R8G8B8Snorm = 24,
	R8G8B8Uscaled = 25,
	R8G8B8Sscaled = 26,
	R8G8B8Uint = 27,
	R8G8B8Sint = 28,
	R8G8B8Srgb = 29,
	B8G8R8Unorm = 30,
	B8G8R8Snorm = 31,
	B8G8R8Uscaled = 32,
	B8G8R8Sscaled = 33,
	B8G8R8Uint = 34,
	B8G8R8Sint = 35,
	B8G8R8Srgb = 36,
	R8G8B8A8Unorm = 37,
	R8G8B8A8Snorm = 38,
	R8G8B8A8Uscaled = 39,
	R8G8B8A8Sscaled = 40,
	R8G8B8A8Uint = 41,
	R8G8B8A8Sint = 42,
	R8G8B8A8Srgb = 43,
	B8G8R8A8Unorm = 44,
	B8G8R8A8Snorm = 45,
	B8G8R8A8Uscaled = 46,
	B8G8R8A8Sscaled = 47,
	B8G8R8A8Uint = 48,
	B8G8R8A8Sint = 49,
	B8G8R8A8Srgb = 50,
	A8B8G8R8UnormPack32 = 51,
	A8B8G8R8SnormPack32 = 52,
	A8B8G8R8UscaledPack32 = 53,
	A8B8G8R8SscaledPack32 = 54,
	A8B8G8R8UintPack32 = 55,
	A8B8G8R8SintPack32 = 56,
	A8B8G8R8SrgbPack32 = 57,
	A2R10G10B10UnormPack32 = 58,
	A2R10G10B10SnormPack32 = 59,
	A2R10G10B10UscaledPack32 = 60,
	A2R10G10B10SscaledPack32 = 61,
	A2R10G10B10UintPack32 = 62,
	A2R10G10B10SintPack32 = 63,
	A2B10G10R10UnormPack32 = 64,
	A2B10G10R10SnormPack32 = 65,
	A2B10G10R10UscaledPack32 = 66,
	A2B10G10R10SscaledPack32 = 67,
	A2B10G10R10UintPack32 = 68,
	A2B10G10R10SintPack32 = 69,
	R16Unorm = 70,
	R16Snorm = 71,
	R16Uscaled = 72,
	R16Sscaled = 73,
	R16Uint = 74,
	R16Sint = 75,
	R16Sfloat = 76,
	R16G16Unorm = 77,
	R16G16Snorm = 78,
	R16G16Uscaled = 79,
	R16G16Sscaled = 80,
	R16G16Uint = 81,
	R16G16Sint = 82,
	R16G16Sfloat = 83,
	R16G16B16Unorm = 84,
	R16G16B16Snorm = 85,
	R16G16B16Uscaled = 86,
	R16G16B16Sscaled = 87,
	R16G16B16Uint = 88,
	R16G16B16Sint = 89,
	R16G16B16Sfloat = 90,
	R16G16B16A16Unorm = 91,
	R16G16B16A16Snorm = 92,
	R16G16B16A16Uscaled = 93,
	R16G16B16A16Sscaled = 94,
	R16G16B16A16Uint = 95,
	R16G16B16A16Sint = 96,
	R16G16B16A16Sfloat = 97,
	R32Uint = 98,
	R32Sint = 99,
	R32Sfloat = 100,
	R32G32Uint = 101,
	R32G32Sint = 102,
	R32G32Sfloat = 103,
	R32G32B32Uint = 104,
	R32G32B32Sint = 105,
	R32G32B32Sfloat = 106,
	R32G32B32A32Uint = 107,
	R32G32B32A32Sint = 108,
	R32G32B32A32Sfloat = 109,
	R64Uint = 110,
	R64Sint = 111,
	R64Sfloat = 112,
	R64G64Uint = 113,
	R64G64Sint = 114,
	R64G64Sfloat = 115,
	R64G64B64Uint = 116,
	R64G64B64Sint = 117,
	R64G64B64Sfloat = 118,
	R64G64B64A64Uint = 119,
	R64G64B64A64Sint = 120,
	R64G64B64A64Sfloat = 121,
	B10G11R11UfloatPack32 = 122,
	E5B9G9R9UfloatPack32 = 123,
	D16Unorm = 124,
	X8D24UnormPack32 = 125,
	D32Sfloat = 126,
	S8Uint = 127,
	D16UnormS8Uint = 128,
	D24UnormS8Uint = 129,
	D32SfloatS8Uint = 130,
	Bc1RgbUnormBlock = 131,
	Bc1RgbSrgbBlock = 132,
	Bc1RgbaUnormBlock = 133,
	Bc1RgbaSrgbBlock = 134,
	Bc2UnormBlock = 135,
	Bc2SrgbBlock = 136,
	Bc3UnormBlock = 137,
	Bc3SrgbBlock = 138,
	Bc4UnormBlock = 139,
	Bc4SnormBlock = 140,
	Bc5UnormBlock = 141,
	Bc5SnormBlock = 142,
	Bc6HUfloatBlock = 143,
	Bc6HSfloatBlock = 144,
	Bc7UnormBlock = 145,
	Bc7SrgbBlock = 146,
	Etc2R8G8B8UnormBlock = 147,
	Etc2R8G8B8SrgbBlock = 148,
	Etc2R8G8B8A1UnormBlock = 149,
	Etc2R8G8B8A1SrgbBlock = 150,
	Etc2R8G8B8A8UnormBlock = 151,
	Etc2R8G8B8A8SrgbBlock = 152,
	EacR11UnormBlock = 153,
	EacR11SnormBlock = 154,
	EacR11G11UnormBlock = 155,
	EacR11G11SnormBlock = 156,
	Astc4X4UnormBlock = 157,
	Astc4X4SrgbBlock = 158,
	Astc5X4UnormBlock = 159,
	Astc5X4SrgbBlock = 160,
	Astc5X5UnormBlock = 161,
	Astc5X5SrgbBlock = 162,
	Astc6X5UnormBlock = 163,
	Astc6X5SrgbBlock = 164,
	Astc6X6UnormBlock = 165,
	Astc6X6SrgbBlock = 166,
	Astc8X5UnormBlock = 167,
	Astc8X5SrgbBlock = 168,
	Astc8X6UnormBlock = 169,
	Astc8X6SrgbBlock = 170,
	Astc8X8UnormBlock = 171,
	Astc8X8SrgbBlock = 172,
	Astc10X5UnormBlock = 173,
	Astc10X5SrgbBlock = 174,
	Astc10X6UnormBlock = 175,
	Astc10X6SrgbBlock = 176,
	Astc10X8UnormBlock = 177,
	Astc10X8SrgbBlock = 178,
	Astc10X10UnormBlock = 179,
	Astc10X10SrgbBlock = 180,
	Astc12X10UnormBlock = 181,
	Astc12X10SrgbBlock = 182,
	Astc12X12UnormBlock = 183,
	Astc12X12SrgbBlock = 184,
	Pvrtc12BppUnormBlockImg = 1000054000,
	Pvrtc14BppUnormBlockImg = 1000054001,
	Pvrtc22BppUnormBlockImg = 1000054002,
	Pvrtc24BppUnormBlockImg = 1000054003,
	Pvrtc12BppSrgbBlockImg = 1000054004,
	Pvrtc14BppSrgbBlockImg = 1000054005,
	Pvrtc22BppSrgbBlockImg = 1000054006,
	Pvrtc24BppSrgbBlockImg = 1000054007,
	Astc4X4SfloatBlockExt = 1000066000,
	Astc5X4SfloatBlockExt = 1000066001,
	Astc5X5SfloatBlockExt = 1000066002,
	Astc6X5SfloatBlockExt = 1000066003,
	Astc6X6SfloatBlockExt = 1000066004,
	Astc8X5SfloatBlockExt = 1000066005,
	Astc8X6SfloatBlockExt = 1000066006,
	Astc8X8SfloatBlockExt = 1000066007,
	Astc10X5SfloatBlockExt = 1000066008,
	Astc10X6SfloatBlockExt = 1000066009,
	Astc10X8SfloatBlockExt = 1000066010,
	Astc10X10SfloatBlockExt = 1000066011,
	Astc12X10SfloatBlockExt = 1000066012,
	Astc12X12SfloatBlockExt = 1000066013,
	G8B8G8R8422Unorm = 1000156000,
	B8G8R8G8422Unorm = 1000156001,
	G8B8R83Plane420Unorm = 1000156002,
	G8B8R82Plane420Unorm = 1000156003,
	G8B8R83Plane422Unorm = 1000156004,
	G8B8R82Plane422Unorm = 1000156005,
	G8B8R83Plane444Unorm = 1000156006,
	R10X6UnormPack16 = 1000156007,
	R10X6G10X6Unorm2Pack16 = 1000156008,
	R10X6G10X6B10X6A10X6Unorm4Pack16 = 1000156009,
	G10X6B10X6G10X6R10X6422Unorm4Pack16 = 1000156010,
	B10X6G10X6R10X6G10X6422Unorm4Pack16 = 1000156011,
	G10X6B10X6R10X63Plane420Unorm3Pack16 = 1000156012,
	G10X6B10X6R10X62Plane420Unorm3Pack16 = 1000156013,
	G10X6B10X6R10X63Plane422Unorm3Pack16 = 1000156014,
	G10X6B10X6R10X62Plane422Unorm3Pack16 = 1000156015,
	G10X6B10X6R10X63Plane444Unorm3Pack16 = 1000156016,
	R12X4UnormPack16 = 1000156017,
	R12X4G12X4Unorm2Pack16 = 1000156018,
	R12X4G12X4B12X4A12X4Unorm4Pack16 = 1000156019,
	G12X4B12X4G12X4R12X4422Unorm4Pack16 = 1000156020,
	B12X4G12X4R12X4G12X4422Unorm4Pack16 = 1000156021,
	G12X4B12X4R12X43Plane420Unorm3Pack16 = 1000156022,
	G12X4B12X4R12X42Plane420Unorm3Pack16 = 1000156023,
	G12X4B12X4R12X43Plane422Unorm3Pack16 = 1000156024,
	G12X4B12X4R12X42Plane422Unorm3Pack16 = 1000156025,
	G12X4B12X4R12X43Plane444Unorm3Pack16 = 1000156026,
	G16B16G16R16422Unorm = 1000156027,
	B16G16R16G16422Unorm = 1000156028,
	G16B16R163Plane420Unorm = 1000156029,
	G16B16R162Plane420Unorm = 1000156030,
	G16B16R163Plane422Unorm = 1000156031,
	G16B16R162Plane422Unorm = 1000156032,
	G16B16R163Plane444Unorm = 1000156033,
	A4R4G4B4UnormPack16Ext = 1000340000,
	A4B4G4R4UnormPack16Ext = 1000340001
}

IndexType::enum u32 {
	Uint16 = 0,
	Uint32 = 1,
	NoneKhr = 1000150000,
	Uint8Ext = 1000265000
}

DeviceEventTypeEXT::enum u32 {
	DisplayHotplugExt = 0
}

CoverageModulationModeNV::enum u32 {
	NoneNv = 0,
	RgbNv = 1,
	AlphaNv = 2,
	RgbaNv = 3
}

GeometryFlagsKHR::enum u32 {
	OpaqueBitKhr = 0x1,
	NoDuplicateAnyHitInvocationBitKhr = 0x2
}

ScopeNV::enum u32 {
	DeviceNv = 1,
	WorkgroupNv = 2,
	SubgroupNv = 3,
	QueueFamilyNv = 5
}

FenceCreateFlags::enum u32 {
	SignaledBit = 0x1
}

AccelerationStructureBuildTypeKHR::enum u32 {
	HostKhr = 0,
	DeviceKhr = 1,
	HostOrDeviceKhr = 2
}

FullScreenExclusiveEXT::enum u32 {
	DefaultExt = 0,
	AllowedExt = 1,
	DisallowedExt = 2,
	ApplicationControlledExt = 3
}

PipelineCompilerControlFlagsAMD::enum u32 {
	__
}

IndirectCommandsTokenTypeNV::enum u32 {
	ShaderGroupNv = 0,
	StateFlagsNv = 1,
	IndexBufferNv = 2,
	VertexBufferNv = 3,
	PushConstantNv = 4,
	DrawIndexedNv = 5,
	DrawNv = 6,
	DrawTasksNv = 7
}

ShaderModuleCreateFlags::enum u32 {
	__
}

FragmentShadingRateNV::enum u32 {
	_1InvocationPerPixelNv = 0,
	_1InvocationPer1X2PixelsNv = 1,
	_1InvocationPer2X1PixelsNv = 4,
	_1InvocationPer2X2PixelsNv = 5,
	_1InvocationPer2X4PixelsNv = 6,
	_1InvocationPer4X2PixelsNv = 9,
	_1InvocationPer4X4PixelsNv = 10,
	_2InvocationsPerPixelNv = 11,
	_4InvocationsPerPixelNv = 12,
	_8InvocationsPerPixelNv = 13,
	_16InvocationsPerPixelNv = 14,
	NoInvocationsNv = 15
}

AccessFlags2KHR::enum u32 {
	NoneKhr = 0x0,
	IndirectCommandReadBitKhr = 0x1,
	IndexReadBitKhr = 0x2,
	VertexAttributeReadBitKhr = 0x4,
	UniformReadBitKhr = 0x8,
	InputAttachmentReadBitKhr = 0x10,
	ShaderReadBitKhr = 0x20,
	ShaderWriteBitKhr = 0x40,
	ColorAttachmentReadBitKhr = 0x80,
	ColorAttachmentWriteBitKhr = 0x100,
	DepthStencilAttachmentReadBitKhr = 0x200,
	DepthStencilAttachmentWriteBitKhr = 0x400,
	TransferReadBitKhr = 0x800,
	TransferWriteBitKhr = 0x1000,
	HostReadBitKhr = 0x2000,
	HostWriteBitKhr = 0x4000,
	MemoryReadBitKhr = 0x8000,
	MemoryWriteBitKhr = 0x10000,
	CommandPreprocessReadBitNv = 0x20000,
	CommandPreprocessWriteBitNv = 0x40000,
	ColorAttachmentReadNoncoherentBitExt = 0x80000,
	ConditionalRenderingReadBitExt = 0x100000,
	AccelerationStructureReadBitKhr = 0x200000,
	AccelerationStructureWriteBitKhr = 0x400000,
	FragmentShadingRateAttachmentReadBitKhr = 0x800000,
	FragmentDensityMapReadBitExt = 0x1000000,
	TransformFeedbackWriteBitExt = 0x2000000,
	TransformFeedbackCounterReadBitExt = 0x4000000,
	TransformFeedbackCounterWriteBitExt = 0x8000000,
	// ShaderSampledReadBitKhr = 0x100000000,
	// ShaderStorageReadBitKhr = 0x200000000,
	// ShaderStorageWriteBitKhr = 0x400000000
}

RenderPassCreateFlags::enum u32 {
	TransformBitQcom = 0x2
}

BuildAccelerationStructureModeKHR::enum u32 {
	BuildKhr = 0,
	UpdateKhr = 1
}

PipelineShaderStageCreateFlags::enum u32 {
	AllowVaryingSubgroupSizeBitExt = 0x1,
	RequireFullSubgroupsBitExt = 0x2
}

ImageType::enum u32 {
	_1D = 0,
	_2D = 1,
	_3D = 2
}

StructureType::enum u32 {
	ApplicationInfo = 0,
	InstanceCreateInfo = 1,
	DeviceQueueCreateInfo = 2,
	DeviceCreateInfo = 3,
	SubmitInfo = 4,
	MemoryAllocateInfo = 5,
	MappedMemoryRange = 6,
	BindSparseInfo = 7,
	FenceCreateInfo = 8,
	SemaphoreCreateInfo = 9,
	EventCreateInfo = 10,
	QueryPoolCreateInfo = 11,
	BufferCreateInfo = 12,
	BufferViewCreateInfo = 13,
	ImageCreateInfo = 14,
	ImageViewCreateInfo = 15,
	ShaderModuleCreateInfo = 16,
	PipelineCacheCreateInfo = 17,
	PipelineShaderStageCreateInfo = 18,
	PipelineVertexInputStateCreateInfo = 19,
	PipelineInputAssemblyStateCreateInfo = 20,
	PipelineTessellationStateCreateInfo = 21,
	PipelineViewportStateCreateInfo = 22,
	PipelineRasterizationStateCreateInfo = 23,
	PipelineMultisampleStateCreateInfo = 24,
	PipelineDepthStencilStateCreateInfo = 25,
	PipelineColorBlendStateCreateInfo = 26,
	PipelineDynamicStateCreateInfo = 27,
	GraphicsPipelineCreateInfo = 28,
	ComputePipelineCreateInfo = 29,
	PipelineLayoutCreateInfo = 30,
	SamplerCreateInfo = 31,
	DescriptorSetLayoutCreateInfo = 32,
	DescriptorPoolCreateInfo = 33,
	DescriptorSetAllocateInfo = 34,
	WriteDescriptorSet = 35,
	CopyDescriptorSet = 36,
	FramebufferCreateInfo = 37,
	RenderPassCreateInfo = 38,
	CommandPoolCreateInfo = 39,
	CommandBufferAllocateInfo = 40,
	CommandBufferInheritanceInfo = 41,
	CommandBufferBeginInfo = 42,
	RenderPassBeginInfo = 43,
	BufferMemoryBarrier = 44,
	ImageMemoryBarrier = 45,
	MemoryBarrier = 46,
	LoaderInstanceCreateInfo = 47,
	LoaderDeviceCreateInfo = 48,
	PhysicalDeviceVulkan11Features = 49,
	PhysicalDeviceVulkan11Properties = 50,
	PhysicalDeviceVulkan12Features = 51,
	PhysicalDeviceVulkan12Properties = 52,
	SwapchainCreateInfoKhr = 1000001000,
	PresentInfoKhr = 1000001001,
	DisplayModeCreateInfoKhr = 1000002000,
	DisplaySurfaceCreateInfoKhr = 1000002001,
	DisplayPresentInfoKhr = 1000003000,
	XlibSurfaceCreateInfoKhr = 1000004000,
	XcbSurfaceCreateInfoKhr = 1000005000,
	WaylandSurfaceCreateInfoKhr = 1000006000,
	AndroidSurfaceCreateInfoKhr = 1000008000,
	Win32SurfaceCreateInfoKhr = 1000009000,
	DebugReportCallbackCreateInfoExt = 1000011000,
	PipelineRasterizationStateRasterizationOrderAmd = 1000018000,
	DebugMarkerObjectNameInfoExt = 1000022000,
	DebugMarkerObjectTagInfoExt = 1000022001,
	DebugMarkerMarkerInfoExt = 1000022002,
	DedicatedAllocationImageCreateInfoNv = 1000026000,
	DedicatedAllocationBufferCreateInfoNv = 1000026001,
	DedicatedAllocationMemoryAllocateInfoNv = 1000026002,
	PhysicalDeviceTransformFeedbackFeaturesExt = 1000028000,
	PhysicalDeviceTransformFeedbackPropertiesExt = 1000028001,
	PipelineRasterizationStateStreamCreateInfoExt = 1000028002,
	ImageViewHandleInfoNvx = 1000030000,
	ImageViewAddressPropertiesNvx = 1000030001,
	TextureLodGatherFormatPropertiesAmd = 1000041000,
	StreamDescriptorSurfaceCreateInfoGgp = 1000049000,
	PhysicalDeviceCornerSampledImageFeaturesNv = 1000050000,
	RenderPassMultiviewCreateInfo = 1000053000,
	PhysicalDeviceMultiviewFeatures = 1000053001,
	PhysicalDeviceMultiviewProperties = 1000053002,
	ExternalMemoryImageCreateInfoNv = 1000056000,
	ExportMemoryAllocateInfoNv = 1000056001,
	ImportMemoryWin32HandleInfoNv = 1000057000,
	ExportMemoryWin32HandleInfoNv = 1000057001,
	Win32KeyedMutexAcquireReleaseInfoNv = 1000058000,
	PhysicalDeviceFeatures2 = 1000059000,
	PhysicalDeviceProperties2 = 1000059001,
	FormatProperties2 = 1000059002,
	ImageFormatProperties2 = 1000059003,
	PhysicalDeviceImageFormatInfo2 = 1000059004,
	QueueFamilyProperties2 = 1000059005,
	PhysicalDeviceMemoryProperties2 = 1000059006,
	SparseImageFormatProperties2 = 1000059007,
	PhysicalDeviceSparseImageFormatInfo2 = 1000059008,
	MemoryAllocateFlagsInfo = 1000060000,
	DeviceGroupRenderPassBeginInfo = 1000060003,
	DeviceGroupCommandBufferBeginInfo = 1000060004,
	DeviceGroupSubmitInfo = 1000060005,
	DeviceGroupBindSparseInfo = 1000060006,
	DeviceGroupPresentCapabilitiesKhr = 1000060007,
	ImageSwapchainCreateInfoKhr = 1000060008,
	BindImageMemorySwapchainInfoKhr = 1000060009,
	AcquireNextImageInfoKhr = 1000060010,
	DeviceGroupPresentInfoKhr = 1000060011,
	DeviceGroupSwapchainCreateInfoKhr = 1000060012,
	BindBufferMemoryDeviceGroupInfo = 1000060013,
	BindImageMemoryDeviceGroupInfo = 1000060014,
	ValidationFlagsExt = 1000061000,
	ViSurfaceCreateInfoNn = 1000062000,
	PhysicalDeviceShaderDrawParametersFeatures = 1000063000,
	PhysicalDeviceTextureCompressionAstcHdrFeaturesExt = 1000066000,
	ImageViewAstcDecodeModeExt = 1000067000,
	PhysicalDeviceAstcDecodeFeaturesExt = 1000067001,
	PhysicalDeviceGroupProperties = 1000070000,
	DeviceGroupDeviceCreateInfo = 1000070001,
	PhysicalDeviceExternalImageFormatInfo = 1000071000,
	ExternalImageFormatProperties = 1000071001,
	PhysicalDeviceExternalBufferInfo = 1000071002,
	ExternalBufferProperties = 1000071003,
	PhysicalDeviceIdProperties = 1000071004,
	ExternalMemoryBufferCreateInfo = 1000072000,
	ExternalMemoryImageCreateInfo = 1000072001,
	ExportMemoryAllocateInfo = 1000072002,
	ImportMemoryWin32HandleInfoKhr = 1000073000,
	ExportMemoryWin32HandleInfoKhr = 1000073001,
	MemoryWin32HandlePropertiesKhr = 1000073002,
	MemoryGetWin32HandleInfoKhr = 1000073003,
	ImportMemoryFdInfoKhr = 1000074000,
	MemoryFdPropertiesKhr = 1000074001,
	MemoryGetFdInfoKhr = 1000074002,
	Win32KeyedMutexAcquireReleaseInfoKhr = 1000075000,
	PhysicalDeviceExternalSemaphoreInfo = 1000076000,
	ExternalSemaphoreProperties = 1000076001,
	ExportSemaphoreCreateInfo = 1000077000,
	ImportSemaphoreWin32HandleInfoKhr = 1000078000,
	ExportSemaphoreWin32HandleInfoKhr = 1000078001,
	D3D12FenceSubmitInfoKhr = 1000078002,
	SemaphoreGetWin32HandleInfoKhr = 1000078003,
	ImportSemaphoreFdInfoKhr = 1000079000,
	SemaphoreGetFdInfoKhr = 1000079001,
	PhysicalDevicePushDescriptorPropertiesKhr = 1000080000,
	CommandBufferInheritanceConditionalRenderingInfoExt = 1000081000,
	PhysicalDeviceConditionalRenderingFeaturesExt = 1000081001,
	ConditionalRenderingBeginInfoExt = 1000081002,
	PhysicalDeviceShaderFloat16Int8Features = 1000082000,
	PhysicalDevice16BitStorageFeatures = 1000083000,
	PresentRegionsKhr = 1000084000,
	DescriptorUpdateTemplateCreateInfo = 1000085000,
	PipelineViewportWScalingStateCreateInfoNv = 1000087000,
	SurfaceCapabilities2Ext = 1000090000,
	DisplayPowerInfoExt = 1000091000,
	DeviceEventInfoExt = 1000091001,
	DisplayEventInfoExt = 1000091002,
	SwapchainCounterCreateInfoExt = 1000091003,
	PresentTimesInfoGoogle = 1000092000,
	PhysicalDeviceSubgroupProperties = 1000094000,
	PhysicalDeviceMultiviewPerViewAttributesPropertiesNvx = 1000097000,
	PipelineViewportSwizzleStateCreateInfoNv = 1000098000,
	PhysicalDeviceDiscardRectanglePropertiesExt = 1000099000,
	PipelineDiscardRectangleStateCreateInfoExt = 1000099001,
	PhysicalDeviceConservativeRasterizationPropertiesExt = 1000101000,
	PipelineRasterizationConservativeStateCreateInfoExt = 1000101001,
	PhysicalDeviceDepthClipEnableFeaturesExt = 1000102000,
	PipelineRasterizationDepthClipStateCreateInfoExt = 1000102001,
	HdrMetadataExt = 1000105000,
	PhysicalDeviceImagelessFramebufferFeatures = 1000108000,
	FramebufferAttachmentsCreateInfo = 1000108001,
	FramebufferAttachmentImageInfo = 1000108002,
	RenderPassAttachmentBeginInfo = 1000108003,
	AttachmentDescription2 = 1000109000,
	AttachmentReference2 = 1000109001,
	SubpassDescription2 = 1000109002,
	SubpassDependency2 = 1000109003,
	RenderPassCreateInfo2 = 1000109004,
	SubpassBeginInfo = 1000109005,
	SubpassEndInfo = 1000109006,
	SharedPresentSurfaceCapabilitiesKhr = 1000111000,
	PhysicalDeviceExternalFenceInfo = 1000112000,
	ExternalFenceProperties = 1000112001,
	ExportFenceCreateInfo = 1000113000,
	ImportFenceWin32HandleInfoKhr = 1000114000,
	ExportFenceWin32HandleInfoKhr = 1000114001,
	FenceGetWin32HandleInfoKhr = 1000114002,
	ImportFenceFdInfoKhr = 1000115000,
	FenceGetFdInfoKhr = 1000115001,
	PhysicalDevicePerformanceQueryFeaturesKhr = 1000116000,
	PhysicalDevicePerformanceQueryPropertiesKhr = 1000116001,
	QueryPoolPerformanceCreateInfoKhr = 1000116002,
	PerformanceQuerySubmitInfoKhr = 1000116003,
	AcquireProfilingLockInfoKhr = 1000116004,
	PerformanceCounterKhr = 1000116005,
	PerformanceCounterDescriptionKhr = 1000116006,
	PhysicalDevicePointClippingProperties = 1000117000,
	RenderPassInputAttachmentAspectCreateInfo = 1000117001,
	ImageViewUsageCreateInfo = 1000117002,
	PipelineTessellationDomainOriginStateCreateInfo = 1000117003,
	PhysicalDeviceSurfaceInfo2Khr = 1000119000,
	SurfaceCapabilities2Khr = 1000119001,
	SurfaceFormat2Khr = 1000119002,
	PhysicalDeviceVariablePointersFeatures = 1000120000,
	DisplayProperties2Khr = 1000121000,
	DisplayPlaneProperties2Khr = 1000121001,
	DisplayModeProperties2Khr = 1000121002,
	DisplayPlaneInfo2Khr = 1000121003,
	DisplayPlaneCapabilities2Khr = 1000121004,
	IosSurfaceCreateInfoMvk = 1000122000,
	MacosSurfaceCreateInfoMvk = 1000123000,
	MemoryDedicatedRequirements = 1000127000,
	MemoryDedicatedAllocateInfo = 1000127001,
	DebugUtilsObjectNameInfoExt = 1000128000,
	DebugUtilsObjectTagInfoExt = 1000128001,
	DebugUtilsLabelExt = 1000128002,
	DebugUtilsMessengerCallbackDataExt = 1000128003,
	DebugUtilsMessengerCreateInfoExt = 1000128004,
	AndroidHardwareBufferUsageAndroid = 1000129000,
	AndroidHardwareBufferPropertiesAndroid = 1000129001,
	AndroidHardwareBufferFormatPropertiesAndroid = 1000129002,
	ImportAndroidHardwareBufferInfoAndroid = 1000129003,
	MemoryGetAndroidHardwareBufferInfoAndroid = 1000129004,
	ExternalFormatAndroid = 1000129005,
	PhysicalDeviceSamplerFilterMinmaxProperties = 1000130000,
	SamplerReductionModeCreateInfo = 1000130001,
	PhysicalDeviceInlineUniformBlockFeaturesExt = 1000138000,
	PhysicalDeviceInlineUniformBlockPropertiesExt = 1000138001,
	WriteDescriptorSetInlineUniformBlockExt = 1000138002,
	DescriptorPoolInlineUniformBlockCreateInfoExt = 1000138003,
	SampleLocationsInfoExt = 1000143000,
	RenderPassSampleLocationsBeginInfoExt = 1000143001,
	PipelineSampleLocationsStateCreateInfoExt = 1000143002,
	PhysicalDeviceSampleLocationsPropertiesExt = 1000143003,
	MultisamplePropertiesExt = 1000143004,
	ProtectedSubmitInfo = 1000145000,
	PhysicalDeviceProtectedMemoryFeatures = 1000145001,
	PhysicalDeviceProtectedMemoryProperties = 1000145002,
	DeviceQueueInfo2 = 1000145003,
	BufferMemoryRequirementsInfo2 = 1000146000,
	ImageMemoryRequirementsInfo2 = 1000146001,
	ImageSparseMemoryRequirementsInfo2 = 1000146002,
	MemoryRequirements2 = 1000146003,
	SparseImageMemoryRequirements2 = 1000146004,
	ImageFormatListCreateInfo = 1000147000,
	PhysicalDeviceBlendOperationAdvancedFeaturesExt = 1000148000,
	PhysicalDeviceBlendOperationAdvancedPropertiesExt = 1000148001,
	PipelineColorBlendAdvancedStateCreateInfoExt = 1000148002,
	PipelineCoverageToColorStateCreateInfoNv = 1000149000,
	AccelerationStructureBuildGeometryInfoKhr = 1000150000,
	AccelerationStructureDeviceAddressInfoKhr = 1000150002,
	AccelerationStructureGeometryAabbsDataKhr = 1000150003,
	AccelerationStructureGeometryInstancesDataKhr = 1000150004,
	AccelerationStructureGeometryTrianglesDataKhr = 1000150005,
	AccelerationStructureGeometryKhr = 1000150006,
	WriteDescriptorSetAccelerationStructureKhr = 1000150007,
	AccelerationStructureVersionInfoKhr = 1000150009,
	CopyAccelerationStructureInfoKhr = 1000150010,
	CopyAccelerationStructureToMemoryInfoKhr = 1000150011,
	CopyMemoryToAccelerationStructureInfoKhr = 1000150012,
	PhysicalDeviceAccelerationStructureFeaturesKhr = 1000150013,
	PhysicalDeviceAccelerationStructurePropertiesKhr = 1000150014,
	AccelerationStructureCreateInfoKhr = 1000150017,
	AccelerationStructureBuildSizesInfoKhr = 1000150020,
	PipelineCoverageModulationStateCreateInfoNv = 1000152000,
	PhysicalDeviceShaderSmBuiltinsFeaturesNv = 1000154000,
	PhysicalDeviceShaderSmBuiltinsPropertiesNv = 1000154001,
	SamplerYcbcrConversionCreateInfo = 1000156000,
	SamplerYcbcrConversionInfo = 1000156001,
	BindImagePlaneMemoryInfo = 1000156002,
	ImagePlaneMemoryRequirementsInfo = 1000156003,
	PhysicalDeviceSamplerYcbcrConversionFeatures = 1000156004,
	SamplerYcbcrConversionImageFormatProperties = 1000156005,
	BindBufferMemoryInfo = 1000157000,
	BindImageMemoryInfo = 1000157001,
	DrmFormatModifierPropertiesListExt = 1000158000,
	PhysicalDeviceImageDrmFormatModifierInfoExt = 1000158002,
	ImageDrmFormatModifierListCreateInfoExt = 1000158003,
	ImageDrmFormatModifierExplicitCreateInfoExt = 1000158004,
	ImageDrmFormatModifierPropertiesExt = 1000158005,
	ValidationCacheCreateInfoExt = 1000160000,
	ShaderModuleValidationCacheCreateInfoExt = 1000160001,
	DescriptorSetLayoutBindingFlagsCreateInfo = 1000161000,
	PhysicalDeviceDescriptorIndexingFeatures = 1000161001,
	PhysicalDeviceDescriptorIndexingProperties = 1000161002,
	DescriptorSetVariableDescriptorCountAllocateInfo = 1000161003,
	DescriptorSetVariableDescriptorCountLayoutSupport = 1000161004,
	PhysicalDevicePortabilitySubsetFeaturesKhr = 1000163000,
	PhysicalDevicePortabilitySubsetPropertiesKhr = 1000163001,
	PipelineViewportShadingRateImageStateCreateInfoNv = 1000164000,
	PhysicalDeviceShadingRateImageFeaturesNv = 1000164001,
	PhysicalDeviceShadingRateImagePropertiesNv = 1000164002,
	PipelineViewportCoarseSampleOrderStateCreateInfoNv = 1000164005,
	RayTracingPipelineCreateInfoNv = 1000165000,
	AccelerationStructureCreateInfoNv = 1000165001,
	GeometryNv = 1000165003,
	GeometryTrianglesNv = 1000165004,
	GeometryAabbNv = 1000165005,
	BindAccelerationStructureMemoryInfoNv = 1000165006,
	WriteDescriptorSetAccelerationStructureNv = 1000165007,
	AccelerationStructureMemoryRequirementsInfoNv = 1000165008,
	PhysicalDeviceRayTracingPropertiesNv = 1000165009,
	RayTracingShaderGroupCreateInfoNv = 1000165011,
	AccelerationStructureInfoNv = 1000165012,
	PhysicalDeviceRepresentativeFragmentTestFeaturesNv = 1000166000,
	PipelineRepresentativeFragmentTestStateCreateInfoNv = 1000166001,
	PhysicalDeviceMaintenance3Properties = 1000168000,
	DescriptorSetLayoutSupport = 1000168001,
	PhysicalDeviceImageViewImageFormatInfoExt = 1000170000,
	FilterCubicImageViewImageFormatPropertiesExt = 1000170001,
	DeviceQueueGlobalPriorityCreateInfoExt = 1000174000,
	PhysicalDeviceShaderSubgroupExtendedTypesFeatures = 1000175000,
	PhysicalDevice8BitStorageFeatures = 1000177000,
	ImportMemoryHostPointerInfoExt = 1000178000,
	MemoryHostPointerPropertiesExt = 1000178001,
	PhysicalDeviceExternalMemoryHostPropertiesExt = 1000178002,
	PhysicalDeviceShaderAtomicInt64Features = 1000180000,
	PhysicalDeviceShaderClockFeaturesKhr = 1000181000,
	PipelineCompilerControlCreateInfoAmd = 1000183000,
	CalibratedTimestampInfoExt = 1000184000,
	PhysicalDeviceShaderCorePropertiesAmd = 1000185000,
	DeviceMemoryOverallocationCreateInfoAmd = 1000189000,
	PhysicalDeviceVertexAttributeDivisorPropertiesExt = 1000190000,
	PipelineVertexInputDivisorStateCreateInfoExt = 1000190001,
	PhysicalDeviceVertexAttributeDivisorFeaturesExt = 1000190002,
	PresentFrameTokenGgp = 1000191000,
	PipelineCreationFeedbackCreateInfoExt = 1000192000,
	PhysicalDeviceDriverProperties = 1000196000,
	PhysicalDeviceFloatControlsProperties = 1000197000,
	PhysicalDeviceDepthStencilResolveProperties = 1000199000,
	SubpassDescriptionDepthStencilResolve = 1000199001,
	PhysicalDeviceComputeShaderDerivativesFeaturesNv = 1000201000,
	PhysicalDeviceMeshShaderFeaturesNv = 1000202000,
	PhysicalDeviceMeshShaderPropertiesNv = 1000202001,
	PhysicalDeviceFragmentShaderBarycentricFeaturesNv = 1000203000,
	PhysicalDeviceShaderImageFootprintFeaturesNv = 1000204000,
	PipelineViewportExclusiveScissorStateCreateInfoNv = 1000205000,
	PhysicalDeviceExclusiveScissorFeaturesNv = 1000205002,
	CheckpointDataNv = 1000206000,
	QueueFamilyCheckpointPropertiesNv = 1000206001,
	PhysicalDeviceTimelineSemaphoreFeatures = 1000207000,
	PhysicalDeviceTimelineSemaphoreProperties = 1000207001,
	SemaphoreTypeCreateInfo = 1000207002,
	TimelineSemaphoreSubmitInfo = 1000207003,
	SemaphoreWaitInfo = 1000207004,
	SemaphoreSignalInfo = 1000207005,
	PhysicalDeviceShaderIntegerFunctions2FeaturesIntel = 1000209000,
	QueryPoolPerformanceQueryCreateInfoIntel = 1000210000,
	InitializePerformanceApiInfoIntel = 1000210001,
	PerformanceMarkerInfoIntel = 1000210002,
	PerformanceStreamMarkerInfoIntel = 1000210003,
	PerformanceOverrideInfoIntel = 1000210004,
	PerformanceConfigurationAcquireInfoIntel = 1000210005,
	PhysicalDeviceVulkanMemoryModelFeatures = 1000211000,
	PhysicalDevicePciBusInfoPropertiesExt = 1000212000,
	DisplayNativeHdrSurfaceCapabilitiesAmd = 1000213000,
	SwapchainDisplayNativeHdrCreateInfoAmd = 1000213001,
	ImagepipeSurfaceCreateInfoFuchsia = 1000214000,
	PhysicalDeviceShaderTerminateInvocationFeaturesKhr = 1000215000,
	MetalSurfaceCreateInfoExt = 1000217000,
	PhysicalDeviceFragmentDensityMapFeaturesExt = 1000218000,
	PhysicalDeviceFragmentDensityMapPropertiesExt = 1000218001,
	RenderPassFragmentDensityMapCreateInfoExt = 1000218002,
	PhysicalDeviceScalarBlockLayoutFeatures = 1000221000,
	PhysicalDeviceSubgroupSizeControlPropertiesExt = 1000225000,
	PipelineShaderStageRequiredSubgroupSizeCreateInfoExt = 1000225001,
	PhysicalDeviceSubgroupSizeControlFeaturesExt = 1000225002,
	FragmentShadingRateAttachmentInfoKhr = 1000226000,
	PipelineFragmentShadingRateStateCreateInfoKhr = 1000226001,
	PhysicalDeviceFragmentShadingRatePropertiesKhr = 1000226002,
	PhysicalDeviceFragmentShadingRateFeaturesKhr = 1000226003,
	PhysicalDeviceFragmentShadingRateKhr = 1000226004,
	PhysicalDeviceShaderCoreProperties2Amd = 1000227000,
	PhysicalDeviceCoherentMemoryFeaturesAmd = 1000229000,
	PhysicalDeviceShaderImageAtomicInt64FeaturesExt = 1000234000,
	PhysicalDeviceMemoryBudgetPropertiesExt = 1000237000,
	PhysicalDeviceMemoryPriorityFeaturesExt = 1000238000,
	MemoryPriorityAllocateInfoExt = 1000238001,
	SurfaceProtectedCapabilitiesKhr = 1000239000,
	PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNv = 1000240000,
	PhysicalDeviceSeparateDepthStencilLayoutsFeatures = 1000241000,
	AttachmentReferenceStencilLayout = 1000241001,
	AttachmentDescriptionStencilLayout = 1000241002,
	PhysicalDeviceBufferDeviceAddressFeaturesExt = 1000244000,
	BufferDeviceAddressInfo = 1000244001,
	BufferDeviceAddressCreateInfoExt = 1000244002,
	PhysicalDeviceToolPropertiesExt = 1000245000,
	ImageStencilUsageCreateInfo = 1000246000,
	ValidationFeaturesExt = 1000247000,
	PhysicalDeviceCooperativeMatrixFeaturesNv = 1000249000,
	CooperativeMatrixPropertiesNv = 1000249001,
	PhysicalDeviceCooperativeMatrixPropertiesNv = 1000249002,
	PhysicalDeviceCoverageReductionModeFeaturesNv = 1000250000,
	PipelineCoverageReductionStateCreateInfoNv = 1000250001,
	FramebufferMixedSamplesCombinationNv = 1000250002,
	PhysicalDeviceFragmentShaderInterlockFeaturesExt = 1000251000,
	PhysicalDeviceYcbcrImageArraysFeaturesExt = 1000252000,
	PhysicalDeviceUniformBufferStandardLayoutFeatures = 1000253000,
	SurfaceFullScreenExclusiveInfoExt = 1000255000,
	SurfaceFullScreenExclusiveWin32InfoExt = 1000255001,
	SurfaceCapabilitiesFullScreenExclusiveExt = 1000255002,
	HeadlessSurfaceCreateInfoExt = 1000256000,
	PhysicalDeviceBufferDeviceAddressFeatures = 1000257000,
	BufferOpaqueCaptureAddressCreateInfo = 1000257002,
	MemoryOpaqueCaptureAddressAllocateInfo = 1000257003,
	DeviceMemoryOpaqueCaptureAddressInfo = 1000257004,
	PhysicalDeviceLineRasterizationFeaturesExt = 1000259000,
	PipelineRasterizationLineStateCreateInfoExt = 1000259001,
	PhysicalDeviceLineRasterizationPropertiesExt = 1000259002,
	PhysicalDeviceShaderAtomicFloatFeaturesExt = 1000260000,
	PhysicalDeviceHostQueryResetFeatures = 1000261000,
	PhysicalDeviceIndexTypeUint8FeaturesExt = 1000265000,
	PhysicalDeviceExtendedDynamicStateFeaturesExt = 1000267000,
	PhysicalDevicePipelineExecutablePropertiesFeaturesKhr = 1000269000,
	PipelineInfoKhr = 1000269001,
	PipelineExecutablePropertiesKhr = 1000269002,
	PipelineExecutableInfoKhr = 1000269003,
	PipelineExecutableStatisticKhr = 1000269004,
	PipelineExecutableInternalRepresentationKhr = 1000269005,
	PhysicalDeviceShaderDemoteToHelperInvocationFeaturesExt = 1000276000,
	PhysicalDeviceDeviceGeneratedCommandsPropertiesNv = 1000277000,
	GraphicsShaderGroupCreateInfoNv = 1000277001,
	GraphicsPipelineShaderGroupsCreateInfoNv = 1000277002,
	IndirectCommandsLayoutTokenNv = 1000277003,
	IndirectCommandsLayoutCreateInfoNv = 1000277004,
	GeneratedCommandsInfoNv = 1000277005,
	GeneratedCommandsMemoryRequirementsInfoNv = 1000277006,
	PhysicalDeviceDeviceGeneratedCommandsFeaturesNv = 1000277007,
	PhysicalDeviceTexelBufferAlignmentFeaturesExt = 1000281000,
	PhysicalDeviceTexelBufferAlignmentPropertiesExt = 1000281001,
	CommandBufferInheritanceRenderPassTransformInfoQcom = 1000282000,
	RenderPassTransformBeginInfoQcom = 1000282001,
	PhysicalDeviceDeviceMemoryReportFeaturesExt = 1000284000,
	DeviceDeviceMemoryReportCreateInfoExt = 1000284001,
	DeviceMemoryReportCallbackDataExt = 1000284002,
	PhysicalDeviceRobustness2FeaturesExt = 1000286000,
	PhysicalDeviceRobustness2PropertiesExt = 1000286001,
	SamplerCustomBorderColorCreateInfoExt = 1000287000,
	PhysicalDeviceCustomBorderColorPropertiesExt = 1000287001,
	PhysicalDeviceCustomBorderColorFeaturesExt = 1000287002,
	PipelineLibraryCreateInfoKhr = 1000290000,
	PhysicalDevicePrivateDataFeaturesExt = 1000295000,
	DevicePrivateDataCreateInfoExt = 1000295001,
	PrivateDataSlotCreateInfoExt = 1000295002,
	PhysicalDevicePipelineCreationCacheControlFeaturesExt = 1000297000,
	PhysicalDeviceDiagnosticsConfigFeaturesNv = 1000300000,
	DeviceDiagnosticsConfigCreateInfoNv = 1000300001,
	MemoryBarrier2Khr = 1000314000,
	BufferMemoryBarrier2Khr = 1000314001,
	ImageMemoryBarrier2Khr = 1000314002,
	DependencyInfoKhr = 1000314003,
	SubmitInfo2Khr = 1000314004,
	SemaphoreSubmitInfoKhr = 1000314005,
	CommandBufferSubmitInfoKhr = 1000314006,
	PhysicalDeviceSynchronization2FeaturesKhr = 1000314007,
	QueueFamilyCheckpointProperties2Nv = 1000314008,
	CheckpointData2Nv = 1000314009,
	PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKhr = 1000325000,
	PhysicalDeviceFragmentShadingRateEnumsPropertiesNv = 1000326000,
	PhysicalDeviceFragmentShadingRateEnumsFeaturesNv = 1000326001,
	PipelineFragmentShadingRateEnumStateCreateInfoNv = 1000326002,
	PhysicalDeviceFragmentDensityMap2FeaturesExt = 1000332000,
	PhysicalDeviceFragmentDensityMap2PropertiesExt = 1000332001,
	CopyCommandTransformInfoQcom = 1000333000,
	PhysicalDeviceImageRobustnessFeaturesExt = 1000335000,
	PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKhr = 1000336000,
	CopyBufferInfo2Khr = 1000337000,
	CopyImageInfo2Khr = 1000337001,
	CopyBufferToImageInfo2Khr = 1000337002,
	CopyImageToBufferInfo2Khr = 1000337003,
	BlitImageInfo2Khr = 1000337004,
	ResolveImageInfo2Khr = 1000337005,
	BufferCopy2Khr = 1000337006,
	ImageCopy2Khr = 1000337007,
	ImageBlit2Khr = 1000337008,
	BufferImageCopy2Khr = 1000337009,
	ImageResolve2Khr = 1000337010,
	PhysicalDevice4444FormatsFeaturesExt = 1000340000,
	DirectfbSurfaceCreateInfoExt = 1000346000,
	PhysicalDeviceRayTracingPipelineFeaturesKhr = 1000347000,
	PhysicalDeviceRayTracingPipelinePropertiesKhr = 1000347001,
	RayTracingPipelineCreateInfoKhr = 1000347015,
	RayTracingShaderGroupCreateInfoKhr = 1000347016,
	RayTracingPipelineInterfaceCreateInfoKhr = 1000347018,
	PhysicalDeviceRayQueryFeaturesKhr = 1000348013,
	PhysicalDeviceMutableDescriptorTypeFeaturesValve = 1000351000,
	MutableDescriptorTypeCreateInfoValve = 1000351002,
	ScreenSurfaceCreateInfoQnx = 1000378000
}

ExternalMemoryHandleTypeFlags::enum u32 {
	OpaqueFdBit = 0x1,
	OpaqueWin32Bit = 0x2,
	OpaqueWin32KmtBit = 0x4,
	D3D11TextureBit = 0x8,
	D3D11TextureKmtBit = 0x10,
	D3D12HeapBit = 0x20,
	D3D12ResourceBit = 0x40,
	HostAllocationBitExt = 0x80,
	HostMappedForeignMemoryBitExt = 0x100,
	DmaBufBitExt = 0x200,
	AndroidHardwareBufferBitAndroid = 0x400
}

RasterizationOrderAMD::enum u32 {
	StrictAmd = 0,
	RelaxedAmd = 1
}

ComponentSwizzle::enum u32 {
	Identity = 0,
	Zero = 1,
	One = 2,
	R = 3,
	G = 4,
	B = 5,
	A = 6
}

DisplayPowerStateEXT::enum u32 {
	OffExt = 0,
	SuspendExt = 1,
	OnExt = 2
}

ImageTiling::enum u32 {
	Optimal = 0,
	Linear = 1,
	DrmFormatModifierExt = 1000158000
}

PeerMemoryFeatureFlags::enum u32 {
	CopySrcBit = 0x1,
	CopyDstBit = 0x2,
	GenericSrcBit = 0x4,
	GenericDstBit = 0x8
}

ObjectType::enum u32 {
	Unknown = 0,
	Instance = 1,
	PhysicalDevice = 2,
	Device = 3,
	Queue = 4,
	Semaphore = 5,
	CommandBuffer = 6,
	Fence = 7,
	DeviceMemory = 8,
	Buffer = 9,
	Image = 10,
	Event = 11,
	QueryPool = 12,
	BufferView = 13,
	ImageView = 14,
	ShaderModule = 15,
	PipelineCache = 16,
	PipelineLayout = 17,
	RenderPass = 18,
	Pipeline = 19,
	DescriptorSetLayout = 20,
	Sampler = 21,
	DescriptorPool = 22,
	DescriptorSet = 23,
	Framebuffer = 24,
	CommandPool = 25,
	SurfaceKhr = 1000000000,
	SwapchainKhr = 1000001000,
	DisplayKhr = 1000002000,
	DisplayModeKhr = 1000002001,
	DebugReportCallbackExt = 1000011000,
	DescriptorUpdateTemplate = 1000085000,
	DebugUtilsMessengerExt = 1000128000,
	AccelerationStructureKhr = 1000150000,
	SamplerYcbcrConversion = 1000156000,
	ValidationCacheExt = 1000160000,
	AccelerationStructureNv = 1000165000,
	PerformanceConfigurationIntel = 1000210000,
	DeferredOperationKhr = 1000268000,
	IndirectCommandsLayoutNv = 1000277000,
	PrivateDataSlotExt = 1000295000
}

ValidationFeatureEnableEXT::enum u32 {
	GpuAssistedExt = 0,
	GpuAssistedReserveBindingSlotExt = 1,
	BestPracticesExt = 2,
	DebugPrintfExt = 3,
	SynchronizationValidationExt = 4
}

CullModeFlags::enum u32 {
	None = 0x0,
	FrontBit = 0x1,
	BackBit = 0x2,
	FrontAndBack = 0x3
}

PhysicalDeviceType::enum u32 {
	Other = 0,
	IntegratedGpu = 1,
	DiscreteGpu = 2,
	VirtualGpu = 3,
	Cpu = 4
}

AccelerationStructureCompatibilityKHR::enum u32 {
	CompatibleKhr = 0,
	IncompatibleKhr = 1
}

DebugReportObjectTypeEXT::enum u32 {
	UnknownExt = 0,
	InstanceExt = 1,
	PhysicalDeviceExt = 2,
	DeviceExt = 3,
	QueueExt = 4,
	SemaphoreExt = 5,
	CommandBufferExt = 6,
	FenceExt = 7,
	DeviceMemoryExt = 8,
	BufferExt = 9,
	ImageExt = 10,
	EventExt = 11,
	QueryPoolExt = 12,
	BufferViewExt = 13,
	ImageViewExt = 14,
	ShaderModuleExt = 15,
	PipelineCacheExt = 16,
	PipelineLayoutExt = 17,
	RenderPassExt = 18,
	PipelineExt = 19,
	DescriptorSetLayoutExt = 20,
	SamplerExt = 21,
	DescriptorPoolExt = 22,
	DescriptorSetExt = 23,
	FramebufferExt = 24,
	CommandPoolExt = 25,
	SurfaceKhrExt = 26,
	SwapchainKhrExt = 27,
	DebugReportCallbackExtExt = 28,
	DisplayKhrExt = 29,
	DisplayModeKhrExt = 30,
	ValidationCacheExtExt = 33,
	DescriptorUpdateTemplateExt = 1000011000,
	AccelerationStructureKhrExt = 1000150000,
	SamplerYcbcrConversionExt = 1000156000,
	AccelerationStructureNvExt = 1000165000
}

CommandBufferResetFlags::enum u32 {
	ReleaseResourcesBit = 0x1
}

ShaderFloatControlsIndependence::enum u32 {
	_32BitOnly = 0,
	All = 1,
	None = 2
}

SamplerYcbcrModelConversion::enum u32 {
	RgbIdentity = 0,
	YcbcrIdentity = 1,
	Ycbcr709 = 2,
	Ycbcr601 = 3,
	Ycbcr2020 = 4
}

AcquireProfilingLockFlagsKHR::enum u32 {
	__
}

SparseMemoryBindFlags::enum u32 {
	MetadataBit = 0x1
}

PerformanceConfigurationTypeINTEL::enum u32 {
	CommandQueueMetricsDiscoveryActivatedIntel = 0
}

MemoryAllocateFlags::enum u32 {
	DeviceMaskBit = 0x1,
	DeviceAddressBit = 0x2,
	DeviceAddressCaptureReplayBit = 0x4
}

AttachmentStoreOp::enum u32 {
	Store = 0,
	DontCare = 1,
	NoneQcom = 1000301000
}

ImageViewCreateFlags::enum u32 {
	FragmentDensityMapDynamicBitExt = 0x1,
	FragmentDensityMapDeferredBitExt = 0x2
}

DependencyFlags::enum u32 {
	ByRegionBit = 0x1,
	ViewLocalBit = 0x2,
	DeviceGroupBit = 0x4
}

FormatFeatureFlags::enum u32 {
	SampledImageBit = 0x1,
	StorageImageBit = 0x2,
	StorageImageAtomicBit = 0x4,
	UniformTexelBufferBit = 0x8,
	StorageTexelBufferBit = 0x10,
	StorageTexelBufferAtomicBit = 0x20,
	VertexBufferBit = 0x40,
	ColorAttachmentBit = 0x80,
	ColorAttachmentBlendBit = 0x100,
	DepthStencilAttachmentBit = 0x200,
	BlitSrcBit = 0x400,
	BlitDstBit = 0x800,
	SampledImageFilterLinearBit = 0x1000,
	SampledImageFilterCubicBitImg = 0x2000,
	TransferSrcBit = 0x4000,
	TransferDstBit = 0x8000,
	SampledImageFilterMinmaxBit = 0x10000,
	MidpointChromaSamplesBit = 0x20000,
	SampledImageYcbcrConversionLinearFilterBit = 0x40000,
	SampledImageYcbcrConversionSeparateReconstructionFilterBit = 0x80000,
	SampledImageYcbcrConversionChromaReconstructionExplicitBit = 0x100000,
	SampledImageYcbcrConversionChromaReconstructionExplicitForceableBit = 0x200000,
	DisjointBit = 0x400000,
	CositedChromaSamplesBit = 0x800000,
	FragmentDensityMapBitExt = 0x1000000,
	AccelerationStructureVertexBufferBitKhr = 0x20000000,
	FragmentShadingRateAttachmentBitKhr = 0x40000000
}

PipelineBindPoint::enum u32 {
	Graphics = 0,
	Compute = 1,
	RayTracingKhr = 1000347000
}

QueueFlags::enum u32 {
	GraphicsBit = 0x1,
	ComputeBit = 0x2,
	TransferBit = 0x4,
	SparseBindingBit = 0x8,
	ProtectedBit = 0x10
}

AccelerationStructureTypeKHR::enum u32 {
	TopLevelKhr = 0,
	BottomLevelKhr = 1,
	GenericKhr = 2
}

Filter::enum u32 {
	Nearest = 0,
	Linear = 1,
	CubicImg = 1000015000
}

DescriptorSetLayoutCreateFlags::enum u32 {
	PushDescriptorBitKhr = 0x1,
	UpdateAfterBindPoolBit = 0x2,
	HostOnlyPoolBitValve = 0x4
}

VertexInputRate::enum u32 {
	Vertex = 0,
	Instance = 1
}

SwapchainCreateFlagsKHR::enum u32 {
	SplitInstanceBindRegionsBitKhr = 0x1,
	ProtectedBitKhr = 0x2,
	MutableFormatBitKhr = 0x4
}

DriverId::enum u32 {
	AmdProprietary = 1,
	AmdOpenSource = 2,
	MesaRadv = 3,
	NvidiaProprietary = 4,
	IntelProprietaryWindows = 5,
	IntelOpenSourceMesa = 6,
	ImaginationProprietary = 7,
	QualcommProprietary = 8,
	ArmProprietary = 9,
	GoogleSwiftshader = 10,
	GgpProprietary = 11,
	BroadcomProprietary = 12,
	MesaLlvmpipe = 13,
	Moltenvk = 14
}

SamplerYcbcrRange::enum u32 {
	ItuFull = 0,
	ItuNarrow = 1
}

PerformanceOverrideTypeINTEL::enum u32 {
	NullHardwareIntel = 0,
	FlushGpuCachesIntel = 1
}

RayTracingShaderGroupTypeKHR::enum u32 {
	GeneralKhr = 0,
	TrianglesHitGroupKhr = 1,
	ProceduralHitGroupKhr = 2
}

DisplayEventTypeEXT::enum u32 {
	FirstPixelOutExt = 0
}

StencilOp::enum u32 {
	Keep = 0,
	Zero = 1,
	Replace = 2,
	IncrementAndClamp = 3,
	DecrementAndClamp = 4,
	Invert = 5,
	IncrementAndWrap = 6,
	DecrementAndWrap = 7
}

QueueGlobalPriorityEXT::enum u32 {
	LowExt = 128,
	MediumExt = 256,
	HighExt = 512,
	RealtimeExt = 1024
}

PipelineCreationFeedbackFlagsEXT::enum u32 {
	ValidBitExt = 0x1,
	ApplicationPipelineCacheHitBitExt = 0x2,
	BasePipelineAccelerationBitExt = 0x4
}

SamplerReductionMode::enum u32 {
	WeightedAverage = 0,
	Min = 1,
	Max = 2
}

DescriptorType::enum u32 {
	Sampler = 0,
	CombinedImageSampler = 1,
	SampledImage = 2,
	StorageImage = 3,
	UniformTexelBuffer = 4,
	StorageTexelBuffer = 5,
	UniformBuffer = 6,
	StorageBuffer = 7,
	UniformBufferDynamic = 8,
	StorageBufferDynamic = 9,
	InputAttachment = 10,
	InlineUniformBlockExt = 1000138000,
	AccelerationStructureKhr = 1000150000,
	AccelerationStructureNv = 1000165000,
	MutableValve = 1000351000
}

ShaderInfoTypeAMD::enum u32 {
	StatisticsAmd = 0,
	BinaryAmd = 1,
	DisassemblyAmd = 2
}

CoarseSampleOrderTypeNV::enum u32 {
	DefaultNv = 0,
	CustomNv = 1,
	PixelMajorNv = 2,
	SampleMajorNv = 3
}

AccelerationStructureCreateFlagsKHR::enum u32 {
	DeviceAddressCaptureReplayBitKhr = 0x1
}

SubmitFlagsKHR::enum u32 {
	ProtectedBitKhr = 0x1
}

CompareOp::enum u32 {
	Never = 0,
	Less = 1,
	Equal = 2,
	LessOrEqual = 3,
	Greater = 4,
	NotEqual = 5,
	GreaterOrEqual = 6,
	Always = 7
}

ExternalMemoryFeatureFlagsNV::enum u32 {
	DedicatedOnlyBitNv = 0x1,
	ExportableBitNv = 0x2,
	ImportableBitNv = 0x4
}

ColorSpaceKHR::enum u32 {
	SrgbNonlinearKhr = 0,
	DisplayP3NonlinearExt = 1000104001,
	ExtendedSrgbLinearExt = 1000104002,
	DisplayP3LinearExt = 1000104003,
	DciP3NonlinearExt = 1000104004,
	Bt709LinearExt = 1000104005,
	Bt709NonlinearExt = 1000104006,
	Bt2020LinearExt = 1000104007,
	Hdr10St2084Ext = 1000104008,
	DolbyvisionExt = 1000104009,
	Hdr10HlgExt = 1000104010,
	AdobergbLinearExt = 1000104011,
	AdobergbNonlinearExt = 1000104012,
	PassThroughExt = 1000104013,
	ExtendedSrgbNonlinearExt = 1000104014,
	DisplayNativeAmd = 1000213000
}

DynamicState::enum u32 {
	Viewport = 0,
	Scissor = 1,
	LineWidth = 2,
	DepthBias = 3,
	BlendConstants = 4,
	DepthBounds = 5,
	StencilCompareMask = 6,
	StencilWriteMask = 7,
	StencilReference = 8,
	ViewportWScalingNv = 1000087000,
	DiscardRectangleExt = 1000099000,
	SampleLocationsExt = 1000143000,
	ViewportShadingRatePaletteNv = 1000164004,
	ViewportCoarseSampleOrderNv = 1000164006,
	ExclusiveScissorNv = 1000205001,
	FragmentShadingRateKhr = 1000226000,
	LineStippleExt = 1000259000,
	CullModeExt = 1000267000,
	FrontFaceExt = 1000267001,
	PrimitiveTopologyExt = 1000267002,
	ViewportWithCountExt = 1000267003,
	ScissorWithCountExt = 1000267004,
	VertexInputBindingStrideExt = 1000267005,
	DepthTestEnableExt = 1000267006,
	DepthWriteEnableExt = 1000267007,
	DepthCompareOpExt = 1000267008,
	DepthBoundsTestEnableExt = 1000267009,
	StencilTestEnableExt = 1000267010,
	StencilOpExt = 1000267011,
	RayTracingPipelineStackSizeKhr = 1000347000
}

PrivateDataSlotCreateFlagsEXT::enum u32 {
	__
}

DeviceGroupPresentModeFlagsKHR::enum u32 {
	LocalBitKhr = 0x1,
	RemoteBitKhr = 0x2,
	SumBitKhr = 0x4,
	LocalMultiDeviceBitKhr = 0x8
}

MemoryPropertyFlags::enum u32 {
	DeviceLocalBit = 0x1,
	HostVisibleBit = 0x2,
	HostCoherentBit = 0x4,
	HostCachedBit = 0x8,
	LazilyAllocatedBit = 0x10,
	ProtectedBit = 0x20,
	DeviceCoherentBitAmd = 0x40,
	DeviceUncachedBitAmd = 0x80
}

SamplerMipmapMode::enum u32 {
	Nearest = 0,
	Linear = 1
}

SubgroupFeatureFlags::enum u32 {
	BasicBit = 0x1,
	VoteBit = 0x2,
	ArithmeticBit = 0x4,
	BallotBit = 0x8,
	ShuffleBit = 0x10,
	ShuffleRelativeBit = 0x20,
	ClusteredBit = 0x40,
	QuadBit = 0x80,
	PartitionedBitNv = 0x100
}

TessellationDomainOrigin::enum u32 {
	UpperLeft = 0,
	LowerLeft = 1
}

ExternalFenceFeatureFlags::enum u32 {
	ExportableBit = 0x1,
	ImportableBit = 0x2
}

DebugReportFlagsEXT::enum u32 {
	InformationBitExt = 0x1,
	WarningBitExt = 0x2,
	PerformanceWarningBitExt = 0x4,
	ErrorBitExt = 0x8,
	DebugBitExt = 0x10
}

CommandPoolCreateFlags::enum u32 {
	TransientBit = 0x1,
	ResetCommandBufferBit = 0x2,
	ProtectedBit = 0x4
}

SurfaceTransformFlagsKHR::enum u32 {
	IdentityBitKhr = 0x1,
	Rotate90BitKhr = 0x2,
	Rotate180BitKhr = 0x4,
	Rotate270BitKhr = 0x8,
	HorizontalMirrorBitKhr = 0x10,
	HorizontalMirrorRotate90BitKhr = 0x20,
	HorizontalMirrorRotate180BitKhr = 0x40,
	HorizontalMirrorRotate270BitKhr = 0x80,
	InheritBitKhr = 0x100
}

TimeDomainEXT::enum u32 {
	DeviceExt = 0,
	ClockMonotonicExt = 1,
	ClockMonotonicRawExt = 2,
	QueryPerformanceCounterExt = 3
}

FramebufferCreateFlags::enum u32 {
	ImagelessBit = 0x1
}

ImageCreateFlags::enum u32 {
	SparseBindingBit = 0x1,
	SparseResidencyBit = 0x2,
	SparseAliasedBit = 0x4,
	MutableFormatBit = 0x8,
	CubeCompatibleBit = 0x10,
	_2DArrayCompatibleBit = 0x20,
	SplitInstanceBindRegionsBit = 0x40,
	BlockTexelViewCompatibleBit = 0x80,
	ExtendedUsageBit = 0x100,
	DisjointBit = 0x200,
	AliasBit = 0x400,
	ProtectedBit = 0x800,
	SampleLocationsCompatibleDepthBitExt = 0x1000,
	CornerSampledBitNv = 0x2000,
	SubsampledBitExt = 0x4000
}

ShadingRatePaletteEntryNV::enum u32 {
	NoInvocationsNv = 0,
	_16InvocationsPerPixelNv = 1,
	_8InvocationsPerPixelNv = 2,
	_4InvocationsPerPixelNv = 3,
	_2InvocationsPerPixelNv = 4,
	_1InvocationPerPixelNv = 5,
	_1InvocationPer2X1PixelsNv = 6,
	_1InvocationPer1X2PixelsNv = 7,
	_1InvocationPer2X2PixelsNv = 8,
	_1InvocationPer4X2PixelsNv = 9,
	_1InvocationPer2X4PixelsNv = 10,
	_1InvocationPer4X4PixelsNv = 11
}

ComponentTypeNV::enum u32 {
	Float16Nv = 0,
	Float32Nv = 1,
	Float64Nv = 2,
	Sint8Nv = 3,
	Sint16Nv = 4,
	Sint32Nv = 5,
	Sint64Nv = 6,
	Uint8Nv = 7,
	Uint16Nv = 8,
	Uint32Nv = 9,
	Uint64Nv = 10
}

CopyAccelerationStructureModeKHR::enum u32 {
	CloneKhr = 0,
	CompactKhr = 1,
	SerializeKhr = 2,
	DeserializeKhr = 3
}

BufferUsageFlags::enum u32 {
	TransferSrcBit = 0x1,
	TransferDstBit = 0x2,
	UniformTexelBufferBit = 0x4,
	StorageTexelBufferBit = 0x8,
	UniformBufferBit = 0x10,
	StorageBufferBit = 0x20,
	IndexBufferBit = 0x40,
	VertexBufferBit = 0x80,
	IndirectBufferBit = 0x100,
	ConditionalRenderingBitExt = 0x200,
	ShaderBindingTableBitKhr = 0x400,
	TransformFeedbackBufferBitExt = 0x800,
	TransformFeedbackCounterBufferBitExt = 0x1000,
	ShaderDeviceAddressBit = 0x20000,
	AccelerationStructureBuildInputReadOnlyBitKhr = 0x80000,
	AccelerationStructureStorageBitKhr = 0x100000
}

ColorComponentFlags::enum u32 {
	RBit = 0x1,
	GBit = 0x2,
	BBit = 0x4,
	ABit = 0x8
}

AttachmentDescriptionFlags::enum u32 {
	MayAliasBit = 0x1
}

FragmentShadingRateTypeNV::enum u32 {
	FragmentSizeNv = 0,
	EnumsNv = 1
}

CommandBufferLevel::enum u32 {
	Primary = 0,
	Secondary = 1
}

BorderColor::enum u32 {
	FloatTransparentBlack = 0,
	IntTransparentBlack = 1,
	FloatOpaqueBlack = 2,
	IntOpaqueBlack = 3,
	FloatOpaqueWhite = 4,
	IntOpaqueWhite = 5,
	FloatCustomExt = 1000287003,
	IntCustomExt = 1000287004
}

ValidationFeatureDisableEXT::enum u32 {
	AllExt = 0,
	ShadersExt = 1,
	ThreadSafetyExt = 2,
	ApiParametersExt = 3,
	ObjectLifetimesExt = 4,
	CoreChecksExt = 5,
	UniqueHandlesExt = 6
}

ExternalSemaphoreFeatureFlags::enum u32 {
	ExportableBit = 0x1,
	ImportableBit = 0x2
}

BlendOverlapEXT::enum u32 {
	UncorrelatedExt = 0,
	DisjointExt = 1,
	ConjointExt = 2
}

PerformanceCounterScopeKHR::enum u32 {
	CommandBufferKhr = 0,
	RenderPassKhr = 1,
	CommandKhr = 2
}

SampleCountFlags::enum u32 {
	_1Bit = 0x1,
	_2Bit = 0x2,
	_4Bit = 0x4,
	_8Bit = 0x8,
	_16Bit = 0x10,
	_32Bit = 0x20,
	_64Bit = 0x40
}

DescriptorPoolCreateFlags::enum u32 {
	FreeDescriptorSetBit = 0x1,
	UpdateAfterBindBit = 0x2,
	HostOnlyBitValve = 0x4
}

AccelerationStructureMemoryRequirementsTypeNV::enum u32 {
	ObjectNv = 0,
	BuildScratchNv = 1,
	UpdateScratchNv = 2
}

CommandBufferUsageFlags::enum u32 {
	OneTimeSubmitBit = 0x1,
	RenderPassContinueBit = 0x2,
	SimultaneousUseBit = 0x4
}

ImageLayout::enum u32 {
	Undefined = 0,
	General = 1,
	ColorAttachmentOptimal = 2,
	DepthStencilAttachmentOptimal = 3,
	DepthStencilReadOnlyOptimal = 4,
	ShaderReadOnlyOptimal = 5,
	TransferSrcOptimal = 6,
	TransferDstOptimal = 7,
	Preinitialized = 8,
	PresentSrcKhr = 1000001002,
	SharedPresentKhr = 1000111000,
	DepthReadOnlyStencilAttachmentOptimal = 1000117000,
	DepthAttachmentStencilReadOnlyOptimal = 1000117001,
	ShadingRateOptimalNv = 1000164003,
	FragmentDensityMapOptimalExt = 1000218000,
	DepthAttachmentOptimal = 1000241000,
	DepthReadOnlyOptimal = 1000241001,
	StencilAttachmentOptimal = 1000241002,
	StencilReadOnlyOptimal = 1000241003,
	ReadOnlyOptimalKhr = 1000314000,
	AttachmentOptimalKhr = 1000314001
}

ValidationCheckEXT::enum u32 {
	AllExt = 0,
	ShadersExt = 1
}

ResolveModeFlags::enum u32 {
	None = 0x0,
	SampleZeroBit = 0x1,
	AverageBit = 0x2,
	MinBit = 0x4,
	MaxBit = 0x8
}

ImageAspectFlags::enum u32 {
	ColorBit = 0x1,
	DepthBit = 0x2,
	StencilBit = 0x4,
	MetadataBit = 0x8,
	Plane0Bit = 0x10,
	Plane1Bit = 0x20,
	Plane2Bit = 0x40,
	MemoryPlane0BitExt = 0x80,
	MemoryPlane1BitExt = 0x100,
	MemoryPlane2BitExt = 0x200,
	MemoryPlane3BitExt = 0x400
}

AccessFlags::enum u32 {
	NoneKhr = 0x0,
	IndirectCommandReadBit = 0x1,
	IndexReadBit = 0x2,
	VertexAttributeReadBit = 0x4,
	UniformReadBit = 0x8,
	InputAttachmentReadBit = 0x10,
	ShaderReadBit = 0x20,
	ShaderWriteBit = 0x40,
	ColorAttachmentReadBit = 0x80,
	ColorAttachmentWriteBit = 0x100,
	DepthStencilAttachmentReadBit = 0x200,
	DepthStencilAttachmentWriteBit = 0x400,
	TransferReadBit = 0x800,
	TransferWriteBit = 0x1000,
	HostReadBit = 0x2000,
	HostWriteBit = 0x4000,
	MemoryReadBit = 0x8000,
	MemoryWriteBit = 0x10000,
	CommandPreprocessReadBitNv = 0x20000,
	CommandPreprocessWriteBitNv = 0x40000,
	ColorAttachmentReadNoncoherentBitExt = 0x80000,
	ConditionalRenderingReadBitExt = 0x100000,
	AccelerationStructureReadBitKhr = 0x200000,
	AccelerationStructureWriteBitKhr = 0x400000,
	ShadingRateImageReadBitNv = 0x800000,
	FragmentDensityMapReadBitExt = 0x1000000,
	TransformFeedbackWriteBitExt = 0x2000000,
	TransformFeedbackCounterReadBitExt = 0x4000000,
	TransformFeedbackCounterWriteBitExt = 0x8000000
}

PrimitiveTopology::enum u32 {
	PointList = 0,
	LineList = 1,
	LineStrip = 2,
	TriangleList = 3,
	TriangleStrip = 4,
	TriangleFan = 5,
	LineListWithAdjacency = 6,
	LineStripWithAdjacency = 7,
	TriangleListWithAdjacency = 8,
	TriangleStripWithAdjacency = 9,
	PatchList = 10
}

ViewportCoordinateSwizzleNV::enum u32 {
	PositiveXNv = 0,
	NegativeXNv = 1,
	PositiveYNv = 2,
	NegativeYNv = 3,
	PositiveZNv = 4,
	NegativeZNv = 5,
	PositiveWNv = 6,
	NegativeWNv = 7
}

PresentModeKHR::enum u32 {
	ImmediateKhr = 0,
	MailboxKhr = 1,
	FifoKhr = 2,
	FifoRelaxedKhr = 3,
	SharedDemandRefreshKhr = 1000111000,
	SharedContinuousRefreshKhr = 1000111001
}

ExternalSemaphoreHandleTypeFlags::enum u32 {
	OpaqueFdBit = 0x1,
	OpaqueWin32Bit = 0x2,
	OpaqueWin32KmtBit = 0x4,
	D3D12FenceBit = 0x8,
	SyncFdBit = 0x10
}

ShaderGroupShaderKHR::enum u32 {
	GeneralKhr = 0,
	ClosestHitKhr = 1,
	AnyHitKhr = 2,
	IntersectionKhr = 3
}

InternalAllocationType::enum u32 {
	Executable = 0
}

ExternalMemoryFeatureFlags::enum u32 {
	DedicatedOnlyBit = 0x1,
	ExportableBit = 0x2,
	ImportableBit = 0x4
}

ShaderCorePropertiesFlagsAMD::enum u32 {
	__
}

ChromaLocation::enum u32 {
	CositedEven = 0,
	Midpoint = 1
}

GeometryTypeKHR::enum u32 {
	TrianglesKhr = 0,
	AabbsKhr = 1,
	InstancesKhr = 2
}

PointClippingBehavior::enum u32 {
	AllClipPlanes = 0,
	UserClipPlanesOnly = 1
}

PerformanceCounterStorageKHR::enum u32 {
	Int32Khr = 0,
	Int64Khr = 1,
	Uint32Khr = 2,
	Uint64Khr = 3,
	Float32Khr = 4,
	Float64Khr = 5
}

ImageUsageFlags::enum u32 {
	TransferSrcBit = 0x1,
	TransferDstBit = 0x2,
	SampledBit = 0x4,
	StorageBit = 0x8,
	ColorAttachmentBit = 0x10,
	DepthStencilAttachmentBit = 0x20,
	TransientAttachmentBit = 0x40,
	InputAttachmentBit = 0x80,
	ShadingRateImageBitNv = 0x100,
	FragmentDensityMapBitExt = 0x200
}

PipelineStageFlags2KHR::enum u32 {
	NoneKhr = 0x0,
	TopOfPipeBitKhr = 0x1,
	DrawIndirectBitKhr = 0x2,
	VertexInputBitKhr = 0x4,
	VertexShaderBitKhr = 0x8,
	TessellationControlShaderBitKhr = 0x10,
	TessellationEvaluationShaderBitKhr = 0x20,
	GeometryShaderBitKhr = 0x40,
	FragmentShaderBitKhr = 0x80,
	EarlyFragmentTestsBitKhr = 0x100,
	LateFragmentTestsBitKhr = 0x200,
	ColorAttachmentOutputBitKhr = 0x400,
	ComputeShaderBitKhr = 0x800,
	AllTransferBitKhr = 0x1000,
	BottomOfPipeBitKhr = 0x2000,
	HostBitKhr = 0x4000,
	AllGraphicsBitKhr = 0x8000,
	AllCommandsBitKhr = 0x10000,
	CommandPreprocessBitNv = 0x20000,
	ConditionalRenderingBitExt = 0x40000,
	TaskShaderBitNv = 0x80000,
	MeshShaderBitNv = 0x100000,
	RayTracingShaderBitKhr = 0x200000,
	FragmentShadingRateAttachmentBitKhr = 0x400000,
	FragmentDensityProcessBitExt = 0x800000,
	TransformFeedbackBitExt = 0x1000000,
	AccelerationStructureBuildBitKhr = 0x2000000,
	// CopyBitKhr = 0x100000000,
	// ResolveBitKhr = 0x200000000,
	// BlitBitKhr = 0x400000000,
	// ClearBitKhr = 0x800000000,
	// IndexInputBitKhr = 0x1000000000,
	// VertexAttributeInputBitKhr = 0x2000000000,
	// PreRasterizationShadersBitKhr = 0x4000000000
}

BlendOp::enum u32 {
	Add = 0,
	Subtract = 1,
	ReverseSubtract = 2,
	Min = 3,
	Max = 4,
	ZeroExt = 1000148000,
	SrcExt = 1000148001,
	DstExt = 1000148002,
	SrcOverExt = 1000148003,
	DstOverExt = 1000148004,
	SrcInExt = 1000148005,
	DstInExt = 1000148006,
	SrcOutExt = 1000148007,
	DstOutExt = 1000148008,
	SrcAtopExt = 1000148009,
	DstAtopExt = 1000148010,
	XorExt = 1000148011,
	MultiplyExt = 1000148012,
	ScreenExt = 1000148013,
	OverlayExt = 1000148014,
	DarkenExt = 1000148015,
	LightenExt = 1000148016,
	ColordodgeExt = 1000148017,
	ColorburnExt = 1000148018,
	HardlightExt = 1000148019,
	SoftlightExt = 1000148020,
	DifferenceExt = 1000148021,
	ExclusionExt = 1000148022,
	InvertExt = 1000148023,
	InvertRgbExt = 1000148024,
	LineardodgeExt = 1000148025,
	LinearburnExt = 1000148026,
	VividlightExt = 1000148027,
	LinearlightExt = 1000148028,
	PinlightExt = 1000148029,
	HardmixExt = 1000148030,
	HslHueExt = 1000148031,
	HslSaturationExt = 1000148032,
	HslColorExt = 1000148033,
	HslLuminosityExt = 1000148034,
	PlusExt = 1000148035,
	PlusClampedExt = 1000148036,
	PlusClampedAlphaExt = 1000148037,
	PlusDarkerExt = 1000148038,
	MinusExt = 1000148039,
	MinusClampedExt = 1000148040,
	ContrastExt = 1000148041,
	InvertOvgExt = 1000148042,
	RedExt = 1000148043,
	GreenExt = 1000148044,
	BlueExt = 1000148045
}

PerformanceCounterUnitKHR::enum u32 {
	GenericKhr = 0,
	PercentageKhr = 1,
	NanosecondsKhr = 2,
	BytesKhr = 3,
	BytesPerSecondKhr = 4,
	KelvinKhr = 5,
	WattsKhr = 6,
	VoltsKhr = 7,
	AmpsKhr = 8,
	HertzKhr = 9,
	CyclesKhr = 10
}

SharingMode::enum u32 {
	Exclusive = 0,
	Concurrent = 1
}

CommandPoolResetFlags::enum u32 {
	ReleaseResourcesBit = 0x1
}

PipelineExecutableStatisticFormatKHR::enum u32 {
	Bool32Khr = 0,
	Int64Khr = 1,
	Uint64Khr = 2,
	Float64Khr = 3
}

DescriptorBindingFlags::enum u32 {
	UpdateAfterBindBit = 0x1,
	UpdateUnusedWhilePendingBit = 0x2,
	PartiallyBoundBit = 0x4,
	VariableDescriptorCountBit = 0x8
}

ToolPurposeFlagsEXT::enum u32 {
	ValidationBitExt = 0x1,
	ProfilingBitExt = 0x2,
	TracingBitExt = 0x4,
	AdditionalFeaturesBitExt = 0x8,
	ModifyingFeaturesBitExt = 0x10,
	DebugReportingBitExt = 0x20,
	DebugMarkersBitExt = 0x40
}

FragmentShadingRateCombinerOpKHR::enum u32 {
	KeepKhr = 0,
	ReplaceKhr = 1,
	MinKhr = 2,
	MaxKhr = 3,
	MulKhr = 4
}

PerformanceCounterDescriptionFlagsKHR::enum u32 {
	PerformanceImpactingBitKhr = 0x1,
	ConcurrentlyImpactedBitKhr = 0x2
}

CoverageReductionModeNV::enum u32 {
	MergeNv = 0,
	TruncateNv = 1
}

QueryControlFlags::enum u32 {
	PreciseBit = 0x1
}

QueryResultFlags::enum u32 {
	_64Bit = 0x1,
	WaitBit = 0x2,
	WithAvailabilityBit = 0x4,
	PartialBit = 0x8
}

DebugUtilsMessageTypeFlagsEXT::enum u32 {
	GeneralBitExt = 0x1,
	ValidationBitExt = 0x2,
	PerformanceBitExt = 0x4
}

ExternalMemoryHandleTypeFlagsNV::enum u32 {
	OpaqueWin32BitNv = 0x1,
	OpaqueWin32KmtBitNv = 0x2,
	D3D11ImageBitNv = 0x4,
	D3D11ImageKmtBitNv = 0x8
}

PipelineStageFlags::enum u32 {
	NoneKhr = 0x0,
	TopOfPipeBit = 0x1,
	DrawIndirectBit = 0x2,
	VertexInputBit = 0x4,
	VertexShaderBit = 0x8,
	TessellationControlShaderBit = 0x10,
	TessellationEvaluationShaderBit = 0x20,
	GeometryShaderBit = 0x40,
	FragmentShaderBit = 0x80,
	EarlyFragmentTestsBit = 0x100,
	LateFragmentTestsBit = 0x200,
	ColorAttachmentOutputBit = 0x400,
	ComputeShaderBit = 0x800,
	TransferBit = 0x1000,
	BottomOfPipeBit = 0x2000,
	HostBit = 0x4000,
	AllGraphicsBit = 0x8000,
	AllCommandsBit = 0x10000,
	CommandPreprocessBitNv = 0x20000,
	ConditionalRenderingBitExt = 0x40000,
	TaskShaderBitNv = 0x80000,
	MeshShaderBitNv = 0x100000,
	RayTracingShaderBitKhr = 0x200000,
	ShadingRateImageBitNv = 0x400000,
	FragmentDensityProcessBitExt = 0x800000,
	TransformFeedbackBitExt = 0x1000000,
	AccelerationStructureBuildBitKhr = 0x2000000
}

FenceImportFlags::enum u32 {
	TemporaryBit = 0x1
}

AttachmentLoadOp::enum u32 {
	Load = 0,
	Clear = 1,
	DontCare = 2
}

