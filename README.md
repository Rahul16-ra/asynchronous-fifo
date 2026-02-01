# asynchronous-fifo
A dual-clock asynchronous FIFO using independent write and read clocks with a 64-depth memory array. It stores 8bit data, uses separate wr_ptr and rd_ptr pointers, and tracks occupancy with a counter to generate buf_empty and buf_full flags. The design supports simultaneous readwrite, includes asynchronous reset, and provides ordered data transfer
