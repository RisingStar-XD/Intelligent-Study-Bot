onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Binary_Image_buffer_opt

do {wave.do}

view wave
view structure
view signals

do {Binary_Image_buffer.udo}

run -all

quit -force
