%.exe: %.c %.ll
	clang -o $@ $^ -Wno-override-module

run%: %.exe
	./$^

asm%: %.ll
	clang -o /dev/stdout -S $^ -Wno-override-module -fno-asynchronous-unwind-tables


optasm%: %.ll
	clang -O3 -o /dev/stdout -S $^ -Wno-override-module -fno-asynchronous-unwind-tables

clean:
	rm -f *.exe
