insert into SoftlandLogicHT.dbo.VTRMVI
(
	VTRMVI_MODFOR, 
	VTRMVI_CODFOR, 
	VTRMVI_NROFOR, 
	VTRMVI_NROITM, 
	VTRMVI_DEBHAB, 
	VTRMVI_MODCPT, 
	VTRMVI_TIPCPT, 
	VTRMVI_CODCPT, 
	VTRMVI_CUENTA, 
	VTRMVI_IMPNAC, 
	VTRMVI_IMPEXT, 
	VTRMVI_IMPDEB, 
	VTRMVI_IMPHAB, 
	VTRMVI_MODAPL, 
	VTRMVI_CODAPL, 
	VTRMVI_NROAPL, 
	VTRMVI_CUOAPL, 
	VTRMVI_EXTDEB, 
	VTRMVI_EXTHAB, 
	VTRMVI_IMPSEC, 
	VTRMVI_SECDEB, 
	VTRMVI_SECHAB, 
	VTRMVI_FECALT, 
	VTRMVI_FECMOD, 
	VTRMVI_USERID, 
	VTRMVI_ULTOPR, 
	VTRMVI_DEBAJA, 
	VTRMVI_OALIAS
)
(
select
	VTRMVH_MODFOR, 		--	VTRMVI_MODFOR, 
	VTRMVH_CODFOR, 		--	VTRMVI_CODFOR, 
	VTRMVH_NROFOR, 		--	VTRMVI_NROFOR, 
	1, 		--	VTRMVI_NROITM, 
	case VTRMVH_CODCOM when 'SID' then 'H' when 'SIA' then 'D' else 'D' end, 		--	VTRMVI_DEBHAB, 
	'VT', 		--	VTRMVI_MODCPT, 
	'A', 		--	VTRMVI_TIPCPT, 
	'V000', 		--	VTRMVI_CODCPT, 
	'91040101', 		--	VTRMVI_CUENTA, 
	sum(VTRMVC_IMPNAC), 		--	VTRMVI_IMPNAC, 
	sum(VTRMVC_IMPEXT), 		--	VTRMVI_IMPEXT, 
	case VTRMVH_CODCOM when 'SID' then 0 when 'SIA' then sum(VTRMVC_IMPNAC) end, 		--	VTRMVI_IMPDEB, 
	case VTRMVH_CODCOM when 'SIA' then 0 when 'SID' then sum(VTRMVC_IMPNAC) end, 		--	VTRMVI_IMPHAB, 
	VTRMVH_MODFOR, 		--	VTRMVI_MODAPL, 
	VTRMVH_CODFOR, 		--	VTRMVI_CODAPL, 
	VTRMVH_NROFOR, 		--	VTRMVI_NROAPL, 
	1, 		--	VTRMVI_CUOAPL, 
	case VTRMVH_CODCOM when 'SID' then 0 when 'SIA' then sum(VTRMVC_IMPEXT) end, 		--	VTRMVI_EXTDEB, 
	case VTRMVH_CODCOM when 'SIA' then 0 when 'SID' then sum(VTRMVC_IMPEXT) end, 		--	VTRMVI_EXTHAB, 
	sum(VTRMVC_IMPSEC), 		--	VTRMVI_IMPSEC, 
	case VTRMVH_CODCOM when 'SID' then 0 when 'SIA' then sum(VTRMVC_IMPSEC) end, 		--	VTRMVI_SECDEB, 
	case VTRMVH_CODCOM when 'SIA' then 0 when 'SID' then sum(VTRMVC_IMPSEC) end, 		--	VTRMVI_SECHAB, 
	getdate(), 		--	VTRMVI_FECALT, 
	getdate(), 		--	VTRMVI_FECMOD, 
	'SAR_MIG', 		--	VTRMVI_USERID, 
	'A', 		--	VTRMVI_ULTOPR, 
	'N', 		--	VTRMVI_DEBAJA, 
	'VTRMVI'		--	VTRMVI_OALIAS
from
	VTRMVH, VTRMVC
where
	VTRMVH_MODFOR = VTRMVC_MODAPL and
	VTRMVH_CODFOR = VTRMVC_CODAPL and
	VTRMVH_NROFOR = VTRMVC_NROAPL and
	not exists
	(select 1 from SoftlandLogicHT.dbo.VTRMVI where 
		VTRMVI_MODFOR = VTRMVH_MODFOR and
		VTRMVI_CODFOR = VTRMVH_CODFOR and
		VTRMVI_NROFOR = VTRMVI_NROFOR and
		VTRMVI_NROITM = 1)
group by
	VTRMVH_MODFOR, 		--	VTRMVI_MODFOR, 
	VTRMVH_CODFOR, 		--	VTRMVI_CODFOR, 
	VTRMVH_NROFOR, 		--	VTRMVI_NROFOR, 
	VTRMVH_CODCOM 		--	VTRMVI_DEBHAB, 

union

select
	VTRMVH_MODFOR, 		--	VTRMVI_MODFOR, 
	VTRMVH_CODFOR, 		--	VTRMVI_CODFOR, 
	VTRMVH_NROFOR, 		--	VTRMVI_NROFOR, 
	2, 		--	VTRMVI_NROITM, 
	case VTRMVH_CODCOM when 'SID' then 'D' when 'SIA' then 'H' else 'D' end, 		--	VTRMVI_DEBHAB, 
	'VT', 		--	VTRMVI_MODCPT, 
	'T', 		--	VTRMVI_TIPCPT, 
	'DVT001', 		--	VTRMVI_CODCPT, 
	'11030101', 		--	VTRMVI_CUENTA, 
	sum(VTRMVC_IMPNAC), 		--	VTRMVI_IMPNAC, 
	sum(VTRMVC_IMPEXT), 		--	VTRMVI_IMPEXT, 
	case VTRMVH_CODCOM when 'SIA' then 0 when 'SID' then sum(VTRMVC_IMPNAC) end, 		--	VTRMVI_IMPDEB, 
	case VTRMVH_CODCOM when 'SID' then 0 when 'SIA' then sum(VTRMVC_IMPNAC) end, 		--	VTRMVI_IMPHAB, 
	VTRMVH_MODFOR, 		--	VTRMVI_MODAPL, 
	VTRMVH_CODFOR, 		--	VTRMVI_CODAPL, 
	VTRMVH_NROFOR, 		--	VTRMVI_NROAPL, 
	1, 		--	VTRMVI_CUOAPL, 
	case VTRMVH_CODCOM when 'SIA' then 0 when 'SID' then sum(VTRMVC_IMPEXT) end, 		--	VTRMVI_EXTDEB, 
	case VTRMVH_CODCOM when 'SID' then 0 when 'SIA' then sum(VTRMVC_IMPEXT) end, 		--	VTRMVI_EXTHAB, 
	sum(VTRMVC_IMPSEC), 		--	VTRMVI_IMPSEC, 
	case VTRMVH_CODCOM when 'SIA' then 0 when 'SID' then sum(VTRMVC_IMPSEC) end, 		--	VTRMVI_SECDEB, 
	case VTRMVH_CODCOM when 'SID' then 0 when 'SIA' then sum(VTRMVC_IMPSEC) end, 		--	VTRMVI_SECHAB, 
	getdate(), 		--	VTRMVI_FECALT, 
	getdate(), 		--	VTRMVI_FECMOD, 
	'SAR_MIG', 		--	VTRMVI_USERID, 
	'A', 		--	VTRMVI_ULTOPR, 
	'N', 		--	VTRMVI_DEBAJA, 
	'VTRMVI'		--	VTRMVI_OALIAS
from
	SoftlandLogicHT.dbo.VTRMVH, SoftlandLogicHT.dbo.VTRMVC
where
	VTRMVH_MODFOR = VTRMVC_MODAPL and
	VTRMVH_CODFOR = VTRMVC_CODAPL and
	VTRMVH_NROFOR = VTRMVC_NROAPL and
	not exists
	(select 1 from SoftlandLogicHT.dbo.VTRMVI where 
		VTRMVI_MODFOR = VTRMVH_MODFOR and
		VTRMVI_CODFOR = VTRMVH_CODFOR and
		VTRMVI_NROFOR = VTRMVI_NROFOR and
		VTRMVI_NROITM = 2)
group by
	VTRMVH_MODFOR, 		--	VTRMVI_MODFOR, 
	VTRMVH_CODFOR, 		--	VTRMVI_CODFOR, 
	VTRMVH_NROFOR, 		--	VTRMVI_NROFOR, 
	VTRMVH_CODCOM 		--	VTRMVI_DEBHAB, 
)
