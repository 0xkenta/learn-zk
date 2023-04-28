// https://docs.circom.io/more-circuits/more-basic-circuits/
pragma circom 2.0.0;

include "./multiplier2.circom";

template Multiplier3() {
    signal input in1;
    signal input in2;
    signal input in3;
    signal output out;

    component mult1 = Multiplier2();
    component mult2 = Multiplier2();

    mult1.in1 <== in1;
    mult1.in2 <== in2;
    mult2.in1 <== mult1.out;
    mult2.in2 <== in3;
    out <== mult2.out;
}

component main = Multiplier3();