const crypto = require("crypto")
const cipher = crypto.createCipheriv('aes-128-ccm','apassword')
var encrypted = cipher.update("hello chirag rathi",'utf-8','hex');
encrypted += cipher.final('hex');
console.log(encrypted)

