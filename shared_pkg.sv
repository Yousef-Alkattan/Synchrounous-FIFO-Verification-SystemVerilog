package shared_pkg;
        parameter FIFO_WIDTH = 16;
        parameter FIFO_DEPTH = 8;

        bit test_finished;
        int error_counter = 0; 
        int correct_counter = 0;

endpackage