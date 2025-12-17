# Quit any existing simulation cleanly
quit -sim

vsim -gui work.counter_nbit_tb

# add all necessary waves
add wave -r *
radix unsigned
