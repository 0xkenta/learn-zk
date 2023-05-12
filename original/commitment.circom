pragma circom 2.0.0;

// https://github.com/semaphore-protocol/semaphore/blob/main/packages/circuits/semaphore.circom

include "../node_modules/circomlib/circuits/poseidon.circom";

template Main() {
    signal input nullifier;
    signal input trapdoor;

    signal output out;

    component poseidon1 = Poseidon(2);

    poseidon1.inputs[0] <== nullifier;
    poseidon1.inputs[1] <== trapdoor;

    signal secret;
    secret <== poseidon1.out;
    
    component poseidon2 = Poseidon(1);
    poseidon2.inputs[0] <== secret;

    out <== poseidon2.out;
}

component main = Main();