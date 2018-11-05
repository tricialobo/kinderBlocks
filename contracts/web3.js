const Web3 = require('web3');
const Linnia = require('@linniaprotocol/linnia-js');
//const HDWalletProvider = require('truffle-hdwallet-provider')
// const provider = new HDWalletProvider(
//   'candy maple cake sugar pudding cream honey rich smooth crumble sweet treat',
//   'HTTP://127.0.0.1:9545',
//   0,
//   10
// )
const poaProvider = new Web3(
  new Web3.providers.HttpProvider(
    'https://u0w9sdcna4-u0z0gggesr-rpc.us-east-2.kaleido.io'
  )
);

const web3 = new Web3(poaProvider);

const linnia = new Linnia(web3);

// get the deployed contracts
