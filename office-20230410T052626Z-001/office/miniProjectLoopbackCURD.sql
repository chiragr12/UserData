//loopback CRUD operation:-

chaincode/lib product.js

const state = require('../utils/state');
module.exports = {

    async addProduct(ctx,gtin,name,type,composition,gln,gcp){
        try{
            if(gtin.length === 0){
                throw "gtin must not be empty";
            }

            try{
                await state.keyMustNotExist(ctx,gtin);
            }catch(error){
            throw gtin + " gtin is already registered"
            }

            if(name.length === 0){
                throw "name must not be empty";
            }

            if(type.length === 0){
                throw "product type must not be empty";
            }

            if(composition.length === 0){
                throw "product composition must not be empty";
            }

            if(gln.length === 0){
                throw "gln must not be empty";
            }

            if(gcp.length === 0){
                throw "gcp must not be empty";
            }

            try{
                await state.keyMustExist(ctx,gcp)
                }catch(error){
                    throw gcp + " gcp is invalid"
                }

            try{
                await state.keyMustExist(ctx,gln)
                }catch(error){
                    throw gln + " gln is invalid"
                }    

            const addData = {
                gtin,
                name,
                type,
                composition,
                gln,
                gcp,
                docType: "pproduct"
            }
            await ctx.stub.putState(gtin,Buffer.from(JSON.stringify(addData)));
            return {
                status: true,
                data: gtin + "gtin added Successfully"
            }

        }catch(error){
            return {
                state: false,
                data: error
            }
        }
    },

    async updateProduct(ctx,gtin,children){
        try{
            children = JSON.parse(children);

            if(gtin.length === 0){
                throw "gtin must not be empty"
            }

            try{
                var proUserdata = await state.keyMustExist(ctx,gtin);
            }catch(error){
                throw "invalid gtin " + gtin;
            }

            if(children.name){
                proUserdata.name = children.name;
            }

            if(children.type){
                proUserdata.type = children.type;
            }

            if(children.composition){
                proUserdata.composition = children.composition;
            }

            if(children.gln){
                proUserdata.gln = children.gln;
            }

            if(children.gcp){
                proUserdata.gcp = children.gcp;
            }

            await ctx.stub.putState(gtin,Buffer.from(JSON.stringify(proUserdata)));
            return {
                status: true,
                data: gtin + "updated successfully"
            }
        }catch(error){
            return {
                status: false,
                data: error
            }
        }
    },

    async deleteProduct(ctx, gtin){
//This method is proper working
        try {
            
            var queryString = {};
            queryString.selector = {};
            queryString.selector.gtin = gtin;

            var totalKeyCntIterator = await state.query(ctx, queryString);
            var keys = await state.keyCount(totalKeyCntIterator);
            keys = JSON.parse(keys);
            if(keys.length === 0){
                throw  "Product: "+ gtin + " not found";  
            }

            var filterKeyList = []; 
            for (let index = 0; index < keys.length; index++) {
                const element = keys[index];
                filterKeyList.push(element.Key);
            }

            var queryString = {};
            queryString.selector = {};

            queryString.selector = { 
                gtin: {
                    "$in": filterKeyList
                },
                docType: "pproduct"
            };

            var iterator = await state.query(ctx, queryString);
            
            let keyList = await state.getAllResultsOfPagination(iterator);

            try {
                for (let index = 0; index < keyList.length; index++) {
                    const key = keyList[index];
                    await ctx.stub.deleteState(key);
                    
                }
            }catch (error) {
                throw error
            }

            try {
                for (let index = 0; index < filterKeyList.length; index++) {
                    const key = filterKeyList[index];
                await ctx.stub.deleteState(key);
                    
                }
            } catch (error) {
                throw error
            }

            await ctx.stub.deleteState(gtin);

            return {
                status:true,
                data: "Product linked with gtin: " + gtin + " deleted successfully"
            }

        } catch(error) {
            return{
                status : false,
                data : error
            }
        }  
    }
}

-----------------------------------------------------------------------------------------------------------------------------------------------
location.js

const state = require('../utils/state');
module.exports = {

    async addLocation(ctx,gln,name,gcp){
        try{
            if(gln.length === 0){
                throw "gln must not be empty";
            }

            try{
                await state.keyMustNotExist(ctx,gln);
            }catch(error){
            throw gln + " gln is already registered"
            }

            if(name.length === 0){
                throw "name must not be empty";
            }

            if(gcp.length === 0){
                throw "gcp must not be empty";
            }

            try{
                await state.keyMustExist(ctx,gcp)
                }catch(error){
                    throw gcp + " gcp is invalid"
                }
                
            const addData = {
                gln,
                name,
                gcp,
                docType: "plocation"
            }
            await ctx.stub.putState(gln,Buffer.from(JSON.stringify(addData)));
            return {
                status: true,
                data: gln + "gln added Successfully"
            }

        }catch(error){
            return {
                state: false,
                data: error
            }
        }
    },

    async updateOrganisation(ctx,gln,children){
        try{
            children = JSON.parse(children);

            if(gln.length === 0){
                throw "gln must not be empty"
            }

            try{
                var locationUserdata = await state.keyMustExist(ctx,gln);
            }catch(error){
                throw "invalid gln " + gln;
            }

            if(children.name){
                locationUserdata.name = children.name;
            }

            if(children.gcp){
                locationUserdata.gcp = children.gcp;
            }

            await ctx.stub.putState(gln,Buffer.from(JSON.stringify(locationUserdata)));
            return {
                status: true,
                data: gln + "updated successfully"
            }
        }catch(error){
            return {
                status: false,
                data: error
            }
        }
    },

    async deleteLocation(ctx,gln){
        try{
            var queryString = {};
            queryString.selector = {};
            queryString.selector.gln = gln;

            var iterator = await state.query(ctx,queryString);
            var keys = await state.keyCount(iterator);
            keys = JSON.parse(keys);
            if(keys.length === 0){
                throw "Location : "+ gln +" not found";
            }
            var filterKeyList = [];
            for(let index = 0; index<keys.length; index++){
                const element = keys[index];
                filterKeyList.push(element.Key)
            }

            var queryString = {};
            queryString.selector = {};
            queryString.selector = {
                gln: {
                    "$in": filterKeyList
                },
                docType: "plocation"
            };
            var iterator = await state.query(ctx,queryString);
            let keyList = await state.getAllResultsOfPagination(iterator)

            try{
                for(let index = 0; index<keyList.length; index++){
                    const key = filterKeyList[index];
                    await ctx.stub.deleteState(key);
                }
            }catch(error){
                throw error
            }
            await ctx.stub.deleteState(gln);
            return{
                status: true,
                data: "Location linked with gln: " + gln + " deleted Successfully"
            }
        }catch(error){
            return {
                status: false,
                data: error
            }
        }
    }
}
----------------------------------------------------------------------------------------------------------------------------------------------------
org.js
const state = require('../utils/state');
module.exports = {

    async addOrganisation(ctx,gcp,name,address){
        try{
            if(gcp.length === 0){
                throw "gcp must not be empty";
            }
            if((gcp.length > 9) || (gcp.length < 9)){
                throw "gcp enter must 9 digit"
            }//Gcp only enter 9 digit otherwise throw error

            try{
                await state.keyMustNotExist(ctx,gcp);
            }catch(error){
            throw gcp + " gcp is already registered"
            }

            if(name.length === 0){
                throw "name must not be empty";
            }

            if(address.length === 0){
                throw "address must not be empty";
            }

            const addData = {
                gcp,
                name,
                address,
                docType: "porg"
            }
            await ctx.stub.putState(gcp,Buffer.from(JSON.stringify(addData)));
            return {
                status: true,
                data: gcp + "gcp added Successfully"
            }

        }catch(error){
            return {
                state: false,
                data: error
            }
        }
    },

    async updateOrganisation(ctx,gcp,children){
        try{
            children = JSON.parse(children);

            if(gcp.length === 0){
                throw "gcp must not be empty"
            }

            try{
                var orgUserdata = await state.keyMustExist(ctx,gcp);
            }catch(error){
                throw "invalid gcp " + gcp;
            }

            if(children.name){
                orgUserdata.name = children.name;
            }

            if(children.address){
                orgUserdata.address = children.address;
            }

            await ctx.stub.putState(gcp,Buffer.from(JSON.stringify(orgUserdata)));
            return {
                status: true,
                data: gcp + "updated successfully"
            }
        }catch(error){
            return {
                status: false,
                data: error
            }
        }
    },

    async deleteOrganisation(ctx,gcp){
        try{
            var queryString = {};
            queryString.selector = {};
            queryString.selector.gcp = gcp;  //selector ke baad jise remove karna hai use choose karte hai

            var iterator = await state.query(ctx,queryString);
            var keys = await state.keyCount(iterator);
            keys = JSON.parse(keys);
            if(keys.length === 0){
                throw "Organisation : "+ gcp + " not found";
            }

            var filterKeyList = [];
            for (let index = 0; index<keys.length; index++){
                const element = keys[index];
                filterKeyList.push(element.Key)
            }

            var queryString = {};
            queryString.selector = {};
            queryString.selector = {
                gcp: {
                    "$in": filterKeyList
                },
                docType: "porg"
            };

            var iterator = await state.query(ctx,queryString);
            let keyList = await state.getAllResultsOfPagination(iterator);

            try{
                for(let index = 0; index<keyList.length; index++){
                    const key = filterKeyList[index];
                    await ctx.stub.deleteState(key);
                }
            }catch(error){
                   throw error 
            }
            await ctx.stub.deleteState(gcp);
            return {
                state: true,
                data: "Organisation linked with gcp: " + gcp + " deleted Successfully"
            }
        }catch(error){
            return{
                status: false,
                data: error
            }
        }
    }
}
==================================================================================================================================
realmeds.js

 async addOrganisationData(ctx,gcp,name,address){
        return await porg.addOrganisation(ctx,gcp,name,address);
    }

    async addLocationData(ctx,gln,name,gcp){
        return await ploc.addLocation(ctx,gln,name,gcp)
    }

    async addProductData(ctx,gtin,name,type,composition,gln,gcp){
        return await ppro.addProduct(ctx,gtin,name,type,composition,gln,gcp)
    }

    async updateOrganisationData(ctx,gcp,children){
        return await porg.updateOrganisation(ctx,gcp,children)
    }

    async updateLocationData(ctx,gln,children){
        return await ploc.updateOrganisation(ctx,gln,children)
    }

    async updateProductData(ctx,gtin,children){
        return await ppro.updateProduct(ctx,gtin,children)
    }

    async deleteProducts(ctx, gtin){
        return await ppro.deleteProduct(ctx, gtin);
    }

    async deleteOrganisations(ctx, gcp){
        return await porg.deleteOrganisation(ctx, gcp);
    }

    async deleteLocations(ctx, gln){
        return await ploc.deleteLocation(ctx, gln);
    }

=================================================================================================================================================
api/commom/model/
org.js

'use strict';

const escapeJson = require('escape-json-node/lib/escape-json'); 
const chaincode = require('../../lib/validate-user');
const loopback = require('loopback');
const ds = loopback.createDataSource('memory'); 

module.exports = function(Porganisation) {

    let defineOrgFormat = function(){
        let orgModel = {
            'gcp': String,
            'name': String,
            'address': String
        };
        ds.define('org',orgModel);
    };
    defineOrgFormat();

    Porganisation.addOrgData = async function(data){
        const contract = await chaincode.validateUser('user3')
        let result = await contract.submitTransaction(
            'addOrganisationData',
            data.gcp,
            data.name,
            data.address
        );
        return JSON.parse(result.toString());
    }

    Porganisation.getOrgData = async function(gcp){
        const contract = await chaincode.validateUser('user3')
        var orgResult = await contract.evaluateTransaction('queryState',gcp)
        return JSON.parse(orgResult.toString());
    }

    Porganisation.updateOrgData = async function(data){
        try{
        const contract = await chaincode.validateUser('user3')
        var gcpId = data.gcp;
        data = escapeJson(JSON.stringify(data));
        var responce = await contract.submitTransaction(
            'updateOrganisationData',
            gcpId,
            data
        );
        return JSON.parse(responce.toString());
        }catch(error){
            throw error;
        }
    }

    Porganisation.deleteOrgData = async function(gcp){
        try{
        const contract = await chaincode.validateUser('user3')
        var result = await contract.submitTransaction(
            'deleteOrganisations',
            gcp
        );
        return JSON.parse(result.toString());
        }catch(error){
            throw error
        }
    }

    Porganisation.remoteMethod('deleteOrgData',{
        accepts: [
            {arg: 'gcp',type: 'string'}
        ],
        returns: {type: 'object', root: true},
        http: {verb: 'delete'},
    });

    Porganisation.remoteMethod('updateOrgData', {
        accepts: [
            { arg: 'data', type: 'org', http: { source: 'body' } }
        ],
        returns: { type: 'object', root: true },
        http: {verb: 'put'}
    });

    Porganisation.remoteMethod('getOrgData',{
        accepts: [{arg: 'gcp',type: 'string'}],
        returns: {type: 'object', root: true},
        http: {verb: 'get'},
    });

    Porganisation.remoteMethod('addOrgData', {
        accepts: [
            { arg: 'data', type: 'org', http: { source: 'body' } }
        ],
        returns: { type: 'org', root: true }
    });
};
--------------------------------------------------------------------------------------------------------------------------------------
location.js
'use strict';

const escapeJson = require('escape-json-node/lib/escape-json'); 
const chaincode = require('../../lib/validate-user');
const loopback = require('loopback');
const ds = loopback.createDataSource('memory'); 

module.exports = function(Plocation) {

    let defineLocationFormat = function(){
        let locationModel = {
            'gln': String,
            'name': String,
            'gcp': String
        };
        ds.define('loc',locationModel);
    };
    defineLocationFormat();

    Plocation.addLocationData = async function(data){
        const contract = await chaincode.validateUser('user3')
        let result = await contract.submitTransaction(
            'addLocationData',
            data.gln,
            data.name,
            data.gcp
        );
        return JSON.parse(result.toString());
    }

    Plocation.getLocationData = async function(gln){
        const contract = await chaincode.validateUser('user3')
        var LocationResult = await contract.evaluateTransaction('queryState',gln)
        return JSON.parse(LocationResult.toString());
    }

    Plocation.updateLocationData = async function(data){
        try{
        const contract = await chaincode.validateUser('user3')
        var glnId = data.gln;
        data = escapeJson(JSON.stringify(data));
        var responce = await contract.submitTransaction(
            'updateLocationData',
            glnId,
            data
        );
        return JSON.parse(responce.toString());
        }catch(error){
            throw error;
        }
    }

    Plocation.deleteLocationData = async function(gln){
        try{
            const contract = await chaincode.validateUser('user3')
            var result = await contract.submitTransaction(
                'deleteLocations',
                gln
            );
            return JSON.parse(result.toString());

        }catch(error){
            throw error
        }
    }

    Plocation.remoteMethod('deleteLocationData',{
        accepts: [
            {arg: 'gln', type: 'string'}
        ],
        returns: {type: 'object', root: true},
        http: {verb: 'delete'},
    });

    Plocation.remoteMethod('updateLocationData', {
        accepts: [
            { arg: 'data', type: 'loc', http: { source: 'body' } }
        ],
        returns: { type: 'object', root: true },
        http: {verb: 'put'}
    });

    Plocation.remoteMethod('getLocationData',{
        accepts: [{arg: 'gln',type: 'string'}],
        returns: {type: 'object', root: true},
        http: {verb: 'get'},
    });

    Plocation.remoteMethod('addLocationData', {
        accepts: [
            { arg: 'data', type: 'loc', http: { source: 'body' } }
        ],
        returns: { type: 'loc', root: true }
    });
};
-------------------------------------------------------------------------------------------------------------------------------------------
pro.js

'use strict';

const escapeJson = require('escape-json-node/lib/escape-json'); 
const chaincode = require('../../lib/validate-user');
const loopback = require('loopback');
const ds = loopback.createDataSource('memory'); 

module.exports = function(Pproduct) {

    let defineProFormat = function(){
        let proModel = {
            'gtin': String,
            'name': String,
            'type': String,
            'composition': String,
            'gln': String,
            'gcp': String
        };
        ds.define('pro',proModel);
    };
    defineProFormat();

    Pproduct.addProData = async function(data){
        const contract = await chaincode.validateUser('user3')
        let result = await contract.submitTransaction(
            'addProductData',
            data.gtin,
            data.name,
            data.type,
            data.composition,
            data.gln,
            data.gcp
        );
        return JSON.parse(result.toString());
    }

    Pproduct.getProData = async function(gtin){
        const contract = await chaincode.validateUser('user3')
        var proResult = await contract.evaluateTransaction('queryState',gtin)
        return JSON.parse(proResult.toString());
    }

    Pproduct.updateProData = async function(data){
        try{
        const contract = await chaincode.validateUser('user3')
        var gtinId = data.gtin;
        data = escapeJson(JSON.stringify(data));
        var responce = await contract.submitTransaction(
            'updateProductData',
            gtinId,
            data
        );
        return JSON.parse(responce.toString());
        }catch(error){
            throw error;
        }
    }

    Pproduct.getProductDataWithPagination = async function(data){
        const contract = await chaincode.validateUser('user3')
        let filterObject = {
            "docType": "pproduct"
        }
        filterObject = escapeJson(JSON.stringify(filterObject));

        if(data.bookmark === undefined){
            data.bookmark = "";
        }

        if(data.pageSize === undefined){
            data.pageSize = "5";
        }
        var result = await contract.evaluateTransaction(
            'filterDataWithPagination',
            filterObject,
            data.pageSize,
            data.bookmark
        );
        return JSON.parse(result.toString());
    }

    Pproduct.deleteProductData = async function(gtin){
        try{
            const contract = await chaincode.validateUser('user3');
            var result = await contract.submitTransaction(
                'deleteProducts',
                gtin
            );
            return JSON.parse(result.toString());

        }catch(error){
            throw error
        }//This method is working
    }

    Pproduct.remoteMethod('deleteProductData',{
        accepts: [
            {arg: 'gtin', type: 'string' }
        ],
        returns: {type: 'object', root: true},
        http: {verb: 'delete'},
    });//This method only value put and without inverted comma using.

    Pproduct.remoteMethod('getProductDataWithPagination',{
        accepts: [
            {arg: 'data',type: 'object'}
        ],
        returns: {type: 'object', root: true},
        http: {verb: 'get'},
        // get and post both method is working but get method using right way
    });

    Pproduct.remoteMethod('updateProData', {
        accepts: [
            { arg: 'data', type: 'pro', http: { source: 'body' } }
        ],
        returns: { type: 'object', root: true },
        http: {verb: 'put'}
    });

    Pproduct.remoteMethod('getProData',{
        accepts: [{arg: 'gtin',type: 'string'}],
        returns: {type: 'object', root: true},
        http: {verb: 'get'},
    });

    Pproduct.remoteMethod('addProData', {
        accepts: [
            { arg: 'data', type: 'pro', http: { source: 'body' } }
        ],
        returns: { type: 'pro', root: true }
    });
};
=======================================================================================================================================================
