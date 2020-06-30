`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/08 11:21:07
// Design Name: 
// Module Name: clock_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_tb(

    );
    reg clk;
    reg rst;
    wire clk_1k;
    clock c(.clk(clk),
            .rst(rst),
            .clk_1k(clk_1k));
    always #1 clk = ~clk;
    initial begin
        clk = 0;
        rst = 0;
        #100 rst = 1;
    end
endmodule
