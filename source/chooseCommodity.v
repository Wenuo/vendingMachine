`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 11:08:39
// Design Name: 
// Module Name: chooseCommodity
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


module chooseCommodity(
    input clk,
    input rst,
    input [3:0] goods,
    output  reg [7:0] goods_price,
    output  [3:0] goods_num,
    output  [7:0] GP
    );
    reg [3:0] num;
    reg [2:0] select_goods;
    reg [3:0] price;
        always @(posedge clk or negedge rst)
        begin
            if(!rst)
                num <= 4'd0;
            else
                num <= {goods[3],goods[2],goods[1],goods[0]};
        end
       always @(negedge rst or num)
        begin
            if(!rst)
                begin
                   // goods_num   <= 4'd0;
                    price <= 4'd0;
                end
            else if (price > 0)
                price <= price; 
            else
                begin
                      case (num)
                          4'b0000:begin price <=   4'b0000;  end// goods_num <= 4'b0000; end
                          4'b0001:begin price <=   4'b0010;  end// goods_num <= 4'b0001; end     //2yuan
                          4'b0010:begin price <=   4'b0101;  end// goods_num <= 4'b0010; end     //5yuan
                          4'b0100:begin price <=   4'b0111;  end// goods_num <= 4'b0100; end    //7Ԫ
                          4'b1000:begin price <=   4'b1010;  end// goods_num <= 4'b1000; end  //10Ԫ
                          default:begin price <=   4'b0000;  end// goods_num <= 4'b0000; end
                       endcase
                end
            end
 integer i ;
        always @(price)
            begin
                goods_price = 8'd0;
                  for (i = 3; i>=0; i = i-1)
                         begin
                             if(goods_price[7:4]   >= 5)
                                 goods_price[7:4] = goods_price[7:4] +3;
                             if(goods_price[3:0] >= 5)
                                 goods_price[3:0] = goods_price[3:0] + 3;
                             goods_price[7:4] = goods_price[7:4] << 1;
                             goods_price[4] = goods_price[3];
                             goods_price[3:0] = goods_price[3:0] << 1;
                             goods_price[0] = price[i];   
                         end
            end
            assign goods_num = goods;
            assign GP = price;
         //   assign goods_price = price;
endmodule
