// ---------------------------------------------------------------------
// Driver
// Applies stimulus to the DUT via the interface, synchronized to clock
// ---------------------------------------------------------------------
class driver;
  transaction tr;
  virtual intf vif;
  mailbox gen2drv;
  mailbox drv2scb;

  function new(mailbox gen2drv, mailbox drv2scb, virtual intf vif);
    this.gen2drv  = gen2drv;
    this.drv2scb  = drv2scb;
    this.vif      = vif;
  endfunction

  task drv_run();
    tr = new();
    gen2drv.get(tr);

    @(posedge vif.clk);
    vif.a   = tr.a;
    vif.b   = tr.b;
    vif.sel = tr.sel;

    drv2scb.put(tr);
  endtask
endclass
