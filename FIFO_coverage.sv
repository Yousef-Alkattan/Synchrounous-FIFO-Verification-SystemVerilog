package coverage_pkg;
import transaction_pkg::*;
import shared_pkg::*;

class FIFO_coverage;
  FIFO_transaction F_cvg_txn = new();

  covergroup CVG;

    // Coverpoints
    wr_en_cp:     	coverpoint F_cvg_txn.wr_en { bins active = {1}; bins inactive = {0}; }
    rd_en_cp:     	coverpoint F_cvg_txn.rd_en { bins active = {1}; bins inactive = {0}; }

    wr_ack_cp:    	coverpoint F_cvg_txn.wr_ack { bins active = {1}; bins inactive = {0}; }
    full_cp:      	coverpoint F_cvg_txn.full { bins active = {1}; bins inactive = {0}; }
    empty_cp:     	coverpoint F_cvg_txn.empty { bins active = {1}; bins inactive = {0}; }
    almostfull_cp:  	coverpoint F_cvg_txn.almostfull { bins active = {1}; bins inactive = {0}; }
    almostempty_cp: 	coverpoint F_cvg_txn.almostempty { bins active = {1}; bins inactive = {0}; }
    underflow_cp:    	coverpoint F_cvg_txn.underflow {bins active = {1};bins inactive = {0}; }
    overflow_cp:     	coverpoint F_cvg_txn.overflow {bins active = {1};bins inactive = {0}; }

    // 7 required cross coverages
    cross_wr_rd_wrack:        cross wr_en_cp, rd_en_cp, wr_ack_cp;
    cross_wr_rd_full:         cross wr_en_cp, rd_en_cp, full_cp;
    cross_wr_rd_empty:        cross wr_en_cp, rd_en_cp, empty_cp;
    cross_wr_rd_almostfull:   cross wr_en_cp, rd_en_cp, almostfull_cp;
    cross_wr_rd_almostempty:  cross wr_en_cp, rd_en_cp, almostempty_cp;
    cross_wr_rd_underflow:   cross wr_en_cp, rd_en_cp, underflow_cp;
    cross_wr_rd_overflow:  cross wr_en_cp, rd_en_cp, overflow_cp;

  endgroup

  function new();
    CVG = new();
  endfunction

  function void sample_data(FIFO_transaction F_txn);
    F_cvg_txn = F_txn;
    CVG.sample();
  endfunction

endclass
endpackage
