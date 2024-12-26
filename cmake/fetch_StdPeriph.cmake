

add_library(StdPeriph OBJECT)

target_include_directories(StdPeriph PUBLIC "Library")
target_compile_definitions(StdPeriph PUBLIC -DUSE_STDPERIPH_DRIVER -DSTM32F10X_MD)

#core
target_include_directories(StdPeriph PUBLIC ${StdPeriph_DIR}/CMSIS/CM3/CoreSupport)
target_sources(StdPeriph PRIVATE ${StdPeriph_DIR}/CMSIS/CM3/CoreSupport/core_cm3.c)
#device
target_include_directories(StdPeriph PUBLIC "${StdPeriph_DIR}/CMSIS/CM3/DeviceSupport/ST/STM32F10x")
target_sources(StdPeriph PRIVATE "${StdPeriph_DIR}/CMSIS/CM3/DeviceSupport/ST/STM32F10x/system_stm32f10x.c")
#driver
file(GLOB_RECURSE STD_DRIVER_SRC "${StdPeriph_DIR}/STM32F10x_StdPeriph_Driver/src/*.c")
target_include_directories(StdPeriph PUBLIC "${StdPeriph_DIR}/STM32F10x_StdPeriph_Driver/inc")
target_sources(StdPeriph PRIVATE "${STD_DRIVER_SRC}")