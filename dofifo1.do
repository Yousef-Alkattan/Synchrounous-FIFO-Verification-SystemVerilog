vlib work
vlog +acc +define+SIM -f FIFO_files.list
vsim -voptargs=+acc FIFO_top

add wave /FIFO_top/intf/clk
add wave /FIFO_top/intf/rst_n
add wave /FIFO_top/intf/wr_en
add wave /FIFO_top/intf/rd_en
add wave /FIFO_top/intf/data_in
add wave /FIFO_top/intf/data_out
add wave /FIFO_top/intf/full
add wave /FIFO_top/intf/empty
add wave /FIFO_top/intf/almostfull 
add wave /FIFO_top/intf/almostempty 
add wave /FIFO_top/intf/underflow
add wave /FIFO_top/intf/overflow
add wave /FIFO_top/intf/wr_ack
add wave /FIFO_top/dut/count
add wave /FIFO_top/dut/wr_ptr
add wave /FIFO_top/dut/rd_ptr

run -all

