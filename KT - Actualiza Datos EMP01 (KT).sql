UPDATE CWOMCOMPANIES SET
CONNECTSTRING = (SELECT CONNECTSTRING FROM CWOMCOMPANIES WHERE NAME = 'EMP00'),
DATABASENAME = (SELECT DATABASENAME FROM CWOMCOMPANIES WHERE NAME = 'EMP00'),
DESCRIPTION =  (SELECT replace(DESCRIPTION, 'Main','Hija') FROM CWOMCOMPANIES WHERE NAME = 'EMP00')
WHERE
NAME = 'EMP01'
