const net = require("net")
const server = net.createServer((socket)=>{
    socket.end('good bye \n');
}).on('error',(err)=>{
    throw err;
});

server.listen(()=>{
    address = server.address();
    console.log('opened server',address);//address ks use karne se hi hame post show hota hai jiska use hum client mai karte hai
});