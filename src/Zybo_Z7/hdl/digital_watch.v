`timescale 1ns / 1ps

module digital_watch(
	input sysclk,
	output reg [7:0] jc,jd
    );
	 
	reg [30:0] cnt;
	reg [2:0] seg_state;
	reg [3:0] sec0,sec1,min0,min1,ssd_a,ssd_b;

	always@(posedge sysclk)
	begin
		cnt <= cnt+1;		
		if(cnt == 124999999) begin
			cnt <= 0;
			sec0 <= sec0 + 1;
			if (sec0 == 9)	begin
				sec0 <= 0;
				sec1 <= sec1 + 1;
				if (sec1 == 5)	begin
					sec1 <= 0;
					min0 <= min0 + 1;
					if (min0 == 9)	begin
						min0 <= 0;
						min1 <= min1 + 1'b1;
						if (min1 == 5)	begin
							min1 <= 0;
						end
					end
				end
			end		
		end
	end
	
	always@(posedge cnt[15])
	begin
		seg_state <= seg_state + 1;
	end
               
	always@(seg_state[0], sec0, sec1, min0, min1)
	begin
		case(seg_state[0])
			1'b0 : begin
				ssd_b <= sec0;
				ssd_a <= min0;
			end
			default : begin	
				ssd_b <= sec1;
                ssd_a <= min1;
			end
		endcase 
	end
	
	always@(ssd_a, seg_state)
	begin
	   jd[7] <= seg_state[0];
	   case(ssd_a)
		    4'h0 : jd[6:0] = 7'b0111111;
			4'h1 : jd[6:0] = 7'b0000110;
			4'h2 : jd[6:0] = 7'b1011011;
			4'h3 : jd[6:0] = 7'b1001111;
			4'h4 : jd[6:0] = 7'b1100110;
			4'h5 : jd[6:0] = 7'b1101101;
			4'h6 : jd[6:0] = 7'b1111101;
			4'h7 : jd[6:0] = 7'b0100111;
			4'h8 : jd[6:0] = 7'b1111111;
			4'h9 : jd[6:0] = 7'b1101111;		
			default : jd[6:0] = 7'b0000000;
		endcase
	end
	
	always@(ssd_b,seg_state)
    begin
       jc[7] = seg_state[0];
        case(ssd_b)
            4'h0 : jc[6:0] = 7'b0111111;
            4'h1 : jc[6:0] = 7'b0000110;
            4'h2 : jc[6:0] = 7'b1011011;
            4'h3 : jc[6:0] = 7'b1001111;
            4'h4 : jc[6:0] = 7'b1100110;
            4'h5 : jc[6:0] = 7'b1101101;
            4'h6 : jc[6:0] = 7'b1111101;
            4'h7 : jc[6:0] = 7'b0100111;
            4'h8 : jc[6:0] = 7'b1111111;
            4'h9 : jc[6:0] = 7'b1101111;        
            default : jc[6:0] = 7'b0000000;
        endcase
    end    
	
endmodule