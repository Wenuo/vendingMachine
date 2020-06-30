`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/03 16:57:49
// Design Name: 
// Module Name: transaction_tb
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


module transaction_tb(

    );
    reg rst;
    reg [7:0] goods_price;
    reg [11:0] currency;
    reg buy_goods;
    
    wire [7:0] goods_money;
    wire  [11:0] money;
    wire  [11:0] small_change;
    wire  [1:0] state;
    transaction tr( .rst(rst),
                    .goods_price(goods_price),
                    .currency(currency),
                    .buy_goods(buy_goods),
                    .goods_money(goods_money),
                    .money(money),
                    .small_change(small_change),
                    .state(state));

    initial begin

        buy_goods = 0;
        goods_price = 8'd0;
        currency = 12'd0;
        rst = 0;
        #50 rst = 1;
       // #100 buy_goods = 1;
        #100  goods_price = 8'd5; currency = 12'd120;
        #100 buy_goods = 1;
        //#200 //goods_price = 8'b0111_0000; currency = 12'b0001_0111_0001;
        #200 goods_price = 8'd1; currency = 12'd5;
        #200 goods_price = 8'd10;currency = 12'd5;
        #100 rst = 0;
    end
endmodule
