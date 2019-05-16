
--Inserta codigos postales faltantes de tabla de migracion
INSERT INTO GRTPAC 
(GRTPAC_CODPAI,GRTPAC_CODPOS,GRTPAC_DESCRP,GRTPAC_PAIPRO,GRTPAC_CODPRO,GRTPAC_FECALT,GRTPAC_FECMOD,
GRTPAC_USERID,GRTPAC_ULTOPR,GRTPAC_DEBAJA,GRTPAC_OALIAS)
select distinct pvmprh_codpai,pvmprh_codpos,'A COMPLETAR', PVMPRH_CODPAI,'Z',
GETDATE(),GETDATE(),'ADMIN','A','N','GRTPAC'
 from pvmigra
where
not exists(select * from grtpac where 
grtpac_codpai = pvmprh_codpai and
grtpac_codpos = pvmprh_codpos)


