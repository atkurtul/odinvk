
all: vma.so glfw.so shader.vert.spv shader.frag.spv
	@odin run ./main.odin -extra-linker-flags:-lglfw

%.spv: %
	@glslc $^ -c

vma.so: vma.cpp
	g++ -fPIC -std=c++11 -c vma.cpp
	g++ -shared -o vma.so vma.o -static-libstdc++

glfw.so: glfw.c
	gcc -fPIC -c glfw.c
	gcc -shared -o glfw.so glfw.o

cargo:
	cd generator && cargo run > ../vk/vk.odin

clean:
	rm *.o *.so *.spv main