pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/bitify.circom";

template CheckNumberBits(n) {
    signal input number;
    signal input bits[n];

    component comp = Num2Bits(n);
    comp.in <== number;

    for (var i = 0; i<n; i++) {
        comp.out[i] === bits[i];
    }
}

component main {public [number]} = CheckNumberBits(3);