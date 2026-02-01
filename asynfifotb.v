module tb_ASYNFIFO;

reg clk_w, clk_r, rst;
reg [7:0] buf_in;
reg wr_en, rd_en;

wire [7:0] buf_out;
wire buf_empty, buf_full;
wire [3:0] fifo_counter;


FIFO DUT (
    .clk_w(clk_w),
    .clk_r(clk_r),
    .rst(rst),
    .buf_in(buf_in),
    .buf_out(buf_out),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .buf_empty(buf_empty),
    .buf_full(buf_full),
    .fifo_counter(fifo_counter)
);


always #5  clk_w = ~clk_w;   
always #8  clk_r = ~clk_r;  

initial begin
    clk_w = 0;
    clk_r = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    buf_in = 0;

    
    #20;
    rst = 0;

   
    repeat (8) begin
        @(posedge clk_w);
        if (!buf_full) begin
            wr_en <= 1;
            buf_in <= buf_in + 1;
        end else begin
            wr_en <= 0;
        end
    end
    wr_en <= 0;

    #50;

   
    repeat (8) begin
        @(posedge clk_r);
        if (!buf_empty)
            rd_en <= 1;
        else
            rd_en <= 0;
    end
    rd_en <= 0;

    #50;
    $finish;
end

endmodule
