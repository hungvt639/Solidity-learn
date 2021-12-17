// const { ethers, Wallet } = require('hardhat')
// const TEST = require('../artifacts/contracts/Test.sol/Test.json')

// describe('Auction', function () {
//   it('Test TEST', async function () {
//     const [owner, addr1, addr2] = await ethers.getSigners()

//     const Test = await ethers.getContractFactory('Test')
//     const test = await Test.deploy()
//     await test.deployed()

//     await test.becomeRichest({ value: ethers.utils.parseEther('100.0') })
//     await test.withdraw()

//     const provider = new ethers.providers.JsonRpcProvider()
//     let signer = provider.getSigner()
//     const contract = new ethers.Contract(test.address, TEST.abi, signer)

//     // const withSigner = await contract.becomeRichest({
//     //   value: ethers.utils.parseEther('1000.0'),
//     // })
//     // await withSigner.wait()
//     // console.log('with', withSigner)

//     console.log('ower Balance: ', await provider.getBalance(owner.address))
//     console.log('addr1 Balance: ', await provider.getBalance(addr1.address))
//     console.log('End test Test')
//   })
// })
