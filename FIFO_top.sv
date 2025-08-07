module 	FIFO_top ();
    bit clk;
    initial begin
        forever #1 clk = ~clk;
    end

    FIFO_interface intf(clk);

    FIFO dut(intf);
    FIFO_testbench tb(intf);
    FIFO_monitor mon(intf);
endmodule