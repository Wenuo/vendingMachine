`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/03 15:47:56
// Design Name: 
// Module Name: cashInput_tb
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


module cashInput_tb(

    );
    reg clk ;
    reg rst;
    reg [5:0] cash_Input;
    wire [11:0] currency;
    wire [5:0] cash_led;
    cashInput cash(.clk(clk),
                   .rst(rst),
                   .cash_Input(cash_Input),
                   .currency(currency),
                   .cash_led(cash_led) 
    );
        always #10 clk =~ clk;
       initial begin
           clk = 0;
           rst = 0;
           cash_Input[0] = 0;
           cash_Input[1] = 0;
           cash_Input[2] = 0;
           cash_Input[3] = 0;
           cash_Input[4] = 0;
           cash_Input[5] = 0;
           #100 rst = 1;
           #100 cash_Input[0] = 1;cash_Input[5] = 1; cash_Input[4] = 1;
          // #10 cash_Input[4] = 0; 
        //   #10 cash_Input[4] = 1;
        //   #10 cash_Input[5]   = 0;
        //   #10 cash_Input[5]   = 1; 
          // #600 goods2 = 1;goods1  = 0; goods3 = 0;goods4 = 0;
          end
endmodule
