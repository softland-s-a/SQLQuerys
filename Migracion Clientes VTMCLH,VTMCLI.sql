
INSERT INTO VTMCLH
(VTMCLH_NROCTA,
VTMCLH_RUBR01,
VTMCLH_NOMBRE,
VTMCLH_NROSUB,
VTMCLH_DIRECC,
VTMCLH_CODPAI,
VTMCLH_CODPOS,
VTMCLH_MUNICP,
VTMCLH_FLETES,
VTMCLH_TELEFN,
VTMCLH_CNDIVA,
VTMCLH_TIPDOC,
VTMCLH_NRODOC,
VTMCLH_VNDDOR,
VTMCLH_COBRAD,
VTMCLH_JURISD,
VTMCLH_CODZON,
VTMCLH_ACTIVD,
VTMCLH_CATEGO,
VTMCLH_CNDPAG,
VTMCLH_CNDPRE,
VTMCLH_CODCRD,
VTMCLH_GRUBON,
VTMCLH_CAMION,
VTMCLH_CAMALT,
VTMCLH_TRACOD,
VTMCLH_DIRENT,
VTMCLH_PAIENT,
VTMCLH_CODENT,
VTMCLH_JURENT,
VTMCLH_ZONENT,
VTMCLH_COPIVT,
VTMCLH_COPIFC,
VTMCLH_COPIST,
VTMCLH_TEXTOS,
VTMCLH_TIPDO1,
VTMCLH_TIPDO2,
VTMCLH_TIPDO3,
VTMCLH_TIPDO4,
VTMCLH_TIPDO5,
VTMCLH_DIREML,
VTMCLH_SEGPRO,
VTMCLH_CONTAD,
VTMCLH_EDISUB,
VTMCLH_CUENTA,
VTMCLH_MAXITM,
VTMCLH_DIFDIA,
VTMCLH_DIFDES,
VTMCLH_DIFHAS,
VTMCLH_PERINA,
VTMCLH_IMPDIF,
VTMCLH_CNDINT,
VTMCLH_DISTRI,
VTMCLH_DEPOSI,
VTMCLH_SECTOR,
VTMCLH_NRODIS,
VTMCLH_INHIBE,
VTMCLH_PRMXPR,
VTMCLH_PRMIPR,
VTMCLH_TRAFCR,
VTMCLH_CODCOF,
VTMCLH_MODCPT,
VTMCLH_TIPCPT,
VTMCLH_CODCPT,
VTMCLH_LISCLI,
VTMCLH_TIPOPR,
VTMCLH_MODPAG,
VTMCLH_TIPPAG,
VTMCLH_MEDPAG,
VTMCLH_GENXML,
VTMCLH_FECALT,
VTMCLH_FECMOD,
VTMCLH_USERID,
VTMCLH_ULTOPR,
VTMCLH_DEBAJA,
VTMCLH_OALIAS,
USR_VTMCLH_NOMFAN
)
(SELECT
VTMCLH_NROCTA,--VTMCLH_NROCTA
VTMCLH_NROCTA,--VTMCLH_RUBR01
VTMCLH_NOMBRE,--VTMCLH_NOMBRE
VTMCLH_NROCTA,--VTMCLH_NROSUB
LEFT(VTMCLH_DIRECC,60),--VTMCLH_DIRECC
VTMCLH_CODPAI,--VTMCLH_CODPAI
VTMCLH_CODPOS,--VTMCLH_CODPOS
NULL,--VTMCLH_MUNICP
'N',--VTMCLH_FLETES
VTMCLH_TELEFN,--VTMCLH_TELEFN
VTMCLH_CNDIVA,--VTMCLH_CNDIVA
VTMCLH_TIPDOC,--VTMCLH_TIPDOC
REPLACE(VTMIG.VTMCLH_NRODOC,'-',''),--VTMCLH_NRODOC
VTMCLH_VNDDOR,--VTMCLH_VNDDOR
'01',--VTMCLH_COBRAD
VTMCLH_JURISD,--VTMCLH_JURISD
'01',--VTMCLH_CODZON
NULL,--VTMCLH_ACTIVD
NULL,--VTMCLH_CATEGO
'000',--VTMCLH_CNDPAG
'01',--VTMCLH_CNDPRE
'01',--VTMCLH_CODCRD
NULL,--VTMCLH_GRUBON
NULL,--VTMCLH_CAMION
NULL,--VTMCLH_CAMALT
NULL,--VTMCLH_TRACOD
VTMCLH_DIRECC,--VTMCLH_DIRENT
VTMCLH_CODPAI,--VTMCLH_PAIENT
VTMCLH_CODPOS,--VTMCLH_CODENT
VTMCLH_JURISD,--VTMCLH_JURENT
'01',--VTMCLH_ZONENT
1,--VTMCLH_COPIVT
1,--VTMCLH_COPIFC
1,--VTMCLH_COPIST
'',--VTMCLH_TEXTOS
NULL,--VTMCLH_TIPDO1
NULL,--VTMCLH_TIPDO2
NULL,--VTMCLH_TIPDO3
NULL,--VTMCLH_TIPDO4
NULL,--VTMCLH_TIPDO5
VTMCLH_DIREML,--VTMCLH_DIREML
'N',--VTMCLH_SEGPRO
'N',--VTMCLH_CONTAD
'N',--VTMCLH_EDISUB
NULL,--VTMCLH_CUENTA
0,--VTMCLH_MAXITM
0,--VTMCLH_DIFDIA
GETDATE(),--VTMCLH_DIFDES
GETDATE(),--VTMCLH_DIFHAS
'201501',--VTMCLH_PERINA
0,--VTMCLH_IMPDIF
NULL,--VTMCLH_CNDINT
NULL,--VTMCLH_DISTRI
NULL,--VTMCLH_DEPOSI
NULL,--VTMCLH_SECTOR
NULL,--VTMCLH_NRODIS
'N',--VTMCLH_INHIBE
0,--VTMCLH_PRMXPR
0,--VTMCLH_PRMIPR
'N',--VTMCLH_TRAFCR
NULL,--VTMCLH_CODCOF
NULL,--VTMCLH_MODCPT
NULL,--VTMCLH_TIPCPT
NULL,--VTMCLH_CODCPT
'N',--VTMCLH_LISCLI
NULL,--VTMCLH_TIPOPR
NULL,--VTMCLH_MODPAG
NULL,--VTMCLH_TIPPAG
NULL,--VTMCLH_MEDPAG
'N',--VTMCLH_GENXML
GETDATE(),--VTMCLH_FECALT
GETDATE(),--VTMCLH_FECMOD
'GSA_MIG',--VTMCLH_USERID
'A',--VTMCLH_ULTOPR
'N',--VTMCLH_DEBAJA
'VTMCLH',--VTMCLH_OALIAS
''--USR_VTMCLH_NOMFAN
FROM
VTMIG
WHERE
LEN(VTMCLH_TIPDOC)<3)

INSERT INTO VTMCLI
(VTMCLI_NROCTA,
VTMCLI_TIPIMP,
VTMCLI_CORRES,
VTMCLI_INCLUI,
VTMCLI_EXEDEN,
VTMCLI_VIGENC,
VTMCLI_FCHDES,
VTMCLI_FECHAS,
VTMCLI_DISIMP,
VTMCLI_FECALT,
VTMCLI_FECMOD,
VTMCLI_USERID,
VTMCLI_ULTOPR,
VTMCLI_DEBAJA,
VTMCLI_OALIAS)
(
SELECT 
VTMCLH_NROCTA,
'IVA',
'S',
(CASE WHEN VTMCLH_CNDIVA = 'I' THEN 'N' ELSE 'S' END),
0,
'N',
GETDATE(),
GETDATE(),
'N',
GETDATE(),
GETDATE(),
'GSA_MIG',
'A',
'N',
'VTMCLI'
FROM VTMCLH
WHERE VTMCLH_NROCTA <> '000000')

