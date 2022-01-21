onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+DAPHNE_TX -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.DAPHNE_TX xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {DAPHNE_TX.udo}

run -all

endsim

quit -force
