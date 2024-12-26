# stm32-oled
Sample project using stm32 standard library and cmake

IDE: Clion2024

## Prepare
device: stlink-v2、stm32f103c8tx board、other

![替代文本](line.jpg "device wiring diagram")

## Start

Download [StdPeriph](https://www.st.com/en/embedded-software/stsw-stm32054.html)

build and run
```shell
cmake -S ./ -B ${build_dir}
cmake --build ${build_dir} --target stm32-oled.elf -j 14
openocd -s ${openocd_dir}/share/openocd/scripts -f ./stm32f1x_stlink.cfg -c "program ${elf_file}" -c reset -c shutdown
```

## Compile Problem

Error: registers may not be the same -- `strexb r0,r0,[r1]'

core_cm3.c
```c++
uint32_t __STREXB(uint8_t value, uint8_t *addr)
{
   uint32_t result=0;
  
   //__ASM volatile ("strexb %0, %2, [%1]" : "=r" (result) : "r" (addr), "r" (value) );
   __ASM volatile ("strexb %0, %2, [%1]" : "=&r" (result) : "r" (addr), "r" (value) );
   return(result);
}

uint32_t __STREXH(uint16_t value, uint16_t *addr)
{
   uint32_t result=0;
  
   //__ASM volatile ("strexh %0, %2, [%1]" : "=r" (result) : "r" (addr), "r" (value) );
   __ASM volatile ("strexh %0, %2, [%1]" : "=&r" (result) : "r" (addr), "r" (value) );
   return(result);
}
```

