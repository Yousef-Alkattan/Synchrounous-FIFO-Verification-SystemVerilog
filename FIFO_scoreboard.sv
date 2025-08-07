package scoreboard_pkg;
  import transaction_pkg::*;
  import shared_pkg::*;

  class FIFO_scoreboard;

    // Output reference variables
    bit [FIFO_WIDTH-1:0] data_out_ref;
    bit wr_ack_ref, overflow_ref;
    bit full_ref, empty_ref, almostfull_ref;
    bit almostempty_ref, underflow_ref;

    // Reference model
    function void reference_model(
      input bit [FIFO_WIDTH-1:0] data_out1,
      input bit wr_ack1, overflow1, full1, empty1,
      input bit almostfull1, almostempty1, underflow1
    );
      data_out_ref     = data_out1;
      wr_ack_ref       = wr_ack1;
      overflow_ref     = overflow1;
      full_ref         = full1;
      empty_ref        = empty1;
      almostfull_ref   = almostfull1;
      almostempty_ref  = almostempty1;
      underflow_ref    = underflow1;
    endfunction

    function void check_data(input FIFO_transaction F_txn);

      reference_model(F_txn.data_out, F_txn.wr_ack, F_txn.overflow, 
                      F_txn.full, F_txn.empty, F_txn.almostfull,
                      F_txn.almostempty, F_txn.underflow);

      // Compare actual vs reference
      if (data_out_ref !== F_txn.data_out) begin
        $error("%t: Mismatch in data_out: Expected = %0d, Actual = %0d",
               $time, data_out_ref, F_txn.data_out);
        error_counter++;
      end 
      else begin
        correct_counter++;
      end

    endfunction


    function new();
    endfunction

  endclass
endpackage
