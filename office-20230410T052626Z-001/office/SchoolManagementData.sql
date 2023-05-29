'use strict';
//escapeJson method are using array varible to convert in string valus use JSON.stringify ke surrounded escapeJson ka use hota hai.
const escapeJson = require('escape-json-node/lib/escape-json'); //This line also very usefull because this line not use you are not use escapeJson method ;
const chaincode = require('../../lib/validate-user');
const loopback = require('loopback');
const ds = loopback.createDataSource('memory'); 

module.exports = function(Schoolmanagement) {

    let defineHeadmasterFormat = function(){
        let headMasterModel = {
            'id' : String,
            'name' : String,
            'doj' : String,
            'degree' : String
        };
        ds.define('headmaster',headMasterModel);
    };
    defineHeadmasterFormat();  

    let defineTeacherFormat = function(){
        let headTeacherModel = {
            'teacherId' : String,
            'name' : String,
            'doj' : String,
            'degree' : String,
            'subject' : String,
            'classlist' : String  //Array to String convert because you are not convert your data is not visible
        };
        ds.define('teacher',headTeacherModel);
    };
    defineTeacherFormat();

    let defineClassFormat = function(){
        let headClassModel = {
            'classId' : String,
            'studentList' : String,  //Array to String convert because you are not convert your data is not visible
            'subjectList' : String  //Array to String convert because you are not convert your data is not visible
        };
        ds.define('class',headClassModel);
    };
    defineClassFormat();

    let defineStaffFormat = function(){
        let headStaffModel = {
            'staffId' : String,
            'name' : String,
            'doj' : String,
            'degree' : String,
            'department' : String
        };
        ds.define('staff',headStaffModel);
    };
    defineStaffFormat();

    let defineSchoolFormat = function(){
        let headSchoolModel = {
            'schoolId' : String,
            'name' : String,
            'city' : String,
            'headmaster' : String,
            'teachers' : String, //Array to String convert because you are not convert your data is not visible
            'address' : String
        };
        ds.define('school',headSchoolModel);
    };
    defineSchoolFormat();

    let defineStudentFormat = function(){
        let headStudentModel = {
            'studentId' : String,
            'name' : String,
            'DOB' : String,
            'classs' : String,
            'sex' : String,
            'address' : String
        };
        ds.define('student',headStudentModel);
    };
    defineStudentFormat();

    Schoolmanagement.addHeadMasterData = async function (datah){
        const contract = await chaincode.validateUser('user3')
        let result = await contract.submitTransaction(
          'addHeadmaster',
          datah.id,
          datah.name,
          datah.doj,
          datah.degree  
        );
        return result;
    }

    Schoolmanagement.addTeacherData = async function(datat){
        const contract = await chaincode.validateUser('user3')
        let result = await contract.submitTransaction(
            'addTeacher',
            datat.teacherId,
            datat.name,
            datat.doj,
            datat.degree,
            datat.subject,
            escapeJson(JSON.stringify(datat.classlist))
        );
        return result;
    }

    Schoolmanagement.addClassData = async function(datac){
        const contract = await chaincode.validateUser('user3')
        let result = await contract.submitTransaction(
            'addClass',
            datac.classId,
            escapeJson(JSON.stringify(datac.studentList)),
            escapeJson(JSON.stringify(datac.subjectList))
        );
        return result;
    }

    Schoolmanagement.addStaffData = async function(data){
        const contract = await chaincode.validateUser('user3')
        let result = await contract.submitTransaction(
            'addStaff',
            data.staffId,
            data.name,
            data.doj,
            data.degree,
            data.department
            );
            return result;
    }

    Schoolmanagement.addSchoolData  = async function(datas){
        const contract = await chaincode.validateUser('user3')
        let result = await contract.submitTransaction(
            'addSchoolData',
            datas.schoolId,
            datas.name,
            datas.city,
            datas.headmaster,
            escapeJson(JSON.stringify(datas.teachers)),
            datas.address
        );
        return result
    }

    Schoolmanagement.addStudentData = async function(datast){
        const contract = await chaincode.validateUser('user3')
        let result = await contract.submitTransaction(
            'addStudent',
            datast.studentId,
            datast.name,
            datast.DOB,
            datast.classs,
            datast.sex,
            datast.address
        );
        return result
    }

    Schoolmanagement.getStudentData = async function(studentId){
        const contract = await chaincode.validateUser('user3')

        var studentResult = await contract.evaluateTransaction('queryState',studentId);
        studentResult = JSON.parse(studentResult.toString());
        return studentResult;
    }

    Schoolmanagement.getTeacherData = async function(teacherId){
        const contract = await chaincode.validateUser('user3')

        var teacherResult = await contract.evaluateTransaction('queryState',teacherId);
        teacherResult = JSON.parse(teacherResult.toString());
        return teacherResult;
    }

    Schoolmanagement.getHeadmasterData = async function(headmasterId){
        const contract = await chaincode.validateUser('user3')

        var headmasterResult = await contract.evaluateTransaction('queryState',headmasterId);
        headmasterResult = JSON.parse(headmasterResult.toString());
        return headmasterResult;
    }

    Schoolmanagement.getStaffData = async function(staffId){
        const contract = await chaincode.validateUser('user3')

        var staffResult = await contract.evaluateTransaction('queryState',staffId);
        staffResult = JSON.parse(staffResult.toString());
        return staffResult;
    }

    Schoolmanagement.getSchoolData = async function(schoolId){
        const contract = await chaincode.validateUser('user3')

        var schoolResult = await contract.evaluateTransaction('queryState',schoolId);
        schoolResult = JSON.parse(schoolResult.toString());
        return schoolResult;
    }

    Schoolmanagement.getClassData = async function(classId){
        const contract = await chaincode.validateUser('user3')

        var classResult = await contract.evaluateTransaction('queryState',classId);
        classResult = JSON.parse(classResult.toString());
        return classResult;
    }
//Pagination
        Schoolmanagement.getStudentDataWithPagination = async function(data){
        const contract = await chaincode.validateUser('user3')
        let filterObject = {
            "docType": "student"
        }
        filterObject = escapeJson(JSON.stringify(filterObject));

        if(data.bookmark === undefined){
            data.bookmark = "";
        }
        if(data.pageSize === undefined){
            data.pageSize = 5;
        }
        var result = await contract.evaluateTransaction(
            'filterDataWithPagination',
            filterObject,
            data.pageSize.toString(),
            data.bookmark
        );
        return JSON.parse(result.toString());
    }

    Schoolmanagement.remoteMethod('getStudentDataWithPagination',{
        accepts: [
            {arg: 'data',type: 'object', http: {source: 'body'}}
        ],
        returns: {type: 'object', root: true},
        http: {verb: 'post'},  //if using get method body is not run then using post method.
    });

    Schoolmanagement.remoteMethod('getStudentData',{
        accepts: [{arg: 'studentId',type: 'string'}],
        returns: {type: 'object', root: true},
        http: {verb: 'get'},
    });

    Schoolmanagement.remoteMethod('getHeadmasterData',{
        accepts: [{arg: 'headmasterId',type: 'string'}],
        returns: {type: 'object', root: true},
        http: {verb: 'get'},
    });

    Schoolmanagement.remoteMethod('getTeacherData',{
        accepts: [{arg: 'teacherId',type: 'string'}],
        returns: {type: 'object', root: true},
        http: {verb: 'get'},
    });

    Schoolmanagement.remoteMethod('getSchoolData',{
        accepts: [{arg: 'schoolId',type: 'string'}],
        returns: {type: 'object', root: true},
        http: {verb: 'get'},
    });

    Schoolmanagement.remoteMethod('getStaffData',{
        accepts: [{arg: 'staffId',type: 'string'}],
        returns: {type: 'object', root: true},
        http: {verb: 'get'},
    });

    Schoolmanagement.remoteMethod('getClassData',{
        accepts: [{arg: 'classId',type: 'string'}],
        returns: {type: 'object', root: true},
        http: {verb: 'get'},
    });

    Schoolmanagement.remoteMethod('addHeadMasterData', {
        accepts: [
            { arg: 'datah', type: 'headmaster', http: { source: 'body' } }
        ],
        returns: { type: 'headmaster', root: true }//headmaster
    });

    Schoolmanagement.remoteMethod('addStudentData', {
        accepts: [
            { arg: 'datast', type: 'student', http: { source: 'body' } }
        ],
        returns: { type: 'student', root: true }//student
    });

    Schoolmanagement.remoteMethod('addSchoolData', {
        accepts: [
            { arg: 'datas', type: 'school', http: { source: 'body' } }
        ],
        returns: { type: 'school', root: true }//school 
         //Array type hoga to error show hoga isliye string type rakhkar data add karte hai time use array mai karke hi add karte work karta hai
    });

    Schoolmanagement.remoteMethod('addStaffData', {
        accepts: [
            { arg: 'data', type: 'staff', http: { source: 'body' } }
        ],
        returns: { type: 'staff', root: true }//staff
    });

    Schoolmanagement.remoteMethod('addClassData', {
        accepts: [
            { arg: 'datac', type: 'class', http: { source: 'body' } }
        ],
        returns: { type: 'class', root: true }//class
    });

    Schoolmanagement.remoteMethod('addTeacherData', {
        accepts: [
            { arg: 'datat', type: 'teacher', http: { source: 'body' } }
        ],
        returns: { type: 'teacher', root: true }//teacher
    });
};


#Pagination using POST method because give a body

{
  "docType": "student",
  "pageSize": "10",
  "bookmark": ""
}
{
  "docType": "student",
  "bookmark": ""
} //if not give any pageSize byDefault using no. of 5 using
