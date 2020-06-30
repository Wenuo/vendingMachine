`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/09 15:07:42
// Design Name: 
// Module Name: Vm_tb
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


module Vm_tb(
    );
   reg clk;
   reg rst;
   reg [3:0] goods;
   reg [5:0] cash_Input;
   reg buy_goods;
   wire  [6:0] duan;
   wire  [6:0] duan1;
   wire  [1:0] digital_tube_goods;
   wire  [2:0] digital_tube_cash;
   wire  [2:0] digital_tube_change;
   wire  [5:0] cash_led;
   wire  [3:0] goods_num;
   
   Vmachine_top vm (    .clk(clk),
                        .rst(rst),
                        .goods(goods),
                        .cash_Input(cash_Input),
                        .buy_goods(buy_goods),
                        .duan(duan),
                        .duan1(duan1),
                        .digital_tube_goods(digital_tube_goods),
                        .digital_tube_cash(digital_tube_cash),
                        .digital_tube_change(digital_tube_change),
                        .cash_led(cash_led),
                        .goods_num(goods_num)
                        );
   always #5 clk = ~clk;
   initial begin
        clk = 0;    
        rst = 0;
        cash_Input = 6'b0;
        goods = 4'b0;
        buy_goods = 1'b0;
        #10 rst = 1;
        #30 cash_Input = 6'b000111;
        #10 goods = 4'b0010;
        #10 buy_goods = 1'b1;
       // #10 buy_goods = 1'b0;
   
   
   end
endmodule
