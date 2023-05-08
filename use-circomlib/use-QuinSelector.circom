// https://github.com/darkforest-eth/circuits/blob/master/perlin/QuinSelector.circom

pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/comparators.circom";

template CalculateTotal(n) {
    signal input in[n];
    signal output out;

    signal sums[n];

    sums[0] <== in[0];

    for (var i = 1; i < n; i++) {
        sums[i] <== sums[i - 1] + in[i];
    }

    out <== sums[n - 1];
}

template QuinSelector(n) {
    signal input in[n];
    signal input index;
    signal output out;

    component lessThan = LessThan(4);
    lessThan.in[0] <== index;
    lessThan.in[1] <== n;
    lessThan.out === 1;

    component calcTotal = CalculateTotal(n);
    component equals[n];

    for (var i = 0; i < n; i++) {
        equals[i] = IsEqual();
        equals[i].in[0] <== i;
        equals[i].in[1] <== index;

        calcTotal.in[i] <== equals[i].out * in[i];
    }

    out <== calcTotal.out;
}

template Main(n) {
    signal input in[n];
    signal input index;
    signal input item;

    component quinSelector = QuinSelector(n);
    
    for (var i = 0; i < n; i++) {
        quinSelector.in[i] <== in[i];
    }

    quinSelector.index <== index;

    quinSelector.out === item;
}

component main{public [item]} = Main(5);