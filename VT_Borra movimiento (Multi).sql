declare @@MOD varchar(2), @@COD varchar(6), @@NRO int, @@NRO2 int, @@EMP VARCHAR(10)

select
@@EMP = 'BC01', -- Ingresar codigo de empresa
@@MOD = 'VT', -- ingresar modulo de formulario
@@COD = 'FA0004', -- ingresar codigo de formulario
@@NRO = 63938 -- ingresar numero de formulario

--SELECT * FROM vtrmvh 
--where vtrmvh_modfor = @@MOD and vtrmvh_codfor = @@COD and vtrmvh_nrofor = @@NRO and vtrmvh_codemp = @@EMP

--SELECT * FROM vtrmvh 
--where vtrmvh_modfor = @@MOD and vtrmvh_codfor = @@COD and vtrmvh_nrofor = @@NRO and vtrmvh_codemp= @@EMP

---ST-----------

delete strmvi
from fcrmvh
inner join strmvi on
strmvi_codemp = fcrmvh_empost and
strmvi_modfor = fcrmvh_modost and
strmvi_codfor = fcrmvh_codost and
strmvi_nrofor = fcrmvh_nroost where fcrmvh_modfor = @@MOD and fcrmvh_codfor = @@COD and fcrmvh_nrofor = @@NRO  and fcrmvh_codemp = @@EMP

delete strmvh
from fcrmvh
inner join strmvh on
strmvh_codemp = fcrmvh_empost and
strmvh_modfor = fcrmvh_modost and
strmvh_codfor = fcrmvh_codost and
strmvh_nrofor = fcrmvh_nroost where fcrmvh_modfor = @@MOD and fcrmvh_codfor = @@COD and fcrmvh_nrofor = @@NRO  and fcrmvh_codemp = @@EMP

---CJ-----------


delete cjrmvg where cjrmvg_modfor = 'CJ' and cjrmvg_codfor = @@COD and cjrmvg_nrofor = @@NRO and cjrmvg_codemp = @@EMP
delete cjrmvd where cjrmvd_modfor = 'CJ' and cjrmvd_codfor = @@COD and cjrmvd_nrofor = @@NRO  and cjrmvd_codemp = @@EMP
delete cjrmvi where cjrmvi_modfor = 'CJ'  and cjrmvi_codfor = @@COD and cjrmvi_nrofor = @@NRO  and cjrmvi_codemp = @@EMP
delete cjrmvh where cjrmvh_modfor = 'CJ'  and cjrmvh_codfor = @@COD and cjrmvh_nrofor = @@NRO  and cjrmvh_codemp = @@EMP


delete fcrmvg where fcrmvg_modfor = @@MOD and fcrmvg_codfor = @@COD and fcrmvg_nrofor = @@NRO and fcrmvg_codemp = @@EMP
delete fcrmvp where fcrmvp_modfor = @@MOD and fcrmvp_codfor = @@COD and fcrmvp_nrofor = @@NRO and fcrmvp_codemp = @@EMP 
delete fcrmvd where fcrmvd_modfor = @@MOD and fcrmvd_codfor = @@COD and fcrmvd_nrofor = @@NRO  and fcrmvd_codemp = @@EMP
delete fcrmvi where fcrmvi_modfor = @@MOD and fcrmvi_codfor = @@COD and fcrmvi_nrofor = @@NRO  and fcrmvi_codemp = @@EMP
delete fcrmvh where fcrmvh_modfor = @@MOD and fcrmvh_codfor = @@COD and fcrmvh_nrofor = @@NRO  and fcrmvh_codemp = @@EMP


delete vtrmvg where vtrmvg_modfor = @@MOD and vtrmvg_codfor = @@COD and vtrmvg_nrofor = @@NRO  and vtrmvg_codemp = @@EMP
delete vtrmvd where vtrmvd_modfor = @@MOD and vtrmvd_codfor = @@COD and vtrmvd_nrofor = @@NRO  and vtrmvd_codemp = @@EMP
delete vtrmvp where vtrmvp_modfor = @@MOD and vtrmvp_codfor = @@COD and vtrmvp_nrofor = @@NRO  and vtrmvp_codemp = @@EMP
delete vtrmvi where vtrmvi_modfor = @@MOD and vtrmvi_codfor = @@COD and vtrmvi_nrofor = @@NRO  and vtrmvi_codemp = @@EMP
delete vtrmvc where vtrmvc_modfor = @@MOD and vtrmvc_codfor = @@COD and vtrmvc_nrofor = @@NRO  and vtrmvc_codemp = @@EMP
delete vtrmvc where vtrmvc_modfor = @@MOD and vtrmvc_codfor = @@COD and vtrmvc_nroapl = @@NRO  and vtrmvc_codemp = @@EMP
delete vtrmvh where vtrmvh_modfor = @@MOD and vtrmvh_codfor = @@COD and vtrmvh_nrofor = @@NRO  and vtrmvh_codemp = @@EMP