//单bit跨时钟域:slow to fast
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
//单bit跨时钟域:fast to slow;
module slow2fast_cdc(
input i_clk_s ,
input i_pluse_s ,
input i_clk_f,
output o_pluse_f
)
  //展宽快时钟域的信号；
  reg [2:0]r_pluse_d ;
  always@(i_clk_f)begin
    r_pluse_d <= {r_pluse_d[1,0] , i_pluse_f }; 
  end
    wire w_pluse_d = | r_pluse_d ; //完成展宽；
reg r_pluse_d0 ;//恢复到slow2fast的处理；
reg r_pluse_d1 ;
r_pluse_do <= w_pluse_d ;
r_pluse_d1 <= r_pluse_d0;
end
assign o_pluse_f = r_pluse_d1 ;
endmodule 
