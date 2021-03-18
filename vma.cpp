#include <vulkan/vulkan_core.h>
#define VMA_IMPLEMENTATION
#define VMA_STATIC_VULKAN_FUNCTIONS 0
#define VMA_DYNAMIC_VULKAN_FUNCTIONS 0
#include <unordered_map>
#include "vk_mem_alloc.h"

static std::unordered_map<VkBuffer, VmaAllocation> buffers;
static std::unordered_map<VkImage, VmaAllocation> images;

static VmaAllocator allocator;

extern "C" {
extern PFN_vkGetPhysicalDeviceProperties get_physical_device_properties;
extern PFN_vkGetPhysicalDeviceMemoryProperties
    get_physical_device_memory_properties;
extern PFN_vkAllocateMemory allocate_memory;
extern PFN_vkFreeMemory free_memory;
extern PFN_vkMapMemory map_memory;
extern PFN_vkUnmapMemory unmap_memory;
extern PFN_vkFlushMappedMemoryRanges flush_mapped_memory_ranges;
extern PFN_vkInvalidateMappedMemoryRanges invalidate_mapped_memory_ranges;
extern PFN_vkBindBufferMemory bind_buffer_memory;
extern PFN_vkBindImageMemory bind_image_memory;
extern PFN_vkGetBufferMemoryRequirements get_buffer_memory_requirements;
extern PFN_vkGetImageMemoryRequirements get_image_memory_requirements;
extern PFN_vkCreateBuffer create_buffer;
extern PFN_vkDestroyBuffer destroy_buffer;
extern PFN_vkCreateImage create_image;
extern PFN_vkDestroyImage destroy_image;
extern PFN_vkCmdCopyBuffer cmd_copy_buffer;

extern PFN_vkGetBufferMemoryRequirements2 get_buffer_memory_requirements_2;
extern PFN_vkGetImageMemoryRequirements2 get_image_memory_requirements_2;
extern PFN_vkBindBufferMemory2 bind_buffer_memory_2;
extern PFN_vkBindImageMemory2 bind_image_memory_2;
extern PFN_vkGetPhysicalDeviceMemoryProperties2
    get_physical_device_memory_properties_2;

VkResult vma_create_allocator(VkInstance instance,
                              VkPhysicalDevice pdev,
                              VkDevice dev) {
  VmaVulkanFunctions functions = {
    .vkGetPhysicalDeviceProperties = get_physical_device_properties,
    .vkGetPhysicalDeviceMemoryProperties =
        get_physical_device_memory_properties,
    .vkAllocateMemory = allocate_memory,
    .vkFreeMemory = free_memory,
    .vkMapMemory = map_memory,
    .vkUnmapMemory = unmap_memory,
    .vkFlushMappedMemoryRanges = flush_mapped_memory_ranges,
    .vkInvalidateMappedMemoryRanges = invalidate_mapped_memory_ranges,
    .vkBindBufferMemory = bind_buffer_memory,
    .vkBindImageMemory = bind_image_memory,
    .vkGetBufferMemoryRequirements = get_buffer_memory_requirements,
    .vkGetImageMemoryRequirements = get_image_memory_requirements,
    .vkCreateBuffer = create_buffer,
    .vkDestroyBuffer = destroy_buffer,
    .vkCreateImage = create_image,
    .vkDestroyImage = destroy_image,
    .vkCmdCopyBuffer = cmd_copy_buffer,
#if VMA_DEDICATED_ALLOCATION || VMA_VULKAN_VERSION >= 1001000
    .vkGetBufferMemoryRequirements2KHR = get_buffer_memory_requirements_2,
    .vkGetImageMemoryRequirements2KHR = get_image_memory_requirements_2,
#endif
#if VMA_BIND_MEMORY2 || VMA_VULKAN_VERSION >= 1001000
    .vkBindBufferMemory2KHR = bind_buffer_memory_2,
    .vkBindImageMemory2KHR = bind_image_memory_2,
#endif
#if VMA_MEMORY_BUDGET || VMA_VULKAN_VERSION >= 1001000
    .vkGetPhysicalDeviceMemoryProperties2KHR =
        get_physical_device_memory_properties_2,
#endif
  };

  VmaAllocatorCreateInfo info = {
      .physicalDevice = pdev,
      .device = dev,
      .pVulkanFunctions = &functions,
      .instance = instance,
      .vulkanApiVersion = VK_API_VERSION_1_2,
  };

  return vmaCreateAllocator(&info, &allocator);
}

VkResult vma_create_buffer(VkBufferCreateInfo* info,
                           VkBuffer* buffer,
                           void** mapped) {
  VmaAllocation allocation;
  VmaAllocationCreateInfo info2 = {.usage = VMA_MEMORY_USAGE_GPU_ONLY};

  VmaAllocationInfo info3 = {0};
  if (mapped) {
    info2.flags = VMA_ALLOCATION_CREATE_MAPPED_BIT;
    info2.usage = VMA_MEMORY_USAGE_CPU_TO_GPU;
  }

  VkResult re =
      vmaCreateBuffer(allocator, info, &info2, buffer, &allocation, &info3);
  if (mapped) {
    *mapped = info3.pMappedData;
  }

  if (re == VK_SUCCESS) {
    buffers[*buffer] = allocation;
  }

  return re;
}

VkResult vma_create_image(VkImageCreateInfo* info, VkImage* image) {
  VmaAllocationCreateInfo allocation_info = {.usage =
                                                 VMA_MEMORY_USAGE_GPU_ONLY};
  VmaAllocationInfo out_info;

  VmaAllocation allocation;

  VkResult re = vmaCreateImage(allocator, info, &allocation_info, image,
                               &allocation, &out_info);
  if (re == VK_SUCCESS) {
    images[*image] = allocation;
  }

  return re;
}
}
