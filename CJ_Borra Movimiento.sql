declare @@MOD varchar(2), @@COD varchar(6), @@NRO int

select
@@MOD = 'CJ',
@@COD = 'RESTRA',
@@NRO = 1

delete CJRMVG where CJRMVG_MODFOR = @@MOD and CJRMVG_CODFOR = @@COD and CJRMVG_NROFOR = @@NRO
delete CJRMVD where CJRMVD_MODFOR = @@MOD and CJRMVD_CODFOR = @@COD and CJRMVD_NROFOR = @@NRO
delete CJRMVI where CJRMVI_MODFOR = @@MOD and CJRMVI_CODFOR = @@COD and CJRMVI_NROFOR = @@NRO
delete CJRMVH where CJRMVH_MODFOR = @@MOD and CJRMVH_CODFOR = @@COD and CJRMVH_NROFOR = @@NRO

