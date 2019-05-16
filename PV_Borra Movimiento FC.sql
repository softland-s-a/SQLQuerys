declare @@MOD varchar(2), @@COD varchar(6), @@NRO int, @@NRO2 int

select
@@MOD = 'PV',
@@COD = 'SA',
@@NRO = 401000001

--SELECT * FROM pvrmvh 
--where pvrmvh_modfor = @@MOD and pvrmvh_codfor = @@COD and pvrmvh_nrofor = @@NRO
--
--SELECT * FROM pvrmvh 
--where pvrmvh_modfor = @@MOD and pvrmvh_codfor = @@COD and pvrmvh_nrofor = @@NRO

SELECT * FROM cormvi
where cormvi_modfor = @@MOD and cormvi_codfor = @@COD and cormvi_nrofor = @@NRO2

delete CORMVA where CORMVA_modfor = @@MOD and CORMVA_codfor = @@COD and CORMVA_nrofor = @@NRO
delete cormvp where cormvp_modfor = @@MOD and cormvp_codfor = @@COD and cormvp_nrofor = @@NRO
delete cormvg where cormvg_modfor = @@MOD and cormvg_codfor = @@COD and cormvg_nrofor = @@NRO
delete cormvd where cormvd_modfor = @@MOD and cormvd_codfor = @@COD and cormvd_nrofor = @@NRO
delete cormvi where cormvi_modfor = @@MOD and cormvi_codfor = @@COD and cormvi_nrofor = @@NRO
delete cormvh where cormvh_modfor = @@MOD and cormvh_codfor = @@COD and cormvh_nrofor = @@NRO

delete pvrmvT where pvrmvT_modfor = @@MOD and pvrmvT_codfor = @@COD and pvrmvT_nrofor = @@NRO
delete pvrmvg where pvrmvg_modfor = @@MOD and pvrmvg_codfor = @@COD and pvrmvg_nrofor = @@NRO
delete pvrmvd where pvrmvd_modfor = @@MOD and pvrmvd_codfor = @@COD and pvrmvd_nrofor = @@NRO
delete pvrmvp where pvrmvp_modfor = @@MOD and pvrmvp_codfor = @@COD and pvrmvp_nrofor = @@NRO
delete pvrmvi where pvrmvi_modfor = @@MOD and pvrmvi_codfor = @@COD and pvrmvi_nrofor = @@NRO
delete pvrmvc where pvrmvc_modfor = @@MOD and pvrmvc_codfor = @@COD and pvrmvc_nrofor = @@NRO
delete pvrmvR where pvrmvR_modfor = @@MOD and pvrmvR_codfor = @@COD and pvrmvR_nrofor = @@NRO
delete pvrmvH where pvrmvH_modfor = @@MOD and pvrmvH_codfor = @@COD and pvrmvH_nroFOR = @@NRO
