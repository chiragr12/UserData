const http = require("http")

http.createServer(function(req,res){
    // console.log(res)
    res.writeHead(200,{'content-type': 'text/plain'})
    res.end('Hello Chirag \n')
}).listen(8081);
console.log('Server running at http://127.0.0.1:8081/');