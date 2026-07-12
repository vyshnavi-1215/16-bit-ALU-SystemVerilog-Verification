// ---------------------------------------------------------------------
// Test program
// Defines the test sequence: how many transactions to run
// ---------------------------------------------------------------------
program test(intf vif);
  environment env;

  initial begin
    env = new(vif);
    repeat (300) begin
      env.env_run();
    end
    env.env_report();
    #100;
    $finish;
  end
endprogram
