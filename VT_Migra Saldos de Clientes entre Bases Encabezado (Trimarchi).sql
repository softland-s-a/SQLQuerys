insert into SoftlandLogicHT.dbo.VTRMVH
(
	VTRMVH_MODFOR, 
	VTRMVH_CODFOR, 
	VTRMVH_NROFOR, 
	VTRMVH_MODCOM, 
	VTRMVH_CODCOM, 
	VTRMVH_SUCURS, 
	VTRMVH_HSTFOR, 
	VTRMVH_TEXTOS, 
	VTRMVH_FCHMOV, 
	VTRMVH_NROCTA, 
	VTRMVH_NROSUB, 
	VTRMVH_IMPTCN, 
	VTRMVH_JURISD,
	VTRMVH_CODLIS, 
	VTRMVH_CNDPAG, 
	VTRMVH_VNDDOR, 
	VTRMVH_GRUBON, 
	VTRMVH_COFLIS, 
	VTRMVH_COBRAD, 
	VTRMVH_CAMBIO, 
	VTRMVH_COFFAC, 
	VTRMVH_COFDEU, 
	VTRMVH_CODEMP, 
	VTRMVH_FECALT, 
	VTRMVH_FECMOD, 
	VTRMVH_USERID, 
	VTRMVH_ULTOPR, 
	VTRMVH_DEBAJA, 
	VTRMVH_OALIAS
)
(
select
	VTRMVC_MODAPL, 			--VTRMVH_MODFOR, 
	VTRMVC_CODAPL, 			--VTRMVH_CODFOR, 
	VTRMVC_NROAPL, 			--VTRMVH_NROFOR, 
	'VT', 			--VTRMVH_MODCOM, 
	case 
		when sum(VTRMVC_IMPNAC) > 0 then'SID'
		when sum(VTRMVC_IMPNAC) < 0 then'SIA'
	end, 			--VTRMVH_CODCOM, 
	'0001', 			--VTRMVH_SUCURS, 
	0, 			--VTRMVH_HSTFOR, 
	'Saldo Inicial', 			--VTRMVH_TEXTOS, 
	min(VTRMVC_FCHMOV), 			--VTRMVH_FCHMOV, 
	VTMCLH_NROCTA, 			--VTRMVH_NROCTA, 
	VTMCLH_NROCTA, 			--VTRMVH_NROSUB, 
	VTRMVC_IMPTCN, 			--VTRMVH_IMPTCN,
	'901',					--VTRMVH_JURISD 
	VTMCLH_CNDPRE, 			--VTRMVH_CODLIS, 
	VTMCLH_CNDPAG, 			--VTRMVH_CNDPAG, 
	NULL, 			--VTRMVH_VNDDOR, 
	NULL, 			--VTRMVH_GRUBON, 
	case VTRMVC_COFLIS when 'DO' then 'USD' when 'PE' then 'ARS' end, 			--VTRMVH_COFLIS, 
	VTMCLH_COBRAD, 			--VTRMVH_COBRAD, 
	min(VTRMVC_CAMBIO), 			--VTRMVH_CAMBIO, 
	case VTRMVC_COFLIS when 'DO' then 'USD' when 'PE' then 'ARS' end, 			--VTRMVH_COFFAC, 
	case VTRMVC_COFLIS when 'DO' then 'USD' when 'PE' then 'ARS' end, 			--VTRMVH_COFDEU, 
	'HT2014', 			--VTRMVH_CODEMP, 
	getdate(), 				--VTRMVH_FECALT, 
	getdate(), 				--VTRMVH_FECMOD, 
	'SAR_MIG', 				--VTRMVH_USERID, 
	'A',		 			--VTRMVH_ULTOPR, 
	'N',		 			--VTRMVH_DEBAJA, 
	'VTRMVH'				--VTRMVH_OALIAS
from
	cwSGTrimarchisrl.dbo.VTRMVC, VTMCLH
where
	VTRMVC_NROCTA = USR_VTMCLH_NROCTA and
	not exists 
	(select 1 from SoftlandLogicHT.dbo.VTRMVH where 
		cwSGTrimarchisrl.dbo.VTRMVC.VTRMVC_MODAPL = SoftlandLogicHT.dbo.VTRMVH.VTRMVH_MODFOR and
		cwSGTrimarchisrl.dbo.VTRMVC.VTRMVC_CODAPL = SoftlandLogicHT.dbo.VTRMVH.VTRMVH_CODFOR and
		cwSGTrimarchisrl.dbo.VTRMVC.VTRMVC_NROAPL = SoftlandLogicHT.dbo.VTRMVH.VTRMVH_NROFOR)
group by
	VTMCLH_NROCTA,
	VTRMVC_MODAPL, 			--VTRMVH_MODFOR, 
	VTRMVC_CODAPL, 			--VTRMVH_CODFOR, 
	VTRMVC_NROAPL, 			--VTRMVH_NROFOR, 
	VTRMVC_NROCTA, 			--VTRMVH_NROCTA, 
	VTRMVC_IMPTCN, 			--VTRMVH_IMPTCN, 
	VTMCLH_CNDPRE, 			--VTRMVH_CODLIS, 
	VTMCLH_CNDPAG, 			--VTRMVH_CNDPAG, 
	VTMCLH_VNDDOR, 			--VTRMVH_VNDDOR, 
	VTMCLH_GRUBON, 			--VTRMVH_GRUBON, 
	VTRMVC_COFLIS, 			--VTRMVH_COFLIS, 
	VTMCLH_COBRAD 			--VTRMVH_COBRAD, 
having
	sum(VTRMVC_IMPNAC) <> 0)

