# 清理环境
```
docker rm -f geth1 geth2 geth3 geth4
```

# 启动环境
```
docker network create geth_network
cd /mnt/e/_git-source/github.com/spoonerAhua/my-eth/build/bin
docker run -it --name geth1 -e LANG=C.UTF-8 -p 10303:30303 -p 1545:8545 -v $PWD:/geth_bin --network=geth_network ubuntu:18.04 bash
docker run -it --name geth2 -e LANG=C.UTF-8 -p 20303:30303 -p 2545:8545 -v $PWD:/geth_bin --network=geth_network ubuntu:18.04 bash
docker run -it --name geth3 -e LANG=C.UTF-8 -p 30303:30303 -p 3545:8545 -v $PWD:/geth_bin --network=geth_network ubuntu:18.04 bash
docker run -it --name geth4 -e LANG=C.UTF-8 -p 40303:30303 -p 4545:8545 -v $PWD:/geth_bin --network=geth_network ubuntu:18.04 bash

apt update
apt -y install iputils-ping net-tools
```

# 初始化
```
cd /mnt/e/_git-source/github.com/spoonerAhua/my-eth/build/bin
docker exec -it geth3 bash
/geth_bin/geth --datadir /geth_data init /geth_bin/genesis_sync.json

```

# 启动私链
```
docker exec -it geth1 bash
/geth_bin/geth --nodiscover --identity "private etherum" --datadir /geth_data --port "30303" --networkid "96178"    \
               --rpc --rpcaddr 0.0.0.0 --rpcport 8545 --rpccorsdomain "*" --rpcapi "eth,net,web3,miner,admin,debug,txpool,personal" \
               --allow-insecure-unlock

```

# 进入控制台
```
docker exec -it geth1 bash
docker exec -it geth2 bash
docker exec -it geth3 bash
docker exec -it geth4 bash

/geth_bin/geth attach ipc:/geth_data/geth.ipc
admin.nodeInfo.enode

```

# 以太坊操作
```
personal.unlockAccount(eth.accounts[0],"123456")
personal.newAccount("123456") 
miner.start()

eth.accounts # 查看账户
personal.listAccounts  # 查看账户
eth.getBalance(eth.accounts[0]) # 查看账户余额
miner.setEtherbase(eth.accounts[0]) # 设置挖矿地址
miner.start() # 启动挖矿
miner.stop() # 停止挖矿
net.peerCount # 邻居节点数量
admin.nodeInfo # 节点信息
admin.nodeInfo.enode # 节点信息 enode://1f9edd7f3ea6646265e57a51d1ea41dc37c10a4f40496e4ebc1663433a344e833c54117491e4761f1ce70d3266f165d3782890d72c874b700d56a4b3c5360fdc@127.0.0.1:30303?discport=0
eth.blockNumber # 查看区块数
eth.getBlock(n)  # 查看区块信息
eth.getBlock('latest') # 查询最新的区块
eth.getTransaction(txNo) # 查询交易，根据交易号txNo，交易号是产生一个交易后返回的一串16进制字符。
exit # 退出geth控制台
personal.unlockAccount(eth.accounts[0],"123456") # 解锁账号
eth.sendTransaction({from:eth.accounts[0],to:"0x64F5c3D36F51583d71AFab7FDf931C363D973c6b",value:web3.toWei(1,"ether")}) # 转账
eth.syncing 查看同步状态
web3.toWei(1,"ether")
web3.fromWei(1,"ether")
web3.fromWei('21000000000000', 'finney1');

```

# 添加节点
```
admin.nodeInfo.enode
admin.addPeer("enode://61a4a0f3e583cdb18c0aaf17e3d2e0254792541f0ce73187a45efdc92147a72d2d71c946b126bdfc29775b758d2c89ba6734d4887f5a5131d2d62d0ed5ac2d08@172.19.0.2:30303?discport=0")
admin.addPeer("enode://6b5fc965bef7f7d85dda19b557b73fecb938f6ff04ff2f70b613d47f590ea2d62ad62513144e5318fc7390c645bc95155b5f495ba30560bebff2084a7cbac899@172.19.0.3:30303?discport=0")
admin.addPeer("enode://a04bde56b45b5c969f40c9a487eb15969edcc27eb39ab86b30eb229c8fe934b18189c5a2f117ad711831bd644d7a0edd6c3c2d5cd14e57b82105c8a147731d48@172.19.0.4:30303?discport=0")
admin.addPeer("enode://2c98d86a43b313ea635d462d6606ba46373a9e59168d772d95c7565cafa7fc528987ed93ed1ae1883d5ba74ac8151f140e0006d7c444b0539f50299e86ecfee8@172.19.0.5:30303?discport=0")
```