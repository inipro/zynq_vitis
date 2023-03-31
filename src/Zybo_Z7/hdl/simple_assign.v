`timescale 1ns / 1ps

module simple_assign(
    input [3:0] sw,
    output [3:0] led
    );
    
    assign led = sw;
    
endmodule
