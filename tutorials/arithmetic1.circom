// https://github.com/therealyingtong/roll_up_circom_tutorial/blob/master/1_simple_arithmetic/sample_circuit.circom
pragma circom 2.0.0;

template Arithmetic1() {
    signal input in1;
    signal input in2;
    signal input in3;
    signal input in4;
    signal output out;

    in1 + in2 === in3;

    in2 * in3 === in4;

    out <== in3 + in4;
}

component main = Arithmetic1();

