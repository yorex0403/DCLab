module DE2_115(
	input CLOCK_50,
	input CLOCK2_50,
	input CLOCK3_50,
	input ENETCLK_25,
	input SMA_CLKIN,
	output SMA_CLKOUT,
	output [8:0] LEDG,
	output [17:0] LEDR,
	input [3:0] KEY,
	input [17:0] SW,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [6:0] HEX6,
	output [6:0] HEX7,
	output LCD_BLON,
	inout [7:0] LCD_DATA,
	output LCD_EN,
	output LCD_ON,
	output LCD_RS,
	output LCD_RW,
	output UART_CTS,
	input UART_RTS,
	input UART_RXD,
	output UART_TXD,
	inout PS2_CLK,
	inout PS2_DAT,
	inout PS2_CLK2,
	inout PS2_DAT2,
	output SD_CLK,
	inout SD_CMD,
	inout [3:0] SD_DAT,
	input SD_WP_N,
	output [7:0] VGA_B,
	output VGA_BLANK_N,
	output VGA_CLK,
	output [7:0] VGA_G,
	output VGA_HS,
	output [7:0] VGA_R,
	output VGA_SYNC_N,
	output VGA_VS,
	input AUD_ADCDAT,
	inout AUD_ADCLRCK,
	inout AUD_BCLK,
	output AUD_DACDAT,
	// inout AUD_DACLRCK,
	input AUD_DACLRCK,
	output AUD_XCK,
	output EEP_I2C_SCLK,
	inout EEP_I2C_SDAT,
	output I2C_SCLK,
	inout I2C_SDAT,
	output ENET0_GTX_CLK,
	input ENET0_INT_N,
	output ENET0_MDC,
	input ENET0_MDIO,
	output ENET0_RST_N,
	input ENET0_RX_CLK,
	input ENET0_RX_COL,
	input ENET0_RX_CRS,
	input [3:0] ENET0_RX_DATA,
	input ENET0_RX_DV,
	input ENET0_RX_ER,
	input ENET0_TX_CLK,
	output [3:0] ENET0_TX_DATA,
	output ENET0_TX_EN,
	output ENET0_TX_ER,
	input ENET0_LINK100,
	output ENET1_GTX_CLK,
	input ENET1_INT_N,
	output ENET1_MDC,
	input ENET1_MDIO,
	output ENET1_RST_N,
	input ENET1_RX_CLK,
	input ENET1_RX_COL,
	input ENET1_RX_CRS,
	input [3:0] ENET1_RX_DATA,
	input ENET1_RX_DV,
	input ENET1_RX_ER,
	input ENET1_TX_CLK,
	output [3:0] ENET1_TX_DATA,
	output ENET1_TX_EN,
	output ENET1_TX_ER,
	input ENET1_LINK100,
	input TD_CLK27,
	input [7:0] TD_DATA,
	input TD_HS,
	output TD_RESET_N,
	input TD_VS,
	inout [15:0] OTG_DATA,
	output [1:0] OTG_ADDR,
	output OTG_CS_N,
	output OTG_WR_N,
	output OTG_RD_N,
	input OTG_INT,
	output OTG_RST_N,
	input IRDA_RXD,
	output [12:0] DRAM_ADDR,
	output [1:0] DRAM_BA,
	output DRAM_CAS_N,
	output DRAM_CKE,
	output DRAM_CLK,
	output DRAM_CS_N,
	inout [31:0] DRAM_DQ,
	output [3:0] DRAM_DQM,
	output DRAM_RAS_N,
	output DRAM_WE_N,
	output [19:0] SRAM_ADDR,
	output SRAM_CE_N,
	inout [15:0] SRAM_DQ,
	output SRAM_LB_N,
	output SRAM_OE_N,
	output SRAM_UB_N,
	output SRAM_WE_N,
	output [22:0] FL_ADDR,
	output FL_CE_N,
	inout [7:0] FL_DQ,
	output FL_OE_N,
	output FL_RST_N,
	input FL_RY,
	output FL_WE_N,
	output FL_WP_N,
	inout [35:0] GPIO,
	input HSMC_CLKIN_P1,
	input HSMC_CLKIN_P2,
	input HSMC_CLKIN0,
	output HSMC_CLKOUT_P1,
	output HSMC_CLKOUT_P2,
	output HSMC_CLKOUT0,
	inout [3:0] HSMC_D,
	input [16:0] HSMC_RX_D_P,
	output [16:0] HSMC_TX_D_P,
	inout [6:0] EX_IO
);
/*	// inout port at this layer
	logic i2c_oen, i2c_sdat;
	logic [15:0] sram_wdata;
	assign I2C_SDAT = i2c_oen ? i2c_sdat : 1'bz;
	assign SRAM_DQ = // TODO ;
	// TODO: Add PLL to generate a 100kHz clock (Google is your friend) 
	I2CSender u_i2c(
		// .i_clk(pll_clk),
		.i_rst(KEY[0]),
		.o_sclk(I2C_SCLK),
		.o_sdat(i2c_sdat),
		// you are outputing (you are not outputing only when you are "ack"ing.)
		.o_oen(i2c_oen)
	);
	// And add your module here, it roughly looks like this
	YourModule u_your_module(
		.i_clk(AUD_BCLK),
		.i_rst(KEY[0]),
		.i_adc_dat(AUD_ADCDAT),
		.i_adc_clk(AUD_ADCLRCK),
		.o_dac_dat(AUD_DACDAT),
		.i_dac_clk(AUD_DACLRCK),
		.o_sram_adr(SRAM_ADDR),
		.o_sram_rdata(SRAM_DQ),
		.i_sram_wdata(sram_wdata),
		.o_sram_cen(SRAM_CE_N),
		.o_sram_lb(SRAM_LB_N),
		.o_sram_ue(SRAM_UB_N),
		.o_sram_oe(SRAM_OE_N),
		.o_sram_we(SRAM_WE_N)
	);
*/
	logic clk12M, clk32k;
	logic locked;
	logic key0, key1, key2, key3;

	my_pll pll0(
		.inclk0(CLOCK_50),
		.c0(AUD_XCK),   // 12 MHz
		.c1(clk100k)	// 100 kHz
	);

	Debounce deb0(
		.i_in(KEY[0]),
		.i_clk(AUD_BCLK),
		.o_neg(key0)
	);
	Debounce deb1(
		.i_in(KEY[1]),
		.i_clk(AUD_BCLK),
		.o_neg(key1)
	);
	Debounce deb2(
		.i_in(KEY[2]),
		.i_clk(AUD_BCLK),
		.o_neg(key2)
	);
	Debounce deb3(
		.i_in(KEY[3]),
		.i_clk(AUD_BCLK),
		.o_neg(key3)
	);

	top top(
		.i_clk(AUD_BCLK),
		.i_clk2(clk100k),
		.i_rst(SW[2]),
		.i_play(key0),
		.i_stop(key1),
		.i_speed_up(key2),
		.i_speed_down(key3),	
		.i_mode(SW[0]),		
		.i_interpol(SW[1]),	
		.LEDG(LEDG),
		.LEDR(LEDR),


		.o_SRAM_ADDR(SRAM_ADDR),
		.o_SRAM_CE_N(SRAM_CE_N),
		.SRAM_DQ(SRAM_DQ),
		.o_SRAM_LB_N(SRAM_LB_N),
		.o_SRAM_OE_N(SRAM_OE_N),
		.o_SRAM_UB_N(SRAM_UB_N),
		.o_SRAM_WE_N(SRAM_WE_N),

		.o_I2C_SCLK(I2C_SCLK),
		.I2C_SDAT(I2C_SDAT),
		.i_AUD_ADCDAT(AUD_ADCDAT),
		.ADCLRCK(AUD_ADCLRCK),
		.o_AUD_DACDAT(AUD_DACDAT),
		.DACLRCK(AUD_DACLRCK),

		.LCD_BLON(LCD_BLON),
		.LCD_DATA(LCD_DATA),
		.LCD_EN(LCD_EN),
		.LCD_ON(LCD_ON),
		.LCD_RS(LCD_RS),
		.LCD_RW(LCD_RW),
		
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(HEX2),
		.HEX3(HEX3),
		.HEX4(HEX4),
		.HEX5(HEX5),
		.HEX6(HEX6),
		.HEX7(HEX7)
	);

/*	DE2_115_qsys my_qsys(
		.clk_clk(CLOCK_50),
		.rst_reset_n(SW[17]),
		.uart_0_external_connection_rxd(UART_RXD),
		.uart_0_external_connection_txd(UART_TXD)
	);
*/
endmodule
