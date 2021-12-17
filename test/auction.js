const { ethers, Wallet } = require("hardhat");
const AUCTION = require("../artifacts/contracts/Auction.sol/Auction.json");

describe("Auction", function () {
    it("Test Auction", async function () {
        const [owner, addr1, addr2] = await ethers.getSigners();
        const Auction = await ethers.getContractFactory("Auction");
        const auction = await Auction.deploy(120, addr1.address);
        await auction.deployed();
        // const provider = new ethers.providers.JsonRpcProvider();

        // console.log("balance_", owner.address);
        // await auction.getAddrSender();
        // let balance = await provider.getBalance(owner.address);
        // console.log("balance_", balance);

        const dauGia = await auction.dauGia({ value: 10000000 });
        await dauGia.wait();

        const acc1 = await auction.connect(addr1.address);
        // await acc1.getAddrSender();
        const acc1DauGia = await acc1.dauGia({ value: 10000 });
        // await acc1DauGia.wait();
        // balance = await provider.getBalance(owner.address);
        // console.log("balance_", balance);

        // const acc = await auction.connect(addr2.address);
        // const dauGia = await acc.dauGia({ value: 100 });
        // await dauGia.wait();
        // console.log("_miner", await auction.bindder());
        // console.log("_maxValue", await auction.maxValue());

        //test chuyen tien
        /*
        let signer = provider.getSigner();
        console.log(await signer.getAddress());
        const tx = await signer.sendTransaction({
            to: addr1.address,
            value: ethers.utils.parseEther("1.0"),
        });
        console.log("tx", tx);
        console.log("ower", await provider.getBalance(owner.address));
        console.log("addr1", await provider.getBalance(addr1.address));
        console.log(await signer.getBalance());
        */
        const provider = new ethers.providers.JsonRpcProvider();
        let signer = provider.getSigner();
        // let signer = new Wallet(addr1.address);
        // let wallet = signer.connect(provider);
        const contract = new ethers.Contract(
            auction.address,
            AUCTION.abi,
            signer
        );

        const withSigner = await contract.dauGia({ value: 1000 });

        // console.log("w", withSigner);
        console.log("ower", await provider.getBalance(owner.address));
        console.log("addr1", await provider.getBalance(addr1.address));
        console.log("End test Auction");
    });
});
