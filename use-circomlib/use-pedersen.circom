

pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/pedersen.circom";

template Hasher() {
    signal input in1;
    signal output out;

    component pedersen = Pedersen(248);
    component bits = Num2Bits(248);
    bits.in <== in1;
    for (var i = 0; i < 248; i++) {
        pedersen.in[i] <== bits.out[i];
    }
}

template Check() {
    signal input in1;
    signal input hash;

    component comp = Hasher();
    comp.in1 <== in1;

}

component main = PedersenHasher();