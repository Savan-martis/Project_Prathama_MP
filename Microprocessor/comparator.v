module comparator(cs_cmp,clk,a,b,cout,z_flag,ready);
input a,b,cs_cmp,clk;
output reg ready,cout,z_flag;
integer state;
always@(posedge clk)
begin
case(state)
0:begin
if(cs_cmp)
state=1;
else
state=0;
end
1:begin
if(a>b)
state=2;
else if (a==b)
state=3;
else
state=4;
end
2:state=0;
3:state=0;
4:state=0;
endcase
end

always@(state)
begin
case(state)
0:ready=1;
1:ready=0;
2:begin
cout=1;
z_flag=0;
end
3:begin
cout=0;
z_flag=1;
end
4:begin
cout=0;
z_flag=0;
end
endcase
end
endmodule
