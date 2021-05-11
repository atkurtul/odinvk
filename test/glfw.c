#include <GLFW/glfw3.h>

#include <stdlib.h>


const char** glfw_init(unsigned* count) {
  if (!glfwInit())
    abort();
  glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
  glfwWindowHint(GLFW_RESIZABLE, GLFW_TRUE);
  return glfwGetRequiredInstanceExtensions(count);
}

