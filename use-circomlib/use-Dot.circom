pragma circom 2.0.0;

template Dot(DENOMINATOR, LENGTH) {
    signal input in1[LENGTH];
    signal input in2[LENGTH];
    signal output out;

    signal prod[LENGTH];
    var sum;

    for (var i = 0; i < LENGTH; i++) {
        prod[i] <== in1[i] * in2[i];
        sum += prod[i];    
    }

    out <-- sum / DENOMINATOR;
    sum === out * DENOMINATOR;
}

template Main(DENOMINATOR, LENGTH) {
    signal input in1[LENGTH];
    signal input in2[LENGTH];
    signal input expected;

    component dot = Dot(DENOMINATOR, LENGTH);

    for (var i = 0; i < LENGTH; i++) {
        dot.in1[i] <== in1[i];
        dot.in2[i] <== in2[i];
    }
    log(dot.out);
    log(expected);
    dot.out === expected;
}

component main{public [expected]} = Main(2, 2); 