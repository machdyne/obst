blinky_obst:
	mkdir -p output
	yosys -q -p "synth_ecp5 -top blinky -json output/blinky_obst.json" rtl/blinky_obst.v
	nextpnr-ecp5 --12k --package CABGA256 --lpf obst_v0.lpf --json output/blinky_obst.json --textcfg output/obst_blinky_out.config
	ecppack -v --compress --freq 2.4 output/obst_blinky_out.config --bit output/obst.bit

prog:
	openFPGALoader -c dirtyJtag output/obst.bit
