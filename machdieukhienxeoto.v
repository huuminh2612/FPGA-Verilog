//code mach dieu khien xe o to
module machdieukhienxeoto (
     input wire brake,accelerate,clk,reset,
     output reg [1:0] w
);
// sate
     reg [1:0] next_state, reg_state;
     localparam [1:0] stop = 2'b00 ,
                      slow = 2'b01 , 
                      medimu = 2'b10 , 
                      fast = 2'b11;
// next - state
      always @(posedge clk, posedge reset)
      if (reset)
           reg_state <= stop;
      else
           reg_state <= next_state;
// logic state  
       always @(accelerate or brake or next_state or reg_state)
       case (w)
            stop : begin
                   begin
                   if (accelerate) 
                        next_state <= slow;
                   else
                        next_state <= stop;
                   end
                   w = 2'b00;
                   end
             slow : begin
                    begin
                    if (brake)
                        next_state <= stop;
                    else begin
                        if (~accelerate)
                             next_state <= slow;
                        else
                             next_state <= medimu;
                         end
                     end
                   w = 2'b01;
                   end
             medimu : begin
                      begin
                      if (brake)
                        next_state <= slow;
                      else begin
                        if (~accelerate)
                             next_state <= medimu;
                         else
                             next_state <= fast;
                          end
                       end  
                   w = 2'b10;
                   end
             fast : begin
                    begin
                     if (brake) 
                         next_state <= medimu;
                     else 
                         next_state <= fast;
                     end
                   w = 2'b11;
                   end
             default:
                     reg_state <= stop;
             endcase
// output
endmodule   
                 