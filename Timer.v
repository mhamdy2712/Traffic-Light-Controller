`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2023 02:27:01 PM
// Design Name: 
// Module Name: Timer
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


module Timer
#(parameter N=3)(
    input clk,
    input reset_n,
    input [N-1:0] final_value,
    output done
    );
     reg [N-1:0] Q_reg,Q_Next;
    always @(posedge clk,negedge reset_n)
    begin
        if(~reset_n)
            Q_reg<= 'b0;
        else
            Q_reg<=Q_Next;
    end
    always @(*)
    begin
        Q_Next = Q_reg+1;
    end
    assign done = (Q_reg==final_value);
endmodule
