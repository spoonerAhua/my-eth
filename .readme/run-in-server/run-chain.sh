/my-eth/geth --datadir /my-eth-data init /my-eth/genesis_pow.json

/my-eth/geth --datadir /my-eth-data --port "30303" --networkid "99854" --identity "private etherum"   --allow-insecure-unlock    \
    --rpc --rpcaddr 0.0.0.0 --rpcport 8545 --rpccorsdomain "*" --rpcapi "eth,web3,miner,admin,debug,txpool,personal,net"  \
    --ws  --ws.addr 0.0.0.0 --ws.port 8546 --ws.origins    "*" --ws.api "eth,web3,miner,admin,debug,txpool,personal,net"  \
    --graphql --graphql.corsdomain "*"     --graphql.vhosts "*"
