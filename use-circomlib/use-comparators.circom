pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/comparators.circom";

template UseLib1() {
    signal input in1;
    signal input in2;
    signal input in3;
    signal output out;

    component isEqual1 = IsEqual();
    component isEqual2 = IsEqual();

    in1 ==> isEqual1.in[0];
    in2 ==> isEqual1.in[1];

    in2 ==> isEqual2.in[0];
    in3 ==> isEqual2.in[1];

    out <== 1;

    isEqual1.out === 1;
    isEqual2.out === 1;
}

component main = UseLib1();