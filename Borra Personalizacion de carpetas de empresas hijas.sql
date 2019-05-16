SELECT * FROM  --delete
cwLayoutFields WHERE
Company<>'MAIN' AND
OBJECTNAME='FOLDER_00052'
 
 
SELECT * FROM --delete
cwLayoutContainers
WHERE
Company<>'MAIN'  AND
OBJECTNAME='FOLDER_00052'