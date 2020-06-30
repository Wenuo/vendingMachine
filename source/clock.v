`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/08 11:17:03
// Design Name: 
// Module Name: clock
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


module clock(
    input clk,
    input rst,
    output reg clk_1k
  //  output clk_c
    );
 
 /* reg [3:0] cnt ;
   always @(posedge clk or negedge rst)
            begin
                if(!rst)
                   cnt <= 4'd0;
               else if(cnt == 9)
                  cnt <= 4'd0;
                else
                    cnt <= cnt + 1'b1;
           end
         always @(posedge clk or negedge rst)
            begin
                if(!rst)
                    clk_1k <= 1'b0;
                else if(cnt == 9)
                    clk_1k <= ~clk_1k;
                else
                    clk_1k <= clk_1k ;
            end
        //    assign clk_c = clk_1k;
            */
      
        reg [15:0] cnt;
        always @(posedge clk or negedge rst)
                 begin
                     if(!rst)
                        cnt <= 16'd0;
                     else if(cnt == 16'd49999)
                         cnt <= 16'd0;
                     else
                         cnt <= cnt + 1'b1;
                end
              always @(posedge clk or negedge rst)
                 begin
                     if(!rst)
                         clk_1k <= 1'b0;
                     else if(cnt == 16'd49999)
                         clk_1k <= ~clk_1k;
                     else
                         clk_1k <= clk_1k ;
                 end    
      
endmodule
