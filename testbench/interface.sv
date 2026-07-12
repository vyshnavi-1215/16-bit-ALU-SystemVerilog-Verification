// ---------------------------------------------------------------------
// Interface
// Bridge between class-based testbench and DUT pins
// ---------------------------------------------------------------------
interface intf (input clk, rst);
  logic [15:0] a;
  logic [15:0] b;
  logic [3:0]  sel;
  logic [32:0] y;
endinterface
