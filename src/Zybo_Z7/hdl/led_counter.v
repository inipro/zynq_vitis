`timescale 1ns / 1ps

module led_counter(
    input sysclk,
    output [3:0] led
    );
    
    reg [27:0] cnt;
    
    always @(posedge sysclk) begin
        cnt <= cnt + 1;
    end
    
    assign led = cnt[27:24];
    
endmodule
