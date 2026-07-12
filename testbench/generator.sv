// ---------------------------------------------------------------------
// Generator
// Produces constrained-random stimulus
// ---------------------------------------------------------------------
class generator;
  transaction tr;
  mailbox gen2drv;

  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction

  task gen_run();
    tr = new();
    assert (tr.randomize());
    gen2drv.put(tr);
  endtask
endclass
