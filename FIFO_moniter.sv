import shared_pkg::*;
import scoreboard_pkg::*;
import transaction_pkg::*;
import coverage_pkg::*;

module FIFO_monitor (FIFO_interface.moniter intf);

    FIFO_transaction tr;
    FIFO_scoreboard sb;
    FIFO_coverage cov;

    initial begin
        tr = new();
        sb = new();
        cov = new();

        forever begin
            @(negedge intf.clk);

            // Sample interface into transaction
            tr.data_in  	= intf.data_in;
            tr.rst_n    	= intf.rst_n;
            tr.wr_en    	= intf.wr_en;
            tr.rd_en    	= intf.rd_en;
            tr.data_out    	= intf.data_out;
            tr.wr_ack      	= intf.wr_ack;
            tr.overflow    	= intf.overflow;
            tr.full        	= intf.full;
            tr.empty       	= intf.empty;
            tr.almostfull  	= intf.almostfull;
            tr.almostempty 	= intf.almostempty;
            tr.underflow   	= intf.underflow;

            fork
		begin
                cov.sample_data(tr);
		end
		begin
		sb.check_data(tr);
		end
            join

            if (test_finished) begin
                $display("************ Simulation Summary ************");
                $display("Errors: %0d, Correct: %0d", error_counter, correct_counter);
                $stop;
            end
        end
    end

endmodule