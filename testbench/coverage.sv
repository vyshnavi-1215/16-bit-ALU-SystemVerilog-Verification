// ---------------------------------------------------------------------
// Coverage
// Tracks which of the 16 operations have been exercised
// (mirrors Table 1 / Fig 7 of the reference paper)
// ---------------------------------------------------------------------
class coverage;
  virtual intf vif;

  covergroup cg;
    option.per_instance = 1;
    coverpoint vif.sel {
      bins add_bin   = {4'b0000};
      bins sub_bin   = {4'b0001};
      bins mul_bin   = {4'b0010};
      bins div_bin   = {4'b0011};
      bins and_bin   = {4'b0100};
      bins or_bin    = {4'b0101};
      bins nand_bin  = {4'b0110};
      bins nor_bin   = {4'b0111};
      bins lsl_bin   = {4'b1000};
      bins lsr_bin   = {4'b1001};
      bins rol_bin   = {4'b1010};
      bins ror_bin   = {4'b1011};
      bins xor_bin   = {4'b1100};
      bins xnor_bin  = {4'b1101};
      bins gt_bin    = {4'b1110};
      bins eq_bin    = {4'b1111};
    }
  endgroup

  function new(virtual intf vif);
    this.vif = vif;
    cg = new();
  endfunction

  task cov_run();
    cg.sample();
  endtask
endclass
