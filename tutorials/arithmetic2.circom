pragma circom 2.0.0;

template Arithmetic2(k) {
    signal input in1[k];
    signal input in2[k];
    signal input in3[k];
    signal input in4[k];
    signal output out;

    var sum = 0;

    for (var i = 0; i < k; i++) {
        in1[i] + in2[i] === in3[i];

        in2[i] * in3[i] === in4[i];

        sum = sum + in3[i] + in4[i]; 
    }

    out <== sum;
}

component main = Arithmetic2(4);