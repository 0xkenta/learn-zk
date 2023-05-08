

pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/mimcsponge.circom";

template Hasher() {
    signal input in1;
    signal output out;

    component mimc = MiMCSponge(1, 220, 1);
    
    mimc.ins[0] <== in1;
    mimc.k <== 0;

    out <== mimc.outs[0];
}

template Check() {
    signal input in1;
    signal input hash;

    component comp = Hasher();
    comp.in1 <== in1;

    hash === comp.out;
}

component main{public [hash]} = Check();