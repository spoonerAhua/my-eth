# go proxy
GOPROXY=https://mirrors.aliyun.com/goproxy
GOPROXY=https://goproxy.cn

# 以太坊客户端Geth命令用法-参数详解
  https://www.cnblogs.com/tinyxiong/p/7918706.html

# 编译
make geth

make all

# 运行
## 初始化
/my-eth/build/bin/geth --datadir /my-eth/.utils/data init /my-eth/.utils/genesis.json

## 启动私链
/my-eth/build/bin/geth --nodiscover --identity "private etherum" --datadir /my-eth/.utils/data --port "30303" --networkid "96178"    \
    --rpc --rpcaddr 0.0.0.0 --rpcport 8545 --rpcapi "eth,net,web3,miner,admin,debug,txpool,personal" --rpccorsdomain "*"         \
    --ws  --wsaddr  0.0.0.0 --wsport  8546 --allow-insecure-unlock


# 进入控制台
/my-eth/build/bin/geth attach ipc:/my-eth/.utils/data/geth.ipc


# 以太坊操作
```
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

web3.toWei(1,"ether")
web3.fromWei(1,"ether")
web3.fromWei('21000000000000', 'finney1');
```
admin.addPeer("enode://55b7269003d1c8c3dbc436c1ece49177a345927b052326a9ac3fff7c9632e6d2b0b227b9b3efd3d66eca4ccf1cb2cac35c40c8f71834171750de8c8840d47315@127.0.0.1:30303?discport=0")

