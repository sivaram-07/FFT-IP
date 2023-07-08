module fft_wrapper(clk,in_signal,real_power,imag_power,fft_source_sop,sink_sop,sink_eop,sink_valid,fft_source_eop);

input clk;
input wire [11:0] in_signal;


output wire [17:0] real_power;
output wire [17:0] imag_power;


output wire sink_valid;
wire sink_ready;
output wire sink_sop;
output wire sink_eop;
wire [10:0] fft_pts;
output wire fft_source_sop;
output wire fft_source_eop;


wire [11:0] real_to_fft_p;
wire [11:0] imag_to_fft_p;
reg [9:0] count;
reg reset_n;

initial 
begin
reset_n=0;
count = 10'd0;
end


always @(posedge clk)
begin
count = count+10'd1;
if (count == 10'd5)
begin
reset_n = 1;
end
end


//---------------Produce the control signals for the FFT megafunction---------------------------------

control_for_fft control_for_fft_longer_inst(.clk(clk),.insignal(in_signal),.sink_valid(sink_valid),
.sink_ready(sink_ready), .sink_error(),.sink_sop(sink_sop),.sink_eop(sink_eop),.inverse(inverse),.outreal(real_to_fft_p),.outimag(imag_to_fft_p), .fft_pts(fft_pts));
//------------------------------------------------------------------------------------------------------

//---------------Instantiation of the FFT Megafunction------------------------------------------------ 
 fft fft_inst(
  .clk(clk),          //    clk.clk
  .reset_n(reset_n),      //    rst.reset_n
  .sink_valid(sink_valid),   //   sink.sink_valid
  .sink_ready(sink_ready),   //       .sink_ready
  .sink_error(2'b00),   //       .sink_error
  .sink_sop(sink_sop),     //       .sink_sop
  .sink_eop(sink_eop),     //       .sink_eop
  .sink_real(real_to_fft_p),    //       .sink_real
  .sink_imag(imag_to_fft_p),    //       .sink_imag
  .fftpts_in(fft_pts),    //       .fftpts_in
  .inverse(1'b0),      //       FFT
  .source_valid(), // source.source_valid
  .source_ready(1'b1), //       .source_ready
  .source_error(), //       .source_error
  .source_sop(fft_source_sop),   //       .source_sop
  .source_eop(fft_source_eop),   //       .source_eop
  .source_real(real_power),  //       .source_real
  .source_imag(imag_power),  //       .source_imag
  .fftpts_out()    //       .fftpts_out
 );
//-----------------------------------------------------------------------------------------------------
endmodule
