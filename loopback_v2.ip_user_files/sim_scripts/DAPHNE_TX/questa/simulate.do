onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib DAPHNE_TX_opt

do {wave.do}

view wave
view structure
view signals

do {DAPHNE_TX.udo}

run -all

quit -force
