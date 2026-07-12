// ---------------------------------------------------------------------
// Monitor
// Passively observes DUT inputs/outputs
// ---------------------------------------------------------------------
class monitor;
  transaction tr;
  virtual intf vif;
  mailbox mon2scb;

  function new(mailbox mon2scb, virtual intf vif);
    this.mon2scb = mon2scb;
    this.vif     = vif;
  endfunction

  task mon_run();
    tr = new();
    @(posedge vif.clk);
    tr.a   = vif.a;
    tr.b   = vif.b;
    tr.sel = vif.sel;
    tr.y   = vif.y;
    mon2scb.put(tr);
  endtask
endclass
