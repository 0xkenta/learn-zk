// https://betterprogramming.pub/zero-knowledge-proofs-using-snarkjs-and-circom-fac6c4d63202
pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/poseidon.circom";

template poseidonHasher(n) {
    signal input in[n];
    signal output out;

    component poseidon = Poseidon(n);
    for(var i = 0; i < n; i++){
        poseidon.inputs[i] <== in[i];
    }

    out <== poseidon.out;
}

component main = poseidonHasher(3);