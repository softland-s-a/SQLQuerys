SELECT  STRMVK_STOCKS ,* FROM STRMVK
WHERE
STRMVK_DEPOSI ='02' AND
STRMVK_SECTOR ='0' AND
STRMVK_TIPPRO='TE' AND
STRMVK_ARTCOD='0001'

SELECT  *  FROM STRMVH 
WHERE
STRMVH_MODFOR='ST' AND
STRMVH_CODFOR='AJ' AND
STRMVH_NROFOR=26

SELECT  STRMVI_DEPOSI,STRMVI_SECTOR,STRMVI_CANTID,*  FROM STRMVI 
WHERE
STRMVI_MODFOR='ST' AND
STRMVI_CODFOR='TR' AND
STRMVI_NROFOR=10