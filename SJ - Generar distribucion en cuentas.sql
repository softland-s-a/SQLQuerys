BEGIN TRAN

INSERT INTO [dbo].[SJRMVD]
           ([SJRMVD_CODCPT]
           ,[SJRMVD_CODFOR]
           ,[SJRMVD_CODEMP]
           ,[SJRMVD_MODFOR]
           ,[SJRMVD_NROFOR]
           ,[SJRMVD_EMPLEG]
           ,[SJRMVD_NROLEG]
           ,[SJRMVD_DEBHAB]
           ,[SJRMVD_NROITM]
           ,[SJRMVD_NROITD]
           ,[SJRMVD_CODDIM]
           ,[SJRMVD_DIMDIS]
           ,[SJRMVD_CODDIS]
           ,[SJRMVD_CUENTA]
           ,[SJRMVD_FECALT]
           ,[SJRMVD_FECMOD]
           ,[SJRMVD_OLDUID]
           ,[SJRMVD_ULTOPR]
           ,[SJRMVD_DEBAJA]
           ,[SJRMVD_HORMOV]
           ,[SJRMVD_MODULE]
           ,[SJRMVD_OALIAS]
           ,[SJRMVD_LOTTRA]
           ,[SJRMVD_LOTREC]
           ,[SJRMVD_LOTORI]
           ,[SJRMVD_USERID]
           ,[SJRMVD_SYSVER]
           ,[SJRMVD_CMPVER])
SELECT 
	SJRMVI_CODCPT
	,SJRMVI_CODFOR
    ,SJRMVI_CODEMP
    ,[SJRMVI_MODFOR]
           ,[SJRMVI_NROFOR]
           ,[SJRMVI_EMPLEG]
           ,[SJRMVI_NROLEG]
           ,[SJRMVI_DEBHAB]
           ,ISNULL((SELECT MAX([SJRMVD_NROITM]) FROM SJRMVD WHERE SJRMVD_CODFOR = SJRMVI_CODFOR AND SJRMVD_CODEMP = SJRMVI_CODEMP AND SJRMVD_NROFOR = SJRMVI_NROFOR AND SJRMVD_NROLEG = SJRMVI_NROLEG),0) + ROW_NUMBER() OVER(PARTITION BY SJRMVI_NROLEG ORDER BY SJRMVI_NROLEG) NROITM  
           , 1 --[SJRMVD_NROITD]
           ,'PR' --[SJRMVD_CODDIM]
           ,'PR'  --[SJRMVD_DIMDIS]   
           ,(SELECT CGTDSI_CODDIS FROM CGTDSI WHERE CGTDSI_DIMSUB = 'PR' AND CGTDSI_SUBCUE = USR_SJRMVH_LUGTRA)  --[SJRMVD_CODDIS] HAY QUE CALCULAR ESTE 
           ,[SJRMVI_CUENTA]
           ,[SJRMVI_FECALT]
           ,[SJRMVI_FECMOD]
			, NULL --[SJRMVI_OLDUID]
           ,[SJRMVI_ULTOPR]
           ,[SJRMVI_DEBAJA]
           , NULL --[SJRMVD_HORMOV]
           , NULL --[SJRMVD_MODULE]
           , 'SJRMVD' --[SJRMVD_OALIAS]
           , NULL --[SJRMVD_LOTTRA]
           , NULL --[SJRMVD_LOTREC]
           , NULL --[SJRMVD_LOTORI]
           , 'ADMIN' --[SJRMVD_USERID]
           , NULL --[SJRMVD_SYSVER]
           , NULL --[SJRMVD_CMPVER]
FROM SJRMVH INNER JOIN SJRMVI
ON (SJRMVH.SJRMVH_CODEMP = SJRMVI.SJRMVI_CODEMP AND SJRMVH.SJRMVH_MODFOR = SJRMVI.SJRMVI_MODFOR AND SJRMVH.SJRMVH_CODFOR = SJRMVI.SJRMVI_CODFOR AND SJRMVH.SJRMVH_NROFOR = SJRMVI.SJRMVI_NROFOR AND SJRMVH.SJRMVH_EMPLEG = SJRMVI.SJRMVI_EMPLEG AND SJRMVH.SJRMVH_NROLEG = SJRMVI.SJRMVI_NROLEG AND  ((SJRMVI.SJRMVI_CUENTA >= '51020101') AND (SJRMVI.SJRMVI_CUENTA <= '51020114')) ) 

WHERE 
	 (SJRMVH.SJRMVH_CODEMP = 'EMP02') 
		And  (SJRMVH.SJRMVH_MODFOR = 'SJ') 
		And  (SJRMVH.SJRMVH_PERIOD = 201608)  
		And (SJRMVI_CUENTA IS NOT NULL
		And NOT EXISTS (SELECT * FROM SJRMVG WHERE SJRMVG_CODFOR = SJRMVI_CODFOR
		And SJRMVG_NROFOR = SJRMVI_NROFOR
		And SJRMVG_CODEMP = SJRMVI_CODEMP
		And SJRMVG_NROLEG = SJRMVI_NROLEG
		And SJRMVG_CODCPT = SJRMVI_CODCPT)
		And SJRMVI_CALCUL>0) 

ORDER BY SJRMVI_NROLEG


INSERT INTO [dbo].[SJRMVG]
           ([SJRMVG_CODCPT]
           ,[SJRMVG_CODDIM]
           ,[SJRMVG_CODFOR]
           ,[SJRMVG_DEBHAB]
           ,[SJRMVG_CODEMP]
           ,[SJRMVG_MODFOR]
           ,[SJRMVG_NROFOR]
           ,[SJRMVG_NROITD]
           ,[SJRMVG_NROITM]
           ,[SJRMVG_EMPLEG]
           ,[SJRMVG_NROLEG]
           ,[SJRMVG_NROITS]
           ,[SJRMVG_DIMSUB]
           ,[SJRMVG_SUBCUE]
           ,[SJRMVG_IMPORT]
           ,[SJRMVG_CUENTA]
           ,[SJRMVG_IMPDEB]
           ,[SJRMVG_IMPHAB]
           ,[SJRMVG_IMPSEC]
           ,[SJRMVG_SECDEB]
           ,[SJRMVG_SECHAB]
           ,[SJRMVG_FECALT]
           ,[SJRMVG_FECMOD]
           ,[SJRMVG_OLDUID]
           ,[SJRMVG_ULTOPR]
           ,[SJRMVG_DEBAJA]
           ,[SJRMVG_HORMOV]
           ,[SJRMVG_MODULE]
           ,[SJRMVG_OALIAS]
           ,[SJRMVG_LOTTRA]
           ,[SJRMVG_LOTREC]
           ,[SJRMVG_LOTORI]
           ,[SJRMVG_USERID]
           ,[SJRMVG_SYSVER]
           ,[SJRMVG_CMPVER])

SELECT           SJRMVI_CODCPT 
           ,'PR' --SJRMVI_CODDIM
           ,SJRMVI_CODFOR
           ,SJRMVI_DEBHAB
           ,SJRMVI_CODEMP
           ,SJRMVI_MODFOR
           ,SJRMVI_NROFOR
	       ,SJRMVD_NROITD
           ,SJRMVD_NROITM
           ,SJRMVI_EMPLEG
           ,SJRMVI_NROLEG
           ,1 --SJRMVD_NROITS 
           ,'PR' --<SJRMVG_DIMSUB, varchar(6),>
           ,USR_SJRMVH_LUGTRA --<SJRMVG_SUBCUE, varchar(40),>
           ,SJRMVI_IMPORT
           ,SJRMVI_CUENTA
           ,SJRMVI_IMPDEB
           ,SJRMVI_IMPHAB
           ,SJRMVI_IMPSEC
           ,SJRMVI_SECDEB
           ,SJRMVI_SECHAB
           ,SJRMVI_FECALT
           ,SJRMVI_FECMOD
           ,NULL --<SJRMVG_OLDUID, varchar(15),>
           ,SJRMVI_ULTOPR
           ,SJRMVI_DEBAJA
           ,NULL --<SJRMVG_HORMOV, varchar(10),>
           ,NULL --<SJRMVG_MODULE, varchar(10),>
           ,'SJRMVG' --<SJRMVG_OALIAS, varchar(10),>
           ,NULL ---<SJRMVG_LOTTRA, varchar(6),>
           ,NULL --<SJRMVG_LOTREC, varchar(6),>
           ,NULL --<SJRMVG_LOTORI, varchar(6),>
           ,'ADMIN' --<SJRMVG_USERID, varchar(36),>
           ,NULL --<SJRMVG_SYSVER, varchar(10),>
           ,NULL --<SJRMVG_CMPVER, varchar(10),>)
FROM SJRMVH INNER JOIN SJRMVI
ON (SJRMVH.SJRMVH_CODEMP = SJRMVI.SJRMVI_CODEMP AND SJRMVH.SJRMVH_MODFOR = SJRMVI.SJRMVI_MODFOR AND SJRMVH.SJRMVH_CODFOR = SJRMVI.SJRMVI_CODFOR AND SJRMVH.SJRMVH_NROFOR = SJRMVI.SJRMVI_NROFOR AND SJRMVH.SJRMVH_EMPLEG = SJRMVI.SJRMVI_EMPLEG AND SJRMVH.SJRMVH_NROLEG = SJRMVI.SJRMVI_NROLEG AND  ((SJRMVI.SJRMVI_CUENTA >= '51020101') AND (SJRMVI.SJRMVI_CUENTA <= '51020114')) ) 
INNER JOIN SJRMVD
ON (SJRMVD_CODEMP = SJRMVI.SJRMVI_CODEMP AND SJRMVD_MODFOR = SJRMVI.SJRMVI_MODFOR AND SJRMVD_CODFOR = SJRMVI.SJRMVI_CODFOR AND SJRMVD_NROFOR = SJRMVI.SJRMVI_NROFOR AND SJRMVD_EMPLEG = SJRMVI.SJRMVI_EMPLEG AND SJRMVD_NROLEG = SJRMVI.SJRMVI_NROLEG AND SJRMVI_CODCPT = SJRMVD_CODCPT--AND  ((SJRMVI.SJRMVI_CUENTA >= '51020101') AND (SJRMVI.SJRMVI_CUENTA <= '51020114')) 
) 

WHERE 
	 (SJRMVH.SJRMVH_CODEMP = 'EMP02') 
		And  (SJRMVH.SJRMVH_MODFOR = 'SJ') 
		And  (SJRMVH.SJRMVH_PERIOD = 201608)  
		And (SJRMVI_CUENTA IS NOT NULL
		And NOT EXISTS (SELECT * FROM SJRMVG WHERE SJRMVG_CODFOR = SJRMVI_CODFOR
		And SJRMVG_NROFOR = SJRMVI_NROFOR
		And SJRMVG_CODEMP = SJRMVI_CODEMP
		And SJRMVG_NROLEG = SJRMVI_NROLEG
		And SJRMVG_CODCPT = SJRMVI_CODCPT)
		And SJRMVI_CALCUL>0) 

-- ROLLBACK TRAN
-- COMMIT TRAN 