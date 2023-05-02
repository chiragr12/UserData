const net = require("net")
const client = net.connect({port: 42865},()=>{
    console.log('connect to server')
    client.write('World! \n');
});
client.on('data',(data)=>{
    console.log(data.toString());
    client.end();
});
client.on('end',()=>{
    console.log('disconnect for the server');
});