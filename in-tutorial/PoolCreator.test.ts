import { ethers } from 'hardhat';
import { HardhatEthersSigner } from '@nomicfoundation/hardhat-ethers/signers';

import { Token, Token__factory, PoolCreator, PoolCreator__factory } from '../typechain-types';

describe('PoolCreator tests', function () {
  const UNISWAP_FACTORY_ADDRESS = '0x1F98431c8aD98523631AE4a59f267346ea31F984';
  let tokenA: Token;
  let tokenB: Token;
  let poolCreator: PoolCreator;
  let owner: HardhatEthersSigner;

  before(async () => {
    const signers = await ethers.getSigners();
    owner = signers[0];
    tokenA = await new Token__factory().connect(owner).deploy('TokenA', 'TokenA');
    tokenB = await new Token__factory().connect(owner).deploy('TokenB', 'TokenB');
    poolCreator = await new PoolCreator__factory().connect(owner).deploy(UNISWAP_FACTORY_ADDRESS);
  });

  it('should create a pool', async () => {
    const contractAddress = await poolCreator.createPool.staticCall(tokenA, tokenB, 500);
    console.log('Contract Address', contractAddress);
    await poolCreator.createPool(tokenA, tokenB, 500);
  });
});