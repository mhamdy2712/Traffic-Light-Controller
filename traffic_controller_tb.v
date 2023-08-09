`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 10:33:53 PM
// Design Name: 
// Module Name: traffic_controller_tb
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


module traffic_controller_tb(

    );
    parameter clk_cycle = 10000;
    reg Sa,Sb,reset_n=1;
    wire Ga,Ya,Ra,Gb,Yb,Rb;
    reg clk=0;
    always begin
        clk=0;
        #(0.5*clk_cycle);
        clk=1;
        #(0.5*clk_cycle);
    end
    Traffic_contoller_top tct (
        .clk(clk),
        .reset_n(reset_n),
        .Sa(Sa),
        .Sb(Sb),
        .Ga(Ga),
        .Ya(Ya),
        .Ra(Ra),
        .Gb(Gb),
        .Yb(Yb),
        .Rb(Rb) );
    initial begin
        Sa=1;
        Sb=0;
        reset_n = 0;
        #(0.5*clk_cycle);
        reset_n = 1;
    end
endmodule
