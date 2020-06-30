`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/05 11:48:13
// Design Name: 
// Module Name: Vmachine_top
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


module Vmachine_top(
        input clk,
        input rst,
        input [3:0] goods,
        input [5:0] cash_Input,
        input buy_goods,
        output  [6:0] duan,
        output  [6:0] duan1,
        output  [1:0] digital_tube_goods,
        output  [2:0] digital_tube_cash,
        output  [2:0] digital_tube_change,
        output  [5:0] cash_led,
        output  [3:0] goods_num
    );
        wire [11:0] currency;
        wire [7:0] goods_price;
        wire [7:0] goods_money;
        wire [11:0] money;
        wire [11:0] small_change;
        wire [1:0] state ;
        wire clk_1k;
        clock c(.clk(clk),
                .rst(rst),
                .clk_1k(clk_1k)
       //        ,.clk_c(clk_c)
           );
        cashInput cash( .clk(clk),
                        .rst(rst),
                        .cash_Input(cash_Input),
                        .currency(currency),
                        .cash_led(cash_led));
        chooseCommodity choose( .clk(clk),
                                .rst(rst),
                                .goods(goods),
                                .goods_price(goods_price),
                                .goods_num(goods_num)
                           );
        transaction trans(  .rst(rst),
                            .goods_price(goods_price),
                            .currency(currency),
                            .buy_goods(buy_goods),
                            .goods_money(goods_money),
                            .money(money),
                            .small_change(small_change),
                            .state(state)
                            );
        digitaltube tube(   .clk(clk_1k),
                            .rst(rst),
                            .goods_money(goods_money),
                            .money(money),
                            .small_change(small_change),
                            .state(state),
                            .duan(duan),
                            .duan1(duan1),
                            .digital_tube_goods(digital_tube_goods),
                            .digital_tube_cash(digital_tube_cash),
                            .digital_tube_change(digital_tube_change)
        );
        
        
        
endmodule
