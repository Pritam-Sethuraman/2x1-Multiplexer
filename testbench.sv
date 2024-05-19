module tb_mux_2to1;
    // Testbench signals
    logic sel;
    logic input0;
    logic input1;
    logic y;
    logic expected_output;
    int pass_count = 0;
    int fail_count = 0;

    // Instantiate the mux
    mux_2to1 uut (
        .sel(sel),
        .input0(input0),
        .input1(input1),
        .y(y)
    );

    // Task to run a single test case
    task run_test(input logic test_sel, input logic test_input0, input logic test_input1, input logic expected);
        begin
            sel = test_sel;
            input0 = test_input0;
            input1 = test_input1;
            expected_output = expected;
            #10;  // Wait for 10 time units
            
            if (y === expected_output) begin
                $display("PASS: sel=%0b input0=%0b input1=%0b y=%0b", sel, input0, input1, y);
                pass_count++;
            end else begin
                $display("FAIL: sel=%0b input0=%0b input1=%0b y=%0b (Expected y=%0b)", sel, input0, input1, y, expected_output);
                fail_count++;
            end
        end
    endtask

    // Test procedure
    initial begin
        // Test case 1: sel = 0, input0 = 0, input1 = 1, expected_output = 0
        run_test(0, 0, 1, 0);

        // Test case 2: sel = 1, input0 = 0, input1 = 1, expected_output = 1
        run_test(1, 0, 1, 1);

        // Test case 3: sel = 0, input0 = 1, input1 = 0, expected_output = 1
        run_test(0, 1, 0, 1);

        // Test case 4: sel = 1, input0 = 1, input1 = 0, expected_output = 0
        run_test(1, 1, 0, 0);

        // Summary
        $display("Test Summary: %0d PASS, %0d FAIL", pass_count, fail_count);

        $finish;  // End simulation
    end
endmodule
