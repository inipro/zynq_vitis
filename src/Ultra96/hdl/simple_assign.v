`timescale 1ns / 1ps

module simple_assign(
    input [7:0] pmod_c,
    output [7:0] pmod_a
    );
    
    assign pmod_a = pmod_c;
    
endmodule
