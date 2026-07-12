// filelist.f
// Compile order matters for readability/tools; VCS resolves cross-file
// class/module references within a single invocation regardless, but
// keeping dependency order here is good practice.

design.sv

testbench/interface.sv
testbench/transaction.sv
testbench/generator.sv
testbench/driver.sv
testbench/monitor.sv
testbench/scoreboard.sv
testbench/coverage.sv
testbench/environment.sv
testbench/test.sv
testbench/tb_top.sv
