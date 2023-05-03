pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/comparators.circom";
include "../node_modules/circomlib/circuits/gates.circom";

template CheckIsEqaul() {
    signal input in1;
    signal input in2;
    signal input in3;
    signal output out;

    component isEqual1 = IsEqual();
    component isEqual2 = IsEqual();

    component and = AND();

    in1 ==> isEqual1.in[0];
    in2 ==> isEqual1.in[1];

    in2 ==> isEqual2.in[0];
    in3 ==> isEqual2.in[1];

    out <== 1;

    and.a <== isEqual1.out;
    and.b <== isEqual2.out;

    and.out === 1;
}

component main = UseLib1();