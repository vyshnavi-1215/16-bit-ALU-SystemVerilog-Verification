// ---------------------------------------------------------------------
// Environment
// Instantiates and connects all testbench components
// ---------------------------------------------------------------------
class environment;
  virtual intf vif;
  mailbox gen2drv;
  mailbox drv2scb;
  mailbox mon2scb;

  generator  gen;
  driver     drv;
  monitor    mon;
  scoreboard scb;
  coverage   cov;

  function new(virtual intf vif);
    this.vif = vif;

    gen2drv = new();
    drv2scb = new();
    mon2scb = new();

    gen = new(gen2drv);
    drv = new(gen2drv, drv2scb, vif);
    mon = new(mon2scb, vif);
    scb = new(drv2scb, mon2scb);
    cov = new(vif);
  endfunction

  task env_run();
    gen.gen_run();
    #10;
    drv.drv_run();
    #10;
    mon.mon_run();
    #10;
    scb.scb_run();
    cov.cov_run();
    #10;
  endtask

  task env_report();
    scb.report();
  endtask
endclass
