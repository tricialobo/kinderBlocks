const path = require('path');
const solc = require('solc');
const fs = require('fs-extra');

const buildPath = path.resolve(__dirname, 'build');
fs.removeSync(buildPath);

const recordPath = path.resolve(__dirname, 'contracts', 'Records.sol');
const source = fs.readFileSync(recordPath, 'utf8');

const output = solc.compile(source, 1).contracts;
console.log('output', output);
fs.ensureDirSync(buildPath);

for (let contract in output) {
  fs.outputJsonSync(
    path.resolve(buildPath, contract.replace(':', '') + '.json'),
    output[contract]
  );
}
