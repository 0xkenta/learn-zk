import { BigNumber } from "@ethersproject/bignumber";
import { randomBytes } from "@ethersproject/random";
import { poseidon1 } from "poseidon-lite/poseidon1"
import { poseidon2 } from "poseidon-lite/poseidon2"
import fs from 'fs';

function getRandom(numberOfBytes = 31): bigint {
    return BigNumber.from(randomBytes(numberOfBytes)).toBigInt();
}

function main() {
    console.log("start creating the input file");

    const nullfier = getRandom();
    const trapdoor = getRandom();

    const secret = poseidon2([nullfier, trapdoor]);
    const commitment = poseidon1([secret]);
    
    const input = {
        nullfier,
        trapdoor,
        out: commitment
    };

    const jsonInput = JSON.stringify(input);

    fs.writeFile('./commitment_js/commitment.json', jsonInput, err => {
        if (err) {
          console.error(err);
          return;
        }
        console.log('File created!');
    });
}

main();

