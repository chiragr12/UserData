Active mq:-
http://13.233.84.2:8161/admin/index.jsp

Restart Active mq
sudo systemctl stop activemq
sudo systemctl start activemq

Restart Idempiere Server
sudo service idempiere restart


Background run pm2:-
npm i -g pm2
pm2 -v
pm2 list

hyper ledger fabric path
cd /home/ubuntu/fabric-samples/asset-transfer-basic/application-gateway-typescript
pm2 start dist/app.js

this above two line using then background working start 

if you stop and restart
pm2 stop dist/app.js
pm2 restart dist/app.js 
