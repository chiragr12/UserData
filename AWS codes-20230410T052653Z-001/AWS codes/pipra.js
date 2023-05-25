'use strict';

const loopback = require('loopback');
const ds = loopback.createDataSource('memory'); //This two method using post method visible hard code data

module.exports = function(Pipra) {

    let defineDappUserFormat = function() {  //This line se start hard code data
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
      defineDappUserFormat() ;  //This line tak use hard code data

    Pipra.addData =  function (data, cb){
        console.log("data", data);
        cb(null, data) ; //this method is POST method
    }

    Pipra.getData = function(company, cb){
        console.log("company", company);
        let data = {
            "name":"Chirag Rathi",
            "city":"Hyderabad",
            "company": "Pipra Solutions"
        };
        cb(null, data);   //This method is GET method
    }

    Pipra.remoteMethod('addData', {
        accepts: [
            { arg: 'data', type: 'newDappUser', http: { source: 'body' } }
        ],
        returns: { type: 'object', root: true }  //POST remotemethod
    });

    Pipra.remoteMethod('getData', {
        accepts: [{ arg: 'company', type: 'string', required: false }],
        returns: { type: 'object', root: true },
        http: {verb: 'get'},  //GET remotemethod
    });

}