const crypto = require("crypto")
const decipher = crypto.createDecipheriv('aes-192-ccm',"apassword")
var encrypeted = '93c1f1879f9334d2213f3de87c03d010b5727b49a44f73c81d19c4351122b2b4'
var decrypted = decipher.update(encrypeted,'hex','utf-8');
decrypted += decipher.final('utf-8')
console.log(decrypted);