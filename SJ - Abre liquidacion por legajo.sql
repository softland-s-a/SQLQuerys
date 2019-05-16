
DECLARE @Codemp varchar(6),@Nroleg varchar(6),@Tipliq varchar(6),@Claemp varchar(6),@Period numeric (6,0)

--SETEO DATOS DEL LEGAJO Y LIQUIDACION A ABRIR
set @Codemp = 'EMP01'
set @Nroleg = '109637'
set @Tipliq ='M'
set @Claemp ='M'
set @Period = 201502

SELECT * FROM SJRMVI WHERE
sjrmvi_codemp = @Codemp and
sjrmvi_nroleg = @Nroleg and
sjrmvi_tipliq = @Tipliq and
sjrmvi_claemp = @Claemp and
sjrmvi_period = @Period

SELECT * FROM SJRMVH
where
sjrmvh_codemp = @Codemp and
sjrmvh_nroleg = @Nroleg and
sjrmvh_tipliq = @Tipliq and
sjrmvh_claemp = @Claemp and
sjrmvh_period = @Period

SELECT * FROM SJRMVH 
where 
sjrmvh_codemp = @Codemp and
sjrmvh_nroleg = @Nroleg and
sjrmvh_tipliq = @Tipliq and
sjrmvh_claemp = @Claemp and
sjrmvh_period = @Period and
sjrmvh_codfor = 'C'

select * from sjrmvd,sjrmvh  where
sjrmvh_codemp = sjrmvd_codemp and
sjrmvh_modfor = sjrmvd_modfor and
sjrmvh_codfor = sjrmvd_codfor and
sjrmvh_nrofor = sjrmvd_nrofor and
sjrmvh_nroleg = sjrmvd_nroleg and
sjrmvd_codemp = @Codemp and
sjrmvd_nroleg = @Nroleg and
sjrmvh_tipliq = @Tipliq and
sjrmvh_claemp = @Claemp and
sjrmvh_period = @Period 

select * from sjrmvg,sjrmvh  where
sjrmvh_codemp = sjrmvg_codemp and
sjrmvh_modfor = sjrmvg_modfor and
sjrmvh_codfor = sjrmvg_codfor and
sjrmvh_nrofor = sjrmvg_nrofor and
sjrmvh_nroleg = sjrmvg_nroleg and
sjrmvg_codemp = @Codemp and
sjrmvg_nroleg = @Nroleg and
sjrmvh_tipliq = @Tipliq and
sjrmvh_claemp = @Claemp and
sjrmvh_period = @Period 

--
update sjrmvi set
sjrmvi_modcie = null,
sjrmvi_Codcie = null,
sjrmvi_nrocie = null
where
sjrmvi_codemp = @Codemp and
sjrmvi_nroleg = @Nroleg and
sjrmvi_tipliq = @Tipliq and
sjrmvi_claemp = @Claemp and
sjrmvi_period = @Period

update sjrmvh set
sjrmvh_cierre = 'N'
where
sjrmvh_codemp = @Codemp and
sjrmvh_nroleg = @Nroleg and
sjrmvh_tipliq = @Tipliq and
sjrmvh_claemp = @Claemp and
sjrmvh_period = @Period

delete sjrmvh where 
sjrmvh_codemp = @Codemp and
sjrmvh_nroleg = @Nroleg and
sjrmvh_tipliq = @Tipliq and
sjrmvh_claemp = @Claemp and
sjrmvh_period = @Period and
sjrmvh_codfor = 'C'

delete  sjrmvg from sjrmvh  where
sjrmvh_codemp = sjrmvg_codemp and
sjrmvh_modfor = sjrmvg_modfor and
sjrmvh_codfor = sjrmvg_codfor and
sjrmvh_nrofor = sjrmvg_nrofor and
sjrmvh_nroleg = sjrmvg_nroleg and
sjrmvg_codemp = @Codemp and
sjrmvg_nroleg = @Nroleg and
sjrmvh_tipliq = @Tipliq and
sjrmvh_claemp = @Claemp and
sjrmvh_period = @Period 

delete sjrmvd from sjrmvh  where
sjrmvh_codemp = sjrmvd_codemp and
sjrmvh_modfor = sjrmvd_modfor and
sjrmvh_codfor = sjrmvd_codfor and
sjrmvh_nrofor = sjrmvd_nrofor and
sjrmvh_nroleg = sjrmvd_nroleg and
sjrmvd_codemp = @Codemp and
sjrmvd_nroleg = @Nroleg and
sjrmvh_tipliq = @Tipliq and
sjrmvh_claemp = @Claemp and
sjrmvh_period = @Period 

