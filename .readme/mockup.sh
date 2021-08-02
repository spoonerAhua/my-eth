
while(true)
do

curl http://39.105.153.126:8545 -X POST --header "Content-Type: application/json" -d '{
    "jsonrpc":"2.0",
    "method":"personal_unlockAccount",
    "params":[
        "0xcda8bcbdc38988533acef91908561a8d2e831a2e",
        "123456"
    ],
    "id":76111111
}' 

curl http://39.105.153.126:8545 -X POST  --header "Content-Type: application/json" -d '{
    "jsonrpc":"2.0",
    "method":"eth_sendTransaction",
    "id":76111111,
    "params": [{
        "from": "0xcda8bcbdc38988533acef91908561a8d2e831a2e",
        "to": "0x25486350c125c132d9ec205bc8a608fcfcd225df",
        "gas":"0x76c0", 
        "gasPrice": "0x9184e72a000",
        "value": "0x800000000000000"
    }]
}'

sleep 5s

done
