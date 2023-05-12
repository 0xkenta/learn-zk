import { BigNumber } from "@ethersproject/bignumber";
import { randomBytes } from "@ethersproject/random";
import { poseidon1 } from "poseidon-lite/poseidon1"
import { poseidon2 } from "poseidon-lite/poseidon2"
import fs from 'fs';

const circomlibjs = require("circomlibjs")

function getRandom(numberOfBytes = 31): bigint {
    return BigNumber.from(randomBytes(numberOfBytes)).toBigInt();
}

async function getPoseidonHash(params: bigint[]): Promise<bigint> {
    const poseidon = await circomlibjs.buildPoseidon();
    return poseidon.F.toString(poseidon(params));
}

async function main() {
    console.log("start creating the input file");

    const nullifier = getRandom();
    const trapdoor = getRandom();

    
    const secret = await getPoseidonHash([nullifier, trapdoor])
    const commitment = await getPoseidonHash([secret])
    
    const input = {
        nullifier: nullifier.toString(),
        trapdoor: trapdoor.toString(),
        out: commitment.toString()
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

