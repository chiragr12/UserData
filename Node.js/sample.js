// console.log(__dirname)
// console.log(__filename)
// const chi = (()=>{
//     console.log("chirag")
//     setTimeout(()=>{
//         console.log("rathi")
//     },1000);
//     console.log("ram")
// });
// chi();

// const os = require("os")

// console.log(os.arch()); //show 32 or 64 bit
// console.log(os.cpus()); 
// console.log(os.freemem()); //show free memory
// console.log(os.endianness()); //show LE
// console.log(os.homedir()); //show home directory name
// console.log(os.hostname()); //show hostname
// console.log(os.loadavg()); //show load data array from 
// console.log(os.networkInterfaces()); //show network 
// console.log(os.platform()); //show the platefrom name like Linux
// console.log(os.release()); //show operating syetem release
// console.log(os.tmpdir()); //show tem dir.
// console.log(os.totalmem()); //show total memory
// console.log(os.type()); //show os name
// console.log(os.uptime());
// console.log(os.userInfo());// user details


const dns = require("dns")
// dns.lookup('www.javatpoint.com',(err,add,family)=>{
//     console.log('add',add)
//     console.log('family',family)
// });
const ab = dns.getServers()
console.log(ab)



