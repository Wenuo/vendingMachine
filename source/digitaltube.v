`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/03 22:24:55
// Design Name: 
// Module Name: digitaltube
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


module digitaltube(
  input clk,
  input rst,
  input [7:0]goods_money,
  input [11:0] money,
  input [11:0] small_change,
  input [1:0] state,
  output reg [6:0] duan,
  output reg [6:0] duan1,
  output reg [1:0] digital_tube_goods,
  output reg [2:0] digital_tube_cash,
  output reg [2:0] digital_tube_change
    );
    reg [19:0] cnt;
    reg [2:0]  goods_wei ;
    reg [3:0]  Dn;
    reg [3:0]  Dn2;
    reg [7:0]  wei;
    always @(posedge clk or negedge rst)
        begin
            if(!rst)
                goods_wei <= 3'b0;
            else
            begin
                goods_wei <= goods_wei +1'b1; 
                            if(goods_wei == 3'd7)
                                     goods_wei <= 3'b0;
             end    
        end
   always @(posedge clk or negedge rst)
            if(!rst)
                cnt <= 0;
            else
                cnt <= cnt+1;     
    always @(posedge clk or negedge rst)
        begin
            if(!rst)
                begin
                    digital_tube_goods <= 2'b11;
                    digital_tube_cash <= 3'b111;
                    digital_tube_change <= 3'b111;
                end
            else
                begin      
                    case (goods_wei)
                        3'b000: begin   digital_tube_goods  <= 2'b01;   digital_tube_cash   <= 3'b000;digital_tube_change <= 3'b000;end
                        3'b001: begin   digital_tube_goods  <= 2'b10;   digital_tube_cash   <= 3'b000;digital_tube_change <= 3'b000;end
                        3'b010: begin   digital_tube_cash   <= 3'b001;  digital_tube_change <= 3'b000;digital_tube_goods  <= 2'b00;end
                        3'b011: begin   digital_tube_cash   <= 3'b010;  digital_tube_change <= 3'b000;digital_tube_goods  <= 2'b00;end
                        3'b100: begin   digital_tube_cash   <= 3'b100;  digital_tube_change <= 3'b000;digital_tube_goods  <= 2'b00;end
                        3'b101: begin   digital_tube_change <= 3'b001; digital_tube_cash   <= 3'b000;digital_tube_goods  <= 2'b00;end
                        3'b110: begin   digital_tube_change <= 3'b010;  digital_tube_cash   <= 3'b000;digital_tube_goods  <= 2'b00; end
                        3'b111: begin digital_tube_change <= 3'b100;  digital_tube_cash   <= 3'b000;digital_tube_goods  <= 2'b00;end
                        default: begin digital_tube_goods <= 2'b00;digital_tube_cash <= 3'b000;digital_tube_change <= 3'b000;end              
                    endcase 
                    wei <= {digital_tube_change,digital_tube_cash,digital_tube_goods};
                end
        end
        
        always @(posedge clk or negedge rst)
            begin
                if(!rst)
                    begin
                        Dn <= 0;
                        Dn2 <= 0;
                    end
                 else
                    begin
                        case(wei)
                            8'b0000_0001:Dn <= goods_money[3:0];
                            8'b0000_0010:Dn <= goods_money[7:4];
                            8'b0000_0100:Dn <= money[3:0];
                            8'b0000_1000:Dn <= money[7:4];
                            8'b0001_0000:Dn2 <= money[11:8];
                            8'b0010_0000:begin 
                                                        if(state == 2'b00)
                                                                Dn2 <= small_change[3:0];
                                                        else
                                                                Dn2 <= 4'b0000;
                                                     end
                            8'b0100_0000:begin
                                                        if(state == 2'b00)
                                                            Dn2 <= small_change[7:4];
                                                        else
                                                            Dn2 <= 4'b0000;
                                                    end
                           8'b1000_0000:begin
                                                         if(state == 2'b00)
                                                                 Dn2 <= small_change[11:8];
                                                         else
                                                                 Dn2 <= 4'b0000;
                                                    end
                        default;
                        endcase
                    end
            end
            
           always @(posedge clk or negedge rst)
            begin
                if(!rst)
                    begin
                    duan <= 7'b1111111;
                    duan1 <= 7'b1111111;
                    end
               else
                    begin
                        case(Dn)
                            4'b0000: begin duan =    7'b1111_110; end 
                            4'b0001: begin duan =    7'b0110_000; end  
                            4'b0010: begin duan =    7'b1101_101; end   
                            4'b0011: begin duan =    7'b1111_001; end   
                            4'b0100: begin duan =    7'b0110_011; end 
                            4'b0101: begin duan =    7'b1011_011; end 
                            4'b0110: begin duan =    7'b1011_111; end   
                            4'b0111: begin duan =    7'b1110_000; end  
                            4'b1000: begin duan =    7'b1111_111; end 
                            4'b1001: begin duan =    7'b1111_011; end   
                         default: begin duan =    7'b1111_111; end  
                        endcase
                        case(Dn2)
                            4'b0000: begin duan1 =    7'b1111_110; end  
                            4'b0001: begin duan1 =    7'b0110_000; end 
                            4'b0010: begin duan1 =    7'b1101_101; end   
                            4'b0011: begin duan1 =    7'b1111_001; end  
                            4'b0100: begin duan1 =    7'b0110_011; end 
                            4'b0101: begin duan1 =    7'b1011_011; end
                            4'b0110: begin duan1 =    7'b1011_111; end  
                            4'b0111: begin duan1 =    7'b1110_000; end   
                            4'b1000: begin duan1 =    7'b1111_111; end 
                            4'b1001: begin duan1 =    7'b1111_011; end   
                         default: begin duan1 =    7'b1111_111; end  
                        endcase
                    end
            
            end
endmodule
