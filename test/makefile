
all: vma.so glfw.so shader.vert.spv shader.frag.spv
	@odin build ./main.odin -extra-linker-flags:"-lglfw -ldl -lm" -debug

%.spv: %
	@glslc $^ -c

vma.so: vma.cpp
	g++ -fPIC -std=c++11 -c vma.cpp -g3
	g++ -shared -o vma.so vma.o -g3 -static-libstdc++

glfw.so: glfw.c
	gcc -fPIC -c glfw.c -g3
	gcc -shared -o glfw.so glfw.o -g3

cargo:
	cd generator && cargo run > ../vk/vk.odin

clean:
	rm *.o *.so *.spv main