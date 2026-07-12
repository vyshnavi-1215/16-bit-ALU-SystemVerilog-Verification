// ---------------------------------------------------------------------
// Top-level testbench
// Instantiates DUT, interface, and test; generates clock and reset
// ---------------------------------------------------------------------
module tb();
  reg clk;
  reg rst;
  intf vif(clk, rst);

  test test1(vif);

  always #1 clk = ~clk;

  alu16bit dut (
    .a   (vif.a),
    .b   (vif.b),
    .sel (vif.sel),
    .y   (vif.y),
    .clk (clk),
    .rst (rst)
  );

  initial begin
    clk = 0;
    rst = 1; #10; rst = 0;

    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end
endmodule
