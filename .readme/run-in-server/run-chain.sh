nohup /my-eth/geth --datadir /my-eth/data --port "30303" --networkid "99854"                                               \
    --miner.threads 1 --nodiscover --identity "private etherum"                                                          \
    --rpc --rpcaddr 0.0.0.0  --rpcport 8545 --rpcapi "eth,net,web3,miner,admin,debug,txpool,personal" --rpccorsdomain "*"  \
    --ws  --ws.addr  0.0.0.0 --ws.port 8546 --ws.api "eth,net,web3,miner,admin,debug,txpool,personal" --ws.origins    "*"  \
    --graphql --graphql.corsdomain "*"    --graphql.vhosts "*"  \
    --allow-insecure-unlock &