// https://github.com/fluree/example-zero-knowledge/blob/main/src/circuits/InRange.circom
pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/comparators.circom";

template CheckInRange() {
    signal input upperRange;
    signal input lowerRange;
    signal input in;

    component isLessEqThan = LessEqThan(64);     
    component isGreaterEqThan = GreaterEqThan(64);

    isLessEqThan.in[0] <== in;
    isLessEqThan.in[1] <== upperRange;
    isLessEqThan.out === 1;

    isGreaterEqThan.in[0] <== in;
    isGreaterEqThan.in[1] <== lowerRange;
    isGreaterEqThan.out === 1;

    isLessEqThan.out * isGreaterEqThan.out === 1;
}

component main {public [upperRange, lowerRange]} = CheckInRange();