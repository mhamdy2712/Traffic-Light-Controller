`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 10:25:02 PM
// Design Name: 
// Module Name: Traffic_contoller_top
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


module Traffic_contoller_top(
    input clk,
    input reset_n,
    input Sa,
    input Sb,
    output Ga,
    output Ya,
    output Ra,
    output Gb,
    output Yb,
    output Rb
    );
    wire timer_a,timer_b,reset_timer;
    traffic_controller tc1(
        .clk(clk),
        .reset_n(reset_n),
        .timer_a(timer_a),
        .timer_b(timer_b),
        .reset_timer(reset_timer),
        .Sa(Sa),
        .Sb(Sb),
        .Ga(Ga),
        .Ya(Ya),
        .Ra(Ra),
        .Gb(Gb),
        .Yb(Yb),
        .Rb(Rb) );
    Timer t1(
        .clk(clk),
        .reset_n(reset_timer),
        .done_a(timer_a),
        .done_b(timer_b) );
endmodule
