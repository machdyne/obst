// OBST BLINKY

module blinky #()
(

	input CLK_48,

	output led_r,
	output led_g,
	output led_b,

);

	reg [28:0] counter = 0;

   assign {led_r, led_g, led_b} = ~counter[26:24];

   always @(posedge CLK_48) begin
      counter <= counter + 1;
   end

endmodule
