import shared_pkg::*;
import transaction_pkg::*;

module FIFO_testbench (FIFO_interface.tb intf);
    FIFO_transaction tr = new();

    initial begin

	reset;

        repeat(1000) begin
        	assert(tr.randomize());
        	intf.data_in = tr.data_in;
        	intf.rst_n   = tr.rst_n;
        	intf.wr_en   = tr.wr_en;
        	intf.rd_en   = tr.rd_en;
        	@(negedge intf.clk);
	end
	
        reset;

        // Finalize test
        test_finished = 1;
        @(negedge intf.clk);
    end

    // Reset task
    task reset;
        intf.rst_n = 0;
        tr.rst_n = intf.rst_n;
        repeat(5) @(negedge intf.clk);
        intf.rst_n = 1;
        tr.rst_n = intf.rst_n;
    endtask
endmodule
