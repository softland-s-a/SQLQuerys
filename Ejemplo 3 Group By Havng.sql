SELECT
STRMVI_MODFOR ,STRMVI_CODFOR,STRMVI_NROFOR ,
Max(STRMVI_NROITM) MAXIMO,
Min(STRMVI_NROITM) MINIMO,
(SELECT 
COUNT(*) FROM STRMVI B 
WHERE
B.STRMVI_MODFOR=STRMVI.STRMVI_MODFOR AND 
B.STRMVI_CODFOR=STRMVI.STRMVI_CODFOR AND 
B.STRMVI_NROFOR=STRMVI.STRMVI_NROFOR ) CANT_REG1
From
STRMVI
Where
STRMVI_MODFOR='st' and
STRMVI_CODFOR='aj'and 
(SELECT 
COUNT(*) FROM STRMVI B 
WHERE
B.STRMVI_MODFOR=STRMVI.STRMVI_MODFOR AND 
B.STRMVI_CODFOR=STRMVI.STRMVI_CODFOR AND 
B.STRMVI_NROFOR=STRMVI.STRMVI_NROFOR ) >1
Group By
STRMVI_MODFOR ,STRMVI_CODFOR,STRMVI_NROFOR 
Having 
SUM(STRMVI_CANTID ) >0