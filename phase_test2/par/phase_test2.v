
module phase_test2(     //顶层模块
     input  sys_clk,
	  input  sys_rst_n,
	  input  key,
	  output locked,//ip核稳定信号  led1灯亮
	  output o_phase_ok, //测量结果有效led3 灯亮
	  output o_phase_fup_flag,//先检测到上升沿 为1 就是 信号一的上升沿  led4灯亮
	  output  uart_txd //UART发送端口
);



wire rst_n;
wire [7:0]phase_data;
wire  clk_50m;
wire  clk_50m_90deg;

assign rst_n=sys_rst_n&locked;


pll_clk u_pll_clk(       //例化pll ip核
   
	.areset   (~sys_rst_n),
	.inclk0   (sys_clk),
	.c0       (clk_50m_90deg),
	.c1       (clk_50m),
	.locked   (locked)
	
);

phase_diff_detect u_phase_diff_detect(

   .i_clk      (sys_clk),
	.i_rstn     (sys_rst_n),
	.i_sig1     (clk_50m_90deg),
	.i_sig2     (clk_50m),
	.o_data     (phase_data),	//输出数据

   .o_flag     (o_phase_fup_flag),//超前滞后标志位 ，当为1 ，sig1上升沿先到来，sig1 超前sig2
   .o_data_ok  (o_phase_ok)
	);




uart_send u_uart_send(
.sys_clk     (sys_clk),//系统时钟 
.sys_rst_n   (sys_rst_n),//系统复位，低电平有效 
 
.uart_en     (key), //发送使能信号 
.uart_din    (phase_data),//待发送数据 
.uart_txd    (uart_txd),//UART发送端口 

);

endmodule


//测量两路信号相位差
//要求两路信号除相位不同外，其他信息必须完全一致

module phase_diff_detect
(
	input i_clk,	//输入标准时钟
	input i_rstn,	//输入复位信号
	
	input i_sig1,	//输入待测信号1
	input i_sig2,	//输入待测信号2
	output o_data_ok,	//输出数据有效
	output [7:0]o_data,	//输出数据
	//output o_en,   //使能信号
	output o_flag

);

//r_sig1 输入信号1寄存器
//将输入信号1与系统时钟同步化
reg r_sig1;
always @(posedge i_clk)
	if(!i_rstn)
		r_sig1<=0;
	else
		r_sig1<=i_sig1;

//r_sig2 输入信号2寄存器
//将输入信号2与系统时钟同步化
reg r_sig2;
always @(posedge i_clk)
	if(!i_rstn)
		r_sig2<=0;
	else
		r_sig2<=i_sig2;
		
//r_rstn 复位信号寄存器
//用于检测复位信号的变化沿		
reg r_rstn;
always @(posedge i_clk)
	r_rstn <= i_rstn;
	
//r_start1输入信号1上升沿寄存器
reg r_start1;
always @(posedge i_clk)
	if(!i_rstn)
	   begin
		r_start1<=0;
		end
	else
	   begin
		r_start1<=(i_sig1 ==1 && r_sig1 == 0 && r_rstn == 1) ? 'b1 :'b0;//上升沿
		
      end
//r_start2输入信号2上升沿寄存器		
reg r_start2;
always @(posedge i_clk)
	if(!i_rstn)
		r_start2<=0;
	else
		r_start2<=(i_sig2 ==1 && r_sig2 == 0 && r_rstn == 1) ? 'b1 :'b0;//上升沿
		
		

//r_data数据寄存器
reg [7:0] r_data;

//r_detect_avail 测量相位差计时允许开关
//当处于两个信号上升沿之间时开关打开，其他情况下开关关闭
reg r_detect_avail;
reg prv_detect;
reg r_en;	
always @(posedge i_clk)
	begin
	if(!i_rstn)begin
		r_detect_avail<=0 ;
		
		end
	else
		if(r_start1 && r_data == 0)
			r_detect_avail <= 1 ;
		else if(r_start2)
			r_detect_avail <= 0	;
		else
		begin
			r_detect_avail <= r_detect_avail ;
		end	
     
	  prv_detect <=r_detect_avail;
	  if(!i_rstn)
	 	r_en<=0;
	 else if(r_detect_avail==0&&prv_detect==1) // 检测上升沿
	  begin
	  r_en<=1;
     end
	  end


     
//相位差计时
always @(posedge i_clk)
	if(!i_rstn)
		r_data<=8'd0 ;
	else
		if(r_detect_avail)
			r_data <= r_data + 1'd1;
			

reg 	clk_fb_prv;	
reg 	clk_ref_prv;
reg   have_flag;
reg   flag_ok;
always @(posedge i_clk) begin
    clk_fb_prv <= i_sig1;
    clk_ref_prv <=i_sig2;
	 if(!i_rstn)begin
	 flag_ok<=0;
	 have_flag<=0;
	 end
    else 
	 if(i_sig1==1&&clk_fb_prv==0&&!flag_ok) begin //判断反馈信号的上升沿
        have_flag <= 1;
		  flag_ok<=1;
        end
    else if(i_sig2==1&&clk_ref_prv==0&&!flag_ok) begin  //判断参考信号的上升沿
        have_flag <= 0;
		  flag_ok<=1;
        end
   else 
       have_flag <= have_flag;

end
		
			
//测量时输出无效、不测量时输出有效
assign o_data_ok = r_detect_avail ? 'b0 : 'b1;

assign o_data = r_data;

assign o_flag = have_flag;
assign o_en = r_en;



endmodule

//串口发送模块
module uart_send( 
input sys_clk, //系统时钟 
input sys_rst_n, //系统复位，低电平有效 
 
input uart_en, //发送使能信号 
input [7:0] uart_din, //待发送数据 
output reg uart_txd //UART发送端口 
); 
//parameter define 
 parameter CLK_FREQ = 50000000; //系统时钟频率 
 parameter UART_BPS = 115200; //串口波特率 
 localparam BPS_CNT = CLK_FREQ/UART_BPS; //为得到指定波特率，对系统时钟计数BPS_CNT次 
 //reg define 
reg uart_en_d0; 
reg uart_en_d1; 
reg [15:0] clk_cnt; //系统时钟计数器 
 reg [ 3:0] tx_cnt; //发送数据计数器 
reg tx_flag; //发送过程标志信号 
reg [ 7:0] tx_data; //寄存发送数据 
 
 //wire define 
wire en_flag; 
 
 //***************************************************** 
 //** main code 
 //***************************************************** 
 //捕获uart_en上升沿，得到一个时钟周期的脉冲信号 
 assign en_flag = (~uart_en_d1) & uart_en_d0; 
 
 //对发送使能信号uart_en延迟两个时钟周期 
 always @(posedge sys_clk or negedge sys_rst_n) begin 
 if (!sys_rst_n) begin 
 uart_en_d0 <= 1'b0; 
 uart_en_d1 <= 1'b0; 
 end 
 else begin 
 uart_en_d0 <= uart_en; 
 uart_en_d1 <= uart_en_d0; 
 end 
 end 
 
 //当脉冲信号en_flag到达时,寄存待发送的数据，并进入发送过程 
 always @(posedge sys_clk or negedge sys_rst_n) begin 
 if (!sys_rst_n) begin 
 tx_flag <= 1'b0; 
 tx_data <= 8'd0; 
 end 
 else if (en_flag) begin //检测到发送使能上升沿 
 tx_flag <= 1'b1; //进入发送过程，标志位tx_flag拉高 
 tx_data <= uart_din; //寄存待发送的数据 
 end 
 else 
 if ((tx_cnt == 4'd9)&&(clk_cnt == BPS_CNT/2)) 
 begin //计数到停止位中间时，停止发送过程 
 tx_flag <= 1'b0; //发送过程结束，标志位tx_flag拉低 
 tx_data <= 8'd0; 
 end 
 else begin 
 tx_flag <= tx_flag; 
 tx_data <= tx_data; 
 end 
 end 
 
 //进入发送过程后，启动系统时钟计数器与发送数据计数器 
 always @(posedge sys_clk or negedge sys_rst_n) begin 
 if (!sys_rst_n) begin 
 clk_cnt <= 16'd0; 
 tx_cnt <= 4'd0; 
 end 
 else if (tx_flag) begin //处于发送过程 
 if (clk_cnt < BPS_CNT - 1) begin 
 clk_cnt <= clk_cnt + 1'b1; 
 tx_cnt <= tx_cnt; 
 end 
 else begin 
 clk_cnt <= 16'd0; //对系统时钟计数达一个波特率周期后清零 
 tx_cnt <= tx_cnt + 1'b1; //此时发送数据计数器加1 
 end 
 end 
 else begin //发送过程结束 
 clk_cnt <= 16'd0; 
 tx_cnt <= 4'd0; 
 end 
 end 



//根据发送数据计数器来给uart发送端口赋值 
always @(posedge sys_clk or negedge sys_rst_n) begin 
if (!sys_rst_n) 
uart_txd <= 1'b1; 
else if (tx_flag) 
case(tx_cnt) 
4'd0: uart_txd <= 1'b0; //起始位 
4'd1: uart_txd <= tx_data[0]; //数据位最低位 
4'd2: uart_txd <= tx_data[1]; 
4'd3: uart_txd <= tx_data[2]; 
4'd4: uart_txd <= tx_data[3]; 
4'd5: uart_txd <= tx_data[4]; 
 4'd6: uart_txd <= tx_data[5]; 
 4'd7: uart_txd <= tx_data[6]; 
 4'd8: uart_txd <= tx_data[7]; //数据位最高位 
 4'd9: uart_txd <= 1'b1; //停止位 
 default: ; 
 endcase 
 else 
 uart_txd <= 1'b1; //空闲时发送端口为高电平 
 end 
 
 endmodule


