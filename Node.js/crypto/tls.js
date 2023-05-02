const tls = require('tls')
function connected(stream){
    if(stream){
        stream.write("GET/HTTP/1.0\n\rHost:encrypted.google.com:443\n\r\n\r");
    }else{
        console.log("connection failed")
    }
}

var dummy = this;
dummy.socket = tls.connect(443,'encrypted.google.com',function(){
    dummy.connected = true;
    if(dummy.socket.authorized){
        dummy.socket.setEncoding('utf-8');
        connected(dummy.socket);
    }else{
        console.log(dummy.socket.authorizationError)
        connected(null)
    }
});
dummy.socket.addListener('data',function(data){
    console.log(data);
});
dummy.socket.addListener('error',function(err){
    if(!dummy.connected){
        connected(null)
    }
    console.log("Fail")
    console.loge(err)
});
dummy.socket.addListener('close',()=>{

});