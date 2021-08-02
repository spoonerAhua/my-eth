## 参考
```
https://www.jianshu.com/p/9b9d76cc58ff
```

## 配置文件
```
vi /eth/genesis.json         
{
  "config": {
    "chainId": 11,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip150Hash": "0x0000000000000000000000000000000000000000000000000000000000000000",
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "ethash": {}
  },
  "nonce": "0x0",
  "timestamp": "0x5d5cdc87",
  "extraData": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "gasLimit": "0x47b760",
  "difficulty": "0x80000",
  "mixHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "coinbase": "0x0000000000000000000000000000000000000000",
  "alloc": {
    "0000000000000000000000000000000000000000": {
      "balance": "0x1"
    }
  },
  "number": "0x0",
  "gasUsed": "0x0",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000"
}

```

## 创建网络
```
# docker network rm eth-net
# docker network create --driver bridge --subnet 172.19.1.0/16 --gateway 172.19.1.0 eth-net
```

## 启动master节点

```
# 启动geth环境
cd /mnt/e/ethereum/_source/124.71.232.109/spooner/ethereum__doc/chain
docker rm -f eth-node-master
docker run -d -t -w /                   \
           --name eth-node-master       \
           -v $PWD:/config       \
           --restart=always             \
           --net bridge                 \
           --entrypoint /config/initAndStartChain.sh  \
           -p 8545:8545 -p 30303:30303 -p 8200:8200   \
           ethereum/client-go:v1.8.27

           ethereum/client-go:v1.10.4
docker exec -it eth-node-master ifconfig
docker logs -f eth-node-master

```

## 启动挖矿
```
# 进入控制台
docker exec -it eth-node-master geth attach ipc:/data/geth.ipc

# 创建账号
personal.newAccount("123456")

# 开始挖矿
miner.start()

```

## 查看当前节点
```
admin.nodeInfo.enode 
# 节点信息 enode://1f9edd7f3ea6646265e57a51d1ea41dc37c10a4f40496e4ebc1663433a344e833c54117491e4761f1ce70d3266f165d3782890d72c874b700d56a4b3c5360fdc@127.0.0.

```

## 加入已有网络
```
# docker exec -it eth-node-1 /bin/sh
docker exec -it eth-node-1 geth attach ipc:/data/geth.ipc
admin.addPeer("enode://1f9edd7f3ea6646265e57a51d1ea41dc37c10a4f40496e4ebc1663433a344e833c54117491e4761f1ce70d3266f165d3782890d72c874b700d56a4b3c5360fdc@[172.17.0.3]:30303?discport=0")
```


### 命令
```
personal.newAccount("123456")  # 创建账户  0x58e5f38689dd2722c52cc4d113feca0d68e7e130  0x07b84ba28951cc95c3871b0c0c79676e228fb71f
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




personal.unlockAccount(eth.accounts[0],"123456")
eth.sendTransaction({from:eth.accounts[0],to:"0x539Bb8d2e1c92fF1C3e628272F5cA77E390b9497",value:web3.toWei(2,"ether")})




var source = 'contract Multiply7 {event Print(uint);function multiply(uint input) returns (uint) {Print(input * 7);return input * 7;}}'


method eth_compileSolidity does not exist/is not available
