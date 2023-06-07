#$in = This command are use if data exist then show list
{
   "selector": {
      "docType": "student",
      "classs": {
         "$in": [
            "class-6"
         ]
      },
      "sex": {
         "$in": [
            "F"
         ]
      }
   }
}

{
   "selector": {
      "docType": "teacher",
      "classlist": {
         "$in": [
            "class-8"
         ]
      },
      "subject": {
         "$in": [
            "Math"
         ]
      }
   }
}

--------------------------------------------------------------------------------------------------
#$eq = This command are using if data are equal then show result otherwise not show any data.
{
   "selector": {
      "docType": "student",
      "sex": {
         "$eq": "F"
      },
      "classs": {
         "$eq": "class-8"
      }
   }
}
--------------------------------------------------------------------------------------------------
#and = this command is using if both condition eq. then show other wise not show
{
   "selector": {
      "$and": [
         {
            "docType": "student"
         },
         {
            "sex": "F"
         },
         {
            "classs": "class-6"
         },
         {
            "address": "Durg"
         }
      ]
   }
}
--------------------------------------------------------------------------------------------------
#direct use above query and this query show same results:-
{
    "selector": {
         "docType": "student",
         "sex": "F",
         "classs": "class-6"
    }
}
--------------------------------------------------------------------------------------------------
#only show teacher details:-
{
   "selector": {
      "docType": "teacher",
      "subject": {
         "$in": [
            "Math",
            "Science",
            "Hindi",
            "English",
            "Social-Science"
         ]
      }
   }
}

Both are same working:-
{
   "selector": {
      "docType": "teacher",
      "subject": {
         "$nin": [
            ""
         ]
      }
   }
}
--------------------------------------------------------------------------------------------------

{
   "selector": {
      "docType": "teacher",
      "department": {
         "$nin": [
            ""
         ]
      }
   }
}
--------------------------------------------------------------------------------------------------

{
   "selector": {
      "docType": "teacher",
      "schoolId": "SCH02",
      "subject": {
         "$nin": [
            ""
         ]
      }
   }
}
----------------------------------------------------------------------------------------------
DOCS:-
1. $in :- The document field must exist in the list provided.
2. $nin :- The document field not must exist in the list provided.
3. $eq :- The field is equal to the argument
4. $and :- Matches if all the selectors in the array match.
5. $or :- Matches if any of the selectors in the array match. All selectors must use the same index.
6. $not :- Matches if the given selector does not match.
7. $nor :- Matches if none of the selectors in the array match.
8. $all :- Matches an array value if it contains all the elements of the argument array.
9. $elemMatch :- Matches and returns all documents that contain an array field with at least one element that matches all the specified query criteria.
10. $allMatch :- Matches and returns all documents that contain an array field with all its elements matching all the specified query criteria.
11. $keyMapMatch :- Matches and returns all documents that contain a map that contains at least one key that matches all the specified query criteria.



