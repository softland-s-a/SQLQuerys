insert into grcfor
([GRCFOR_CODEMP]
      ,[GRCFOR_MODFOR]
      ,[GRCFOR_CODFOR]
      ,[GRCFOR_DESCRP]
      ,[GRCFOR_TIPNUM]
      ,[GRCFOR_ULTNRO]
      ,[GRCFOR_ULTFEC]
      ,[GRCFOR_SUCURS]
      ,[GRCFOR_LETRID]
      ,[GRCFOR_MAXITM]
      ,[GRCFOR_IMPRES]
      ,[GRCFOR_RPTNAM]
      ,[GRCFOR_RECFEC]
      ,[GRCFOR_NROCAI]
      ,[GRCFOR_FCHCAI]
      ,[GRCFOR_TRAFCR]
      ,[GRCFOR_HSTFOR]
      ,[GRCFOR_TEXTOS]
      ,[GRCFOR_PERSON]
      ,[GRCFOR_MODNUM]
      ,[GRCFOR_SECNUM]
      ,[GRCFOR_SECFEC]
      ,[GRCFOR_MODFEC]
      ,[GRCFOR_REPECE]
      ,[GRCFOR_CODDGI]
      ,[GRCFOR_FECALT]
      ,[GRCFOR_FECMOD]
      ,[GRCFOR_ULTOPR]
      ,[GRCFOR_DEBAJA]
      ,[GRCFOR_OALIAS]
      ,[GRCFOR_USERID]
      )


( select GRTEMP_CODEMP
      ,[GRCFOR_MODFOR]
      ,[GRCFOR_CODFOR]
      ,[GRCFOR_DESCRP]
      ,[GRCFOR_TIPNUM]
      ,[GRCFOR_ULTNRO]
      ,[GRCFOR_ULTFEC]
      ,[GRCFOR_SUCURS]
      ,[GRCFOR_LETRID]
      ,[GRCFOR_MAXITM]
      ,[GRCFOR_IMPRES]
      ,[GRCFOR_RPTNAM]
      ,[GRCFOR_RECFEC]
      ,[GRCFOR_NROCAI]
      ,[GRCFOR_FCHCAI]
      ,[GRCFOR_TRAFCR]
      ,[GRCFOR_HSTFOR]
      ,[GRCFOR_TEXTOS]
      ,[GRCFOR_PERSON]
      ,[GRCFOR_MODNUM]
      ,[GRCFOR_SECNUM]
      ,[GRCFOR_SECFEC]
      ,[GRCFOR_MODFEC]
      ,[GRCFOR_REPECE]
      ,[GRCFOR_CODDGI]
      ,[GRCFOR_FECALT]
      ,[GRCFOR_FECMOD]
      ,[GRCFOR_ULTOPR]
      ,[GRCFOR_DEBAJA]
      ,[GRCFOR_OALIAS]
      ,[GRCFOR_USERID]
      from GRCFOR, GRTEMP
      WHERE not exists
      (select 1 from GRCFOR t1 where
      t1.GRCFOR_CODEMP = GRTEMP_CODEMP and
      t1.GRCFOR_MODFOR = grcfor.grcfor_modfor and
      t1.GRCFOR_CODFOR = grcfor.grcfor_codfor) AND
      grcfor_codemp = 'SABAVI01' AND
	  GRTEMP_CODEMP <> 'SABAVI01' AND
	  GRTEMP_ISMAIN <> 'S')


	