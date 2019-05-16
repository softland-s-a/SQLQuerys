
/* Borra Movimientos de Autorizaciones */
Truncate table GRTLAU
Truncate Table AUTHIH
Update AUTCCH Set AUTCCH_ULTLOT = 0

select * from AUTHIH

/* Borra Movimientos de Tesorería */

Truncate Table CJRMVG
Truncate Table CJRMVD
Truncate Table CJRMVI
Delete CJRMVH
Update GRCFOR Set GRCFOR_ULTNRO = 0, GRCFOR_ULTFEC = '20131203' Where GRCFOR_MODFOR = 'CJ'

/* Borra Movimientos de Compras */
Truncate Table CORMVZY
Truncate Table CORMVZ
Truncate Table CORMVY
Truncate Table CORCTP
Truncate Table CORCTI
Truncate Table CORCTH
Truncate Table CORMVF
Truncate Table CORMVA
Truncate Table CORMVV
Truncate Table CORMVP
Truncate Table CORMVG
Truncate Table CORMVD
Truncate Table CORMVI
Delete CORMVH
Update GRCFOR Set GRCFOR_ULTNRO = 0, GRCFOR_ULTFEC = '20131203' Where GRCFOR_MODFOR = 'CO'

/* Borra Movimientos de Proveedores */

Truncate Table PVRMVT
Truncate Table PVTACU
Truncate Table PVROPR
Truncate Table PVROPH
Truncate Table PVRMVP
Truncate Table PVRMVG
Truncate Table PVRMVD
Truncate Table PVRMVI
Truncate Table PVRMVC
Truncate Table PVRMVN
Truncate Table PVRMVR
Delete PVRMVH
Update GRCFOR Set GRCFOR_ULTNRO = 0, GRCFOR_ULTFEC = '20131203' Where GRCFOR_MODFOR = 'PV'

/* Borra Movimientos de Stock */

Truncate Table STRMVZ
Truncate Table STRMVK
Truncate Table STRMVI
truncate table STRACD
Delete STRMVH
Update GRCFOR Set GRCFOR_ULTNRO = 0, GRCFOR_ULTFEC = '20131203' Where GRCFOR_MODFOR = 'ST'

/* Borra Movimientos de Facturacion */

Truncate Table FCRMVF
Truncate Table FCRMVA
Truncate Table FCRMVP
Truncate Table FCRMVG
Truncate Table FCRMVD
Truncate Table FCRMVV
Truncate Table FCRMVI
Delete FCRMVH
Update GRCFOR Set GRCFOR_ULTNRO = 0, GRCFOR_ULTFEC = '20131203' Where GRCFOR_MODFOR = 'FC'

/* Borra Movimientos de Cliente */

Truncate Table VTRMVP
Truncate Table VTRMVG
Truncate Table VTRMVD
Truncate Table VTRMVI
Truncate Table VTRMVC
Truncate Table VTRMVN
Truncate Table VTRDBH
Delete VTRMVH
Update GRCFOR Set GRCFOR_ULTNRO = 0, GRCFOR_ULTFEC = '20131203' Where GRCFOR_MODFOR = 'VT'

/* Borra Movimientos de Cash Flow */

Truncate Table CFRMVG
Truncate Table CFRMVD
Truncate Table CFRMVI
truncate table CFTEMP
Delete CFRMVH
Update GRCFOR Set GRCFOR_ULTNRO = 0, GRCFOR_ULTFEC = '20131203' Where GRCFOR_MODFOR = 'CF'

/* Borra Movimientos de Contrato */

--Truncate Table CVMCTG
--Truncate Table CVMCTD
--Truncate Table CVMCTI
--Truncate Table CVMCTH
Truncate Table CVRMVP
Truncate Table CVRMVG
Truncate Table CVRMVD
Truncate Table CVRMVI
truncate table cvrmhi
Delete CVRMVH

/* Borra Movimientos de E.O.A.F. */

Truncate Table EORMVG
Truncate Table EORMVI
Delete EORMVH

/* Borra Movimientos de Gestion de Cobranzas */

Truncate Table GCAPTE
Truncate Table GCRMVI
Delete GCRMVH
Update GRCFOR Set GRCFOR_ULTNRO = 0, GRCFOR_ULTFEC = '20131203' Where GRCFOR_MODFOR = 'GC'

/* Borra Movimientos de Sueldos y Jornales */

Truncate Table SJTNOG
Truncate Table SJTNOD
Truncate Table SJTNOI
Truncate Table SJTNOH
Truncate Table SJRMVG
Truncate Table SJRMVD
Truncate Table SJRMVI
Delete SJRMVH
Update GRCFOR Set GRCFOR_ULTNRO = 0, GRCFOR_ULTFEC = '20131203' Where GRCFOR_MODFOR = 'SJ'

/* Borra Movimientos de Subdiarios */

Truncate Table DGBSBG
Truncate Table DGBSBI
Delete DGBSBH

/* Borra Movimientos de Contabilidad */

Truncate Table CGBMVG
Truncate Table CGBMVI
Truncate Table CGBMVH
Truncate Table CGRMVG
Truncate Table CGRMVD
Truncate Table CGRMVI
truncate table rvrmvi
Delete CGRMVH
Update GRCFOR Set GRCFOR_ULTNRO = 0, GRCFOR_ULTFEC = '20131203' Where GRCFOR_MODFOR = 'CG'

/* Borra Movimientos de Produccion */

Truncate Table PDRMVP
Truncate Table PDRMVI
Delete PDRMVH
Update GRCFOR Set GRCFOR_ULTNRO = 0, GRCFOR_ULTFEC = '20131203' Where GRCFOR_MODFOR = 'PD'

/* Borra Movimientos de transferencias*/
DELETE ITCWTMTRANSFER
DELETE CWTMTRANSFER

----------
