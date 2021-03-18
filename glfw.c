#include <vulkan/vulkan.h>

#include <GLFW/glfw3.h>

#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

const char** glfw_init(unsigned* count) {
  glfwInit();
  glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
  glfwWindowHint(GLFW_RESIZABLE, GLFW_TRUE);
  return glfwGetRequiredInstanceExtensions(count);
}

VkResult glfw_create_surface(int x,
                             int y,
                             const char* name,
                             GLFWwindow** win,
                             VkInstance instance,
                             VkSurfaceKHR* surface) {
  *win = glfwCreateWindow(x, y, "window", 0, 0);
  // glfwSetInputMode(*win, GLFW_RAW_MOUSE_MOTION, GLFW_TRUE);
  // glfwSetInputMode(glfw, GLFW_CURSOR, GLFW_CURSOR_DISABLED);
  return glfwCreateWindowSurface(instance, *win, 0, surface);
}


int glfw_poll(GLFWwindow* win) {
  glfwPollEvents();
  return !glfwWindowShouldClose(win);
}
