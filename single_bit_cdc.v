//单bit跨时钟域
module slow2fast_cdc(
input i_clk_s ,
input i_pluse_s ,
input i_clk_f,
output o_pluse_f
)
reg r_pluse_d0 ;
reg r_pluse_d1 ;
  always@( posedge i_clk_f)begin//fast时钟域的频率超过slow时钟域的频率两倍以上；打两拍
r_pluse_do <= i_pluse_s ;
r_pluse_d1 <= r_pluse_d0;
end
assign o_pluse_f = r_pluse_d1 ;
endmodule 
