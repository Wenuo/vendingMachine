`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/03 16:24:19
// Design Name: 
// Module Name: transaction
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


module transaction(
    input rst,
    input [7:0] goods_price,
    input [11:0] currency,
    input buy_goods,
    output  [7:0] goods_money,
    output  [11:0] money,
    output reg [11:0] small_change,
    output reg [1:0] state
   // output  [7:0] GP_money,
    //output  [1:0] STATE,
   // output  [11:0] change   
    );
    reg [11:0] G_price ;//= 12'b0000_0000_0000;
    always @(*)//(negedge rst or goods_price or currency or buy_goods)
        begin
        if(!rst)
        begin
         //  goods_money = 8'd0;
        //   money = 8'd0;
           state = 2'b11;
           small_change  = 12'b0000_0000_0000;
        end
        else
            begin
            if(buy_goods)
                begin
                    //G_price = {G_price[11:8],goods_price[7:0]};
                    G_price = {4'b0000,goods_price[7:0]};
                    if(currency > G_price)
                      begin
                          state = 2'b00;
                          small_change = currency - G_price; 
                      end
                    else if(currency == G_price)
                      begin
                         state = 2'b01;
                          small_change  = 12'b0000_0000_0000; 
                      end
                     else if(currency < G_price)
                       begin 
                          state = 2'b10;
                          small_change = 12'd0;
                       end
                end
    end
 end
        
     assign       money = currency;
     assign       goods_money = goods_price;
   /*  assign       GP_money  =  goods_price;
     assign       STATE   =  state;
     assign       change = small_change ;*/
    /*always @(*)
        begin
            money <= currency;
            goods_money <= goods_price;
        end*/
    endmodule
  
    

