
# 运行
cd /my-eth

## 初始化
cd /my-eth
/my-eth/geth --datadir /my-eth/data init /my-eth/genesis_sync.json
/my-eth/geth --datadir /my-eth/data init /my-eth/genesis_SmartContract.json

## 启动私链
cd /my-eth
nohup /my-eth/geth --nodiscover --identity "private etherum" --datadir /my-eth/data --port "30303" --networkid "96178"     \
    --rpc --rpcaddr 0.0.0.0  --rpcport 8545 --rpcapi "eth,net,web3,miner,admin,debug,txpool,personal" --rpccorsdomain "*"  \
    --ws  --ws.addr  0.0.0.0 --ws.port 8546 --ws.api "eth,net,web3,miner,admin,debug,txpool,personal" --ws.origins     "*" \
    --graphql --graphql.corsdomain "*"    --graphql.vhosts "*"  \
    --allow-insecure-unlock &


cd /my-eth
tail -f nohup.out

# 进入控制台
cd /my-eth
/my-eth/geth attach ipc:/my-eth/data/geth.ipc

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

admin.nodeInfo.enode
admin.addPeer("enode://56428c5467134538c55949608c772e838481770650b257fba7b056008d0fbccf3960ef54163ae9e11e093b1cff295373d99b0966361e8baaee7564e53106c4a6@39.105.153.126:30303?discport=0")
admin.addPeer("enode://56428c5467134538c55949608c772e838481770650b257fba7b056008d0fbccf3960ef54163ae9e11e093b1cff295373d99b0966361e8baaee7564e53106c4a6@172.21.117.53:30303?discport=0")
admin.addPeer("enode://07ef41d2f93137372121e253a69dd44647dff3625b30009ba146b6d2577e1778c737c54fe3d3ac21661af8e61828a99ed36a391d53326cdeea205730f21cabd6@39.105.18.23:30303?discport=0")
admin.addPeer("enode://07ef41d2f93137372121e253a69dd44647dff3625b30009ba146b6d2577e1778c737c54fe3d3ac21661af8e61828a99ed36a391d53326cdeea205730f21cabd6@172.21.117.54:30303?discport=0")

