https://blog.csdn.net/sda1_hacker/article/details/104427270
https://www.cnblogs.com/mhly/p/14024985.html
发行Token https://www.jianshu.com/p/55908003cbbd
Remix docker run -p 80:80 remixproject/remix-ide:latest

npm install -g solc
npm install -g solc@0.8.6
npm install -g solc@0.7.5
npm install -g solc@0.6.3
npm install -g solc@0.4.8

cd /mnt/e/_git-source/github.com/spoonerAhua/my-eth/.utils/smart_contract
solcjs --bin --abi test.sol

abi = [{"inputs":[{"internalType":"uint256","name":"input","type":"uint256"}],"name":"multiply","outputs":[{"internalType":"uint256","name":"res","type":"uint256"}],"stateMutability":"pure","type":"function"}]
contract = eth.contract(abi)
bytecode = "0x60806040523480156100115760006000fd5b50610017565b60b8806100256000396000f3fe608060405234801560105760006000fd5b5060043610602c5760003560e01c8063c6888fa114603257602c565b60006000fd5b605c6004803603602081101560475760006000fd5b81019080803590602001909291905050506072565b6040518082815260200191505060405180910390f35b60008182029050607d565b91905056fea26469706673582212201b5981585382b056e7b7ff5176f67a5a17517cdbf1f24671f05ddf50a4daf46b64736f6c63430007050033"
initializer = {from: web3.eth.accounts[0], data: bytecode, gas:300000};
personal.unlockAccount(eth.accounts[0],"123456")

token = contract.new(initializer)

token.address   0x77556b45c1bf08ace4e628b39bd52eff2149cc46


MyContract = eth.contract(abi)

myContract = MyContract.at("0x77556b45c1bf08ace4e628b39bd52eff2149cc46")

myContract.multiply.call(5)

