declare @@MOD varchar(2), @@COD varchar(6), @@NRO int, @@NRO2 int

select
@@MOD = 'VT', -- ingresar modulo de formulario
@@COD = 'CA0161', -- ingresar codigo de formulario
@@NRO = 15119-- ingresar numero de formulario

SELECT * FROM vtrmvh 
where vtrmvh_modfor = @@MOD and vtrmvh_codfor = @@COD and vtrmvh_nrofor = @@NRO

SELECT * FROM vtrmvh 
where vtrmvh_modfor = @@MOD and vtrmvh_codfor = @@COD and vtrmvh_nrofor = @@NRO

SELECT * FROM fcrmvi
where fcrmvi_modfor = @@MOD and fcrmvi_codfor = @@COD and fcrmvi_nrofor = @@NRO2

delete fcrmvg where fcrmvg_modfor = @@MOD and fcrmvg_codfor = @@COD and fcrmvg_nrofor = @@NRO
delete fcrmvp where fcrmvp_modfor = @@MOD and fcrmvp_codfor = @@COD and fcrmvp_nrofor = @@NRO
delete fcrmvd where fcrmvd_modfor = @@MOD and fcrmvd_codfor = @@COD and fcrmvd_nrofor = @@NRO
delete fcrmvi where fcrmvi_modfor = @@MOD and fcrmvi_codfor = @@COD and fcrmvi_nrofor = @@NRO
delete fcrmvh where fcrmvh_modfor = @@MOD and fcrmvh_codfor = @@COD and fcrmvh_nrofor = @@NRO


delete vtrmvg where vtrmvg_modfor = @@MOD and vtrmvg_codfor = @@COD and vtrmvg_nrofor = @@NRO
delete vtrmvd where vtrmvd_modfor = @@MOD and vtrmvd_codfor = @@COD and vtrmvd_nrofor = @@NRO
delete vtrmvp where vtrmvp_modfor = @@MOD and vtrmvp_codfor = @@COD and vtrmvp_nrofor = @@NRO
delete vtrmvi where vtrmvi_modfor = @@MOD and vtrmvi_codfor = @@COD and vtrmvi_nrofor = @@NRO
delete vtrmvc where vtrmvc_modfor = @@MOD and vtrmvc_codfor = @@COD and vtrmvc_nrofor = @@NRO
delete vtrmvc where vtrmvc_modfor = @@MOD and vtrmvc_codfor = @@COD and vtrmvc_nroapl = @@NRO
delete vtrmvh where vtrmvh_modfor = @@MOD and vtrmvh_codfor = @@COD and vtrmvh_nrofor = @@NRO
