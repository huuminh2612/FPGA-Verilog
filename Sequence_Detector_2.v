//code sq2

module sequence_detector_2(
  input wire w, clk, reset,
  output reg z
);
  localparam [2:0] s0 = 3'b000, // 00
                   s1 = 3'b001, // 01
                   s2 = 3'b010, // 10
                   s3 = 3'b011, // 11
                   s4 = 3'b100; // 100
                 
  reg [2:0] state_reg, state_next;
  //next stare_logic
  always @(posedge clk)
    if (reset) begin
      state_reg <= s0;
    end 
    else 
      state_reg <= state_next;
  //register state
  always @*
    case(state_reg)
      s0: begin 
       if(w)
         state_next = s1;
       else 
         state_next = state_reg;
      end
      s1: 
      begin 
      if(w)
        state_next = state_reg;
      else
        state_next = s2;
      end
      s2:
      begin 
      if (w) 
        state_next = s4;
      else
        state_next = s3;
      end 
      s3:
      begin
        if (w)
          state_next = s4;
        else 
          state_next = s0;
      end 
      s4:
      begin 
        if(w) begin 
          state_next = s1;
        end 
        else begin 
          state_next = s2;
        end 
      end 
    endcase
   //output
  assign z = (state_reg == s4) ? 1 : 0;
endmodule
