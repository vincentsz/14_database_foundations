/* comparison operators: */

/*
>            : less than
<            : greater than
<=           : less than or equal to
>=           : greater than or equal to
=            : equal 
<> or !=     : not equal
*/

SELECT full_name, enabled, last_login
FROM users
WHERE id >= 2;

/* comparison predicates: */

/*
BETWEEN
NOT BETWEEN
IS DISTINCT FROM
IS NOT DISTINCT FROM
IS NULL
IS NOT NULL
*/

SELECT * FROM my_table WHERE my_column IS NULL;
 
 /* logical operators : AND OR NOT */

SELECT * FROM users
WHERE full_name = 'Harry Potter'
OR enabled = 'false';

SELECT * FROM users
WHERE full_name = 'Harry Potter'
AND enabled = 'false';

/* string matching operators */

/*
LIKE       : operator, case sensitive
ILIKE      : operator, case insensitive
SIMILAR TO : operator, compares target column to regex
%          : wildcard, any number of characters
_          : wildcard, one single character
*/

SELECT * FROM users WHERE full_name LIKE '%Smith';