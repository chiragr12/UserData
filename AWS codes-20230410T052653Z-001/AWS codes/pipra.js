'use strict';

const loopback = require('loopback');
const ds = loopback.createDataSource('memory'); 

module.exports = function(Pipra) {

    let defineDappUserFormat = function() {
        let newUserModel = {
                'dAppId' : String,
                'userName' : String ,
                'userType' : String ,
                'email' : String ,
                'password' : String,
                'gln':String,
                'gcp':String
            };
        ds.define('newDappUser', newUserModel);
      };
      defineDappUserFormat() ;

    Pipra.addData =  function (data, cb){
        console.log("data", data);
        cb(null, data) ;
    }

    Pipra.getData = function(company, cb){
        console.log("company", company);
        let data = {
            "name":"Chirag Rathi",
            "city":"Hyderabad",
            "company": "Pipra Solutions"
        };
        cb(null, data);
    }

    Pipra.remoteMethod('addData', {
        accepts: [
            { arg: 'data', type: 'newDappUser', http: { source: 'body' } }
        ],
        returns: { type: 'object', root: true }
    });

    Pipra.remoteMethod('getData', {
        accepts: [{ arg: 'company', type: 'string', required: false }],
        returns: { type: 'object', root: true },
        http: {verb: 'get'},
    });

}