`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kevin kasper
// 
// Create Date:    22:31:06 12/15/2015 
// Design Name: 
// Module Name:    NumDrawer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module NumDrawer(big_bin, hcounterer, vcounterer, clk, blank, isContained);
    input [15:0] big_bin;
	 input [10:0] hcounterer;
	 input [9:0] vcounterer;
	 input clk;
	 input blank;
    output reg [3:0] isContained;
	 
	 reg [3:0] small_bin;
	 reg [1:0] digit;
	 reg [10:0] spacing;
	 parameter top = 340;
	 
	     
	 reg CathodeC;
	 reg CathodeB;
	
	 reg CathodeE;
	 reg CathodeF;
	
	 reg CathodeA;
	 reg CathodeG;
	 reg CathodeD;
	 
	 initial begin
		 digit = 0;
		 isContained = 0;
		 spacing = 0;
		 CathodeC = 0;
		 CathodeB = 0;
	
		 CathodeE = 0;
		 CathodeF = 0;
	
		 CathodeA = 0;
		 CathodeG = 0;
		 CathodeD = 0;
	 end

	 
	 always @(posedge clk) begin    

			spacing = 420;
			small_bin = big_bin[3:0];
			CathodeB = ~blank & ((spacing+45 <= hcounterer) &  (hcounterer <= (spacing+60)) & ((top-97) >= vcounterer) & (vcounterer >= (top-200)) );
			CathodeC = ~blank & ((spacing+45 <= hcounterer) &  (hcounterer <= (spacing+60)) & (top >= vcounterer) & (vcounterer >= (top-93)) );

			CathodeF = ~blank & ((spacing <= hcounterer) &  (hcounterer <= (spacing+15)) & ((top-97) >= vcounterer) & (vcounterer >= (top-200)) );
			CathodeE = ~blank & ((spacing <= hcounterer) &  (hcounterer <= (spacing+15)) & (top >= vcounterer) & (vcounterer >= (top-93)) );

			CathodeA = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & ((top-160) >= vcounterer) & (vcounterer >= (top-200)) );		
			CathodeD = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & (top >= vcounterer) & (vcounterer >= (top-40)) );
			CathodeG = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & ((top-85) >= vcounterer) & (vcounterer >= (top-115)) );		
	
		  
		  //Toggles which cathode figures are enabled currently based on the BCD input
		  case (small_bin)    
				0: isContained[0] = (CathodeA | CathodeB | CathodeC | CathodeD | CathodeE | CathodeF);
				1: isContained[0] = (CathodeB | CathodeC);
				2: isContained[0] = (CathodeA | CathodeB | CathodeG | CathodeE | CathodeD); 
				3: isContained[0] = (CathodeA | CathodeB | CathodeG | CathodeC | CathodeD); 
				4: isContained[0] = (CathodeB | CathodeC | CathodeF | CathodeG); 
				5: isContained[0] = (CathodeA | CathodeF | CathodeG | CathodeC | CathodeD); 
				6: isContained[0] = (CathodeA | CathodeF | CathodeG | CathodeC | CathodeD | CathodeE); 
				7: isContained[0] = (CathodeA | CathodeB | CathodeC); 
				8: isContained[0] = (CathodeA | CathodeB | CathodeC | CathodeD | CathodeE | CathodeF | CathodeG); 
				9: isContained[0] = (CathodeA | CathodeF | CathodeG | CathodeB | CathodeC); 
				default: isContained[0] = 0;
		  endcase 

			spacing = 330;
			small_bin = big_bin[7:4];
			CathodeB = ~blank & ((spacing+45 <= hcounterer) &  (hcounterer <= (spacing+60)) & ((top-97) >= vcounterer) & (vcounterer >= (top-200)) );
			CathodeC = ~blank & ((spacing+45 <= hcounterer) &  (hcounterer <= (spacing+60)) & (top >= vcounterer) & (vcounterer >= (top-93)) );

			CathodeF = ~blank & ((spacing <= hcounterer) &  (hcounterer <= (spacing+15)) & ((top-97) >= vcounterer) & (vcounterer >= (top-200)) );
			CathodeE = ~blank & ((spacing <= hcounterer) &  (hcounterer <= (spacing+15)) & (top >= vcounterer) & (vcounterer >= (top-93)) );

			CathodeA = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & ((top-160) >= vcounterer) & (vcounterer >= (top-200)) );		
			CathodeD = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & (top >= vcounterer) & (vcounterer >= (top-40)) );
			CathodeG = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & ((top-85) >= vcounterer) & (vcounterer >= (top-115)) );	
		  //Toggles which cathode figures are enabled currently based on the BCD input
		  case (small_bin)    
				0: isContained[1] = (CathodeA | CathodeB | CathodeC | CathodeD | CathodeE | CathodeF);
				1: isContained[1] = (CathodeB | CathodeC);
				2: isContained[1] = (CathodeA | CathodeB | CathodeG | CathodeE | CathodeD); 
				3: isContained[1] = (CathodeA | CathodeB | CathodeG | CathodeC | CathodeD); 
				4: isContained[1] = (CathodeB | CathodeC | CathodeF | CathodeG); 
				5: isContained[1] = (CathodeA | CathodeF | CathodeG | CathodeC | CathodeD); 
				6: isContained[1] = (CathodeA | CathodeF | CathodeG | CathodeC | CathodeD | CathodeE); 
				7: isContained[1] = (CathodeA | CathodeB | CathodeC); 
				8: isContained[1] = (CathodeA | CathodeB | CathodeC | CathodeD | CathodeE | CathodeF | CathodeG); 
				9: isContained[1] = (CathodeA | CathodeF | CathodeG | CathodeB | CathodeC); 
				default: isContained[1] = 0;
		  endcase 
		  
			spacing = 210;
			small_bin = big_bin[11:8];
			CathodeB = ~blank & ((spacing+45 <= hcounterer) &  (hcounterer <= (spacing+60)) & ((top-97) >= vcounterer) & (vcounterer >= (top-200)) );
			CathodeC = ~blank & ((spacing+45 <= hcounterer) &  (hcounterer <= (spacing+60)) & (top >= vcounterer) & (vcounterer >= (top-93)) );

			CathodeF = ~blank & ((spacing <= hcounterer) &  (hcounterer <= (spacing+15)) & ((top-97) >= vcounterer) & (vcounterer >= (top-200)) );
			CathodeE = ~blank & ((spacing <= hcounterer) &  (hcounterer <= (spacing+15)) & (top >= vcounterer) & (vcounterer >= (top-93)) );

			CathodeA = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & ((top-160) >= vcounterer) & (vcounterer >= (top-200)) );		
			CathodeD = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & (top >= vcounterer) & (vcounterer >= (top-40)) );
			CathodeG = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & ((top-85) >= vcounterer) & (vcounterer >= (top-115)) );			
					  
		  //Toggles which cathode figures are enabled currently based on the BCD input
		  case (small_bin)    
				0: isContained[2] = (CathodeA | CathodeB | CathodeC | CathodeD | CathodeE | CathodeF);
				1: isContained[2] = (CathodeB | CathodeC);
				2: isContained[2] = (CathodeA | CathodeB | CathodeG | CathodeE | CathodeD); 
				3: isContained[2] = (CathodeA | CathodeB | CathodeG | CathodeC | CathodeD); 
				4: isContained[2] = (CathodeB | CathodeC | CathodeF | CathodeG); 
				5: isContained[2] = (CathodeA | CathodeF | CathodeG | CathodeC | CathodeD); 
				6: isContained[2] = (CathodeA | CathodeF | CathodeG | CathodeC | CathodeD | CathodeE); 
				7: isContained[2] = (CathodeA | CathodeB | CathodeC); 
				8: isContained[2] = (CathodeA | CathodeB | CathodeC | CathodeD | CathodeE | CathodeF | CathodeG); 
				9: isContained[2] = (CathodeA | CathodeF | CathodeG | CathodeB | CathodeC); 
				default: isContained[2] = 0;
		  endcase 
		  
			spacing = 120;
			small_bin = big_bin[15:12];
			CathodeB = ~blank & ((spacing+45 <= hcounterer) &  (hcounterer <= (spacing+60)) & ((top-97) >= vcounterer) & (vcounterer >= (top-200)) );
			CathodeC = ~blank & ((spacing+45 <= hcounterer) &  (hcounterer <= (spacing+60)) & (top >= vcounterer) & (vcounterer >= (top-93)) );

			CathodeF = ~blank & ((spacing <= hcounterer) &  (hcounterer <= (spacing+15)) & ((top-97) >= vcounterer) & (vcounterer >= (top-200)) );
			CathodeE = ~blank & ((spacing <= hcounterer) &  (hcounterer <= (spacing+15)) & (top >= vcounterer) & (vcounterer >= (top-93)) );

			CathodeA = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & ((top-160) >= vcounterer) & (vcounterer >= (top-200)) );		
			CathodeD = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & (top >= vcounterer) & (vcounterer >= (top-40)) );
			CathodeG = ~blank & (((spacing+17) <= hcounterer) &  (hcounterer <= (spacing+43)) & ((top-85) >= vcounterer) & (vcounterer >= (top-115)) );	
			
		  //Toggles which cathode figures are enabled currently based on the BCD input
		  case (small_bin)    
				0: isContained[3] = (CathodeA | CathodeB | CathodeC | CathodeD | CathodeE | CathodeF);
				1: isContained[3] = (CathodeB | CathodeC);
				2: isContained[3] = (CathodeA | CathodeB | CathodeG | CathodeE | CathodeD); 
				3: isContained[3] = (CathodeA | CathodeB | CathodeG | CathodeC | CathodeD); 
				4: isContained[3] = (CathodeB | CathodeC | CathodeF | CathodeG); 
				5: isContained[3] = (CathodeA | CathodeF | CathodeG | CathodeC | CathodeD); 
				6: isContained[3] = (CathodeA | CathodeF | CathodeG | CathodeC | CathodeD | CathodeE); 
				7: isContained[3] = (CathodeA | CathodeB | CathodeC); 
				8: isContained[3] = (CathodeA | CathodeB | CathodeC | CathodeD | CathodeE | CathodeF | CathodeG); 
				9: isContained[3] = (CathodeA | CathodeF | CathodeG | CathodeB | CathodeC); 
				default: isContained[3] = 0;
		  endcase 
    end
endmodule
