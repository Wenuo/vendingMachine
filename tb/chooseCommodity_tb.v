`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 12:30:24
// Design Name: 
// Module Name: chooseCommodity_tb
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


module chooseCommodity_tb(
    
    );
    reg clk;
    reg rst;
    reg [3:0] goods;
    wire [7:0] goods_price;
    wire [3:0] goods_num;
    chooseCommodity ch(.clk(clk),
                       .rst(rst),
                       .goods(goods),
                       .goods_price(goods_price),
                       .goods_num(goods_num)
                       );
    always #100 clk =~ clk;
    initial begin
        clk = 0;
        rst = 0;
        //goods = 4'b1000;
        #100 rst = 1;
            goods = 4'b1000;
            #10 goods = 4'b0001;
        #100 goods = 4'b1001;
        #100 goods = 4'b0100;
      //  #100 rst = 0;
        #100 rst = 1; goods = 4'b0010;
        
     /*   #100 goods3 = 1;
        #100 goods4 = 1;*/
                
    end
endmodule
