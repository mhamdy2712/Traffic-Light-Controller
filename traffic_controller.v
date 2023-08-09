`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 10:00:29 PM
// Design Name: 
// Module Name: traffic_controller
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


module traffic_controller(
    input clk,
    input reset_n,
    input Sa,
    input Sb,
    input timer_a,timer_b,
    output reset_timer,
    output Ga,
    output Ya,
    output Ra,
    output Gb,
    output Yb,
    output Rb
    );
    parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5;
    reg [2:0] curr_state,next_state;
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
        begin
            curr_state <= s0;
        end
        else
            curr_state <= next_state;
    end
    always @(*)
    begin
        case(curr_state)
            s0: begin
                    if(~timer_a)
                        next_state = s0;
                    else if(Sb)
                        next_state = s1;
                    else
                        next_state = s2;
                end
            s1: begin
                    next_state = s3;
                end
            s2: begin
                    if(~Sb)
                        next_state = s2;
                    else
                        next_state = s1;
                end
            s3: begin
                    if(~timer_b)
                        next_state = s3;
                    else if (~Sa && Sb)
                        next_state = s5;
                    else
                        next_state = s4;   
                end
            s4: next_state = s0;
            s5: begin
                    if(~Sa && Sb)
                        next_state = s5;
                    else
                        next_state = s4;
                end
        endcase
    end
    assign reset_timer = (curr_state == s0 || curr_state == s3) && reset_n ;
    assign Ga = curr_state == s0 || curr_state == s2 ;
    assign Ya = curr_state == s1 ;
    assign Ra = curr_state == s3 || curr_state == s4 || curr_state == s5 ;
    assign Gb = curr_state == s3 || curr_state == s5 ;
    assign Yb = curr_state == s4 ;
    assign Rb = curr_state == s0 || curr_state == s1 || curr_state == s2 ;
endmodule
