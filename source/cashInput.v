`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/01 14:35:33
// Design Name: 
// Module Name: cashInput
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


module cashInput(
    input clk,
    input rst,
      (* clock_buffer_type = "none"*)  input [5:0] cash_Input,
    output reg [11:0] currency, 
    output  [5:0] cash_led 
    );
    reg [2:0] money_1_yuan   =  3'b0;
    reg [2:0] money_5_yuan   =  3'b0;
    reg [2:0] money_10_yuan  =  3'b0;
    reg [2:0] money_20_yuan  =  3'b0;
    reg [2:0] money_50_yuan  =  3'b0;
    reg [2:0] money_100_yuan =  3'b0;
    reg [7:0] total_amount  = 8'b0;
    always @(posedge cash_Input[0] or negedge rst)
        begin
            if(!rst)
            begin
                money_1_yuan <= 3'd0;
            end
            else if(cash_Input[0])
                        begin
                        money_1_yuan <= money_1_yuan + 1'b1;
                        end    
        end
    always @(posedge cash_Input[1] or negedge rst)
            begin
                if(!rst)
                begin
                    money_5_yuan   <=   3'd0;
                end
                else 
                  begin
                    if(cash_Input[1])
                    begin
                        money_5_yuan    <=  money_5_yuan + 1'b1;
                    end
                  end
            end
    always @(posedge cash_Input[2] or negedge rst)
                  begin
                      if(!rst)
                      begin
                          money_10_yuan   <=   3'd0;
                      end
                      else 
                        begin
                        if(cash_Input[2])
                          begin
                              money_10_yuan    <=  money_10_yuan + 1'b1;
                          end
                         end
                  end
    always @(posedge cash_Input[3] or negedge rst)
                          begin
                              if(!rst)
                              begin
                                  money_20_yuan <= 3'd0;
                              end
                              else 
                                begin
                                   if(cash_Input[3])
                                      begin
                                          money_20_yuan <= money_20_yuan + 1'b1;
                                      end
                                 end
                          end
    always @(posedge cash_Input[4] or negedge rst)
                   begin
                         if(!rst)
                         begin
                                 money_50_yuan   <=   3'd0; 
                         end
                         else 
                         begin
                            if(cash_Input[4])
                                begin
                                     money_50_yuan    <=  money_50_yuan + 1'b1;
                                end
                          end
                   end
    always @(posedge cash_Input[5] or negedge rst)
                   begin
                        if(!rst)
                            begin
                                  money_100_yuan   <=   4'd0;
                            end
                         else 
                         begin
                            if(cash_Input[5])
                                  begin
                                         money_100_yuan    <=  money_100_yuan + 1'b1;
                                    end
                               end
                         end        
   always @(posedge clk or negedge rst)
    begin
        if(!rst)
            total_amount <= 0;
        else
        begin
         total_amount   =  money_1_yuan + money_5_yuan *5 + money_10_yuan * 10 + money_20_yuan *20 + money_50_yuan*50 + money_100_yuan *100;
        end
       end
        integer i ;
    always @(total_amount)
        begin
            currency = 12'd0;
                for (i = 7; i>=0; i = i-1)
                    begin
                        if(currency[11:8]   >= 5)
                            currency[11:8] = currency[11:8] +3;
                        if(currency[7:4] >= 5)
                            currency[7:4] = currency[7:4] + 3;
                        if(currency[3:0] >= 5)
                            currency[3:0] = currency[3:0] + 3; 
                        currency[11:8] = currency[11:8] << 1;
                        currency[8] = currency[7];
                        currency[7:4] = currency[7:4] << 1;
                        currency[4] = currency[3];
                        currency[3:0] = currency[3:0] << 1;
                        currency[0] = total_amount[i];   
                    end
        end
        assign cash_led = cash_Input;
endmodule
