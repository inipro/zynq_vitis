`timescale 1ns / 1ps

module led_counter(
    input clk,
    output [7:0] pmod_a
    );
    
    reg [27:0] cnt;
    
    always @(posedge clk) begin
        cnt <= cnt + 1;
    end
    
    assign pmod_a = cnt[27:20];
    
endmodule
