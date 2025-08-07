package transaction_pkg;

import shared_pkg::*;

class FIFO_transaction;

    // FIFO inputs and outputs
    rand bit [FIFO_WIDTH-1:0] data_in;
    rand bit rst_n, wr_en, rd_en;
    bit [FIFO_WIDTH-1:0] data_out;
    bit wr_ack, overflow;
    bit full, empty, almostfull, almostempty, underflow;

    // Distribution control variables
    rand int RD_EN_ON_DIST, WR_EN_ON_DIST;

    // Constructor with default values
    function new(int rd_dist = 30, int wr_dist = 70);
        this.RD_EN_ON_DIST = rd_dist;
        this.WR_EN_ON_DIST = wr_dist;
    endfunction

    // Constraint 1
    constraint reset_less_often {
        rst_n dist {1 := 99, 0 := 1};
    }

    // Constraint 2:
    constraint wr_en_distribution {
        wr_en dist {1 := WR_EN_ON_DIST, 0 := 100 - WR_EN_ON_DIST};
    }

    // Constraint 3:
    constraint rd_en_distribution {
        rd_en dist {1 := RD_EN_ON_DIST, 0 := 100 - RD_EN_ON_DIST};
    }

endclass

endpackage
