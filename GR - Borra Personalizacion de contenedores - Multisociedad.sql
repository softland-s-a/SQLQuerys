SELECT * FROM  --delete
cwLayoutFields WHERE
Company<>'MAIN' AND
OBJECTNAME='USR_FOLDER_00013'
 
 
SELECT * FROM --delete
cwLayoutContainers
WHERE
Company<>'MAIN'  AND
OBJECTNAME='USR_FOLDER_00013'