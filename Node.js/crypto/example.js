const crypto = require("crypto")
const secret = 'chirag rathi ji '
const hash = crypto.createHash('sha256',secret)
        .update('Wel come to java script')
        .digest('hex');
        console.log(hash);
        