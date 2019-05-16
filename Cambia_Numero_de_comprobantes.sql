/*IMPORTANTE: Se debe regenerar la numeración en forma manual*/

Declare @ModFor VarChar(2), @CodFor VarChar(6), @NroFor Numeric(9), @NewNro Numeric(9)
Select @ModFor = 'VT'
Select @CodFor = 'KE'
Select @NroFor = 750
Select @NewNro = 754

--Select * From FCRMVH Where FCRMVH_MODFOR = @ModFor And FCRMVH_CODFOR = @CodFor And FCRMVH_NROFOR = @NroFor
--Select * From FCRMVI Where FCRMVI_MODFOR = @ModFor And FCRMVI_CODFOR = @CodFor And FCRMVI_NROFOR = @NroFor
--Select * From FCRMVI Where FCRMVI_MODAPL = @ModFor And FCRMVI_CODAPL = @CodFor And FCRMVI_NROAPL = @NroFor
--Select * From FCRMVD Where FCRMVD_MODFOR = @ModFor And FCRMVD_CODFOR = @CodFor And FCRMVD_NROFOR = @NroFor

/* Clientes */
Update VTRMVH Set VTRMVH_NROFOR = @NewNro Where VTRMVH_MODFOR = @ModFor And VTRMVH_CODFOR = @CodFor And VTRMVH_NROFOR = @NroFor
Update VTRMVN Set VTRMVN_NROFOR = @NewNro Where VTRMVN_MODFOR = @ModFor And VTRMVN_CODFOR = @CodFor And VTRMVN_NROFOR = @NroFor
Update VTRMVC Set VTRMVC_NROFOR = @NewNro Where VTRMVC_MODFOR = @ModFor And VTRMVC_CODFOR = @CodFor And VTRMVC_NROFOR = @NroFor
Update VTRMVC Set VTRMVC_NROAPL = @NewNro Where VTRMVC_MODAPL = @ModFor And VTRMVC_CODAPL = @CodFor And VTRMVC_NROAPL = @NroFor
Update VTRMVI Set VTRMVI_NROFOR = @NewNro Where VTRMVI_MODFOR = @ModFor And VTRMVI_CODFOR = @CodFor And VTRMVI_NROFOR = @NroFor
Update VTRMVD Set VTRMVD_NROFOR = @NewNro Where VTRMVD_MODFOR = @ModFor And VTRMVD_CODFOR = @CodFor And VTRMVD_NROFOR = @NroFor
Update VTRMVG Set VTRMVG_NROFOR = @NewNro Where VTRMVG_MODFOR = @ModFor And VTRMVG_CODFOR = @CodFor And VTRMVG_NROFOR = @NroFor
Update VTRMVP Set VTRMVP_NROFOR = @NewNro Where VTRMVP_MODFOR = @ModFor And VTRMVP_CODFOR = @CodFor And VTRMVP_NROFOR = @NroFor

/* Contratos */
Update CVRMHI Set CVRMHI_NROAPL = @NewNro Where CVRMHI_MODAPL = @ModFor And CVRMHI_CODAPL = @CodFor And CVRMHI_NROAPL = @NroFor

/* Facturacion */
Update FCRMVH Set FCRMVH_NROFOR = @NewNro Where FCRMVH_MODFOR = @ModFor And FCRMVH_CODFOR = @CodFor And FCRMVH_NROFOR = @NroFor
Update FCRMVI Set FCRMVI_NROFOR = @NewNro Where FCRMVI_MODFOR = @ModFor And FCRMVI_CODFOR = @CodFor And FCRMVI_NROFOR = @NroFor
Update FCRMVI Set FCRMVI_NROAPL = @NewNro Where FCRMVI_MODAPL = @ModFor And FCRMVI_CODAPL = @CodFor And FCRMVI_NROAPL = @NroFor
Update FCRMVD Set FCRMVD_NROFOR = @NewNro, FCRMVD_NROAPL = @NewNro Where FCRMVD_MODFOR = @ModFor And FCRMVD_CODFOR = @CodFor And FCRMVD_NROFOR = @NroFor And FCRMVD_NROAPL = @NroFor
Update FCRMVG Set FCRMVG_NROFOR = @NewNro, FCRMVG_NROAPL = @NewNro Where FCRMVG_MODFOR = @ModFor And FCRMVG_CODFOR = @CodFor And FCRMVG_NROFOR = @NroFor And FCRMVG_NROAPL = @NroFor
Update FCRMVP Set FCRMVP_NROFOR = @NewNro Where FCRMVP_MODFOR = @ModFor And FCRMVP_CODFOR = @CodFor And FCRMVP_NROFOR = @NroFor

/*
/* Generales */
UpdateGRAFEH Where GRAFEH_MODFOR = @ModFor And GRAFEH_CODFOR = @CodFor And GRAFEH_NROFOR = @NroFor

/*Contabilidad*/
UpdateCGRMVG Where CGRMVG_MODFOR = @ModFor And CGRMVG_CODFOR = @CodFor And CGRMVG_NROFOR = @NroFor
UpdateCGRMVD Where CGRMVD_MODFOR = @ModFor And CGRMVD_CODFOR = @CodFor And CGRMVD_NROFOR = @NroFor
UpdateCGRMVI Where CGRMVI_MODFOR = @ModFor And CGRMVI_CODFOR = @CodFor And CGRMVI_NROFOR = @NroFor
UpdateCGRMVH Where CGRMVH_MODFOR = @ModFor And CGRMVH_CODFOR = @CodFor And CGRMVH_NROFOR = @NroFor

/* Informes Gerenciales */
UpdateIGRMVG Where IGRMVG_MODFOR = @ModFor And IGRMVG_CODFOR = @CodFor And IGRMVG_NROFOR = @NroFor
UpdateIGRMVI Where IGRMVI_MODFOR = @ModFor And IGRMVI_CODFOR = @CodFor And IGRMVI_NROFOR = @NroFor

/* Stock */
UpdateSTRMVI Where STRMVI_MODFOR = @ModFor And STRMVI_CODFOR = @CodFor And STRMVI_NROFOR = @NroFor
UpdateSTRMVH Where STRMVH_MODFOR = @ModFor And STRMVH_CODFOR = @CodFor And STRMVH_NROFOR = @NroFor

/* Produccion */
UpdatePDRMVP Where PDRMVP_MODFOR = @ModFor And PDRMVP_CODFOR = @CodFor And PDRMVP_NROFOR = @NroFor
UpdatePDRMVI Where PDRMVI_MODFOR = @ModFor And PDRMVI_CODFOR = @CodFor And PDRMVI_NROFOR = @NroFor
UpdatePDRMVH Where PDRMVH_MODFOR = @ModFor And PDRMVH_CODFOR = @CodFor And PDRMVH_NROFOR = @NroFor

/* Tesorería */
UpdateCJRMVG Where CJRMVG_MODFOR = @ModFor And CJRMVG_CODFOR = @CodFor And CJRMVG_NROFOR = @NroFor
UpdateCJRMVD Where CJRMVD_MODFOR = @ModFor And CJRMVD_CODFOR = @CodFor And CJRMVD_NROFOR = @NroFor
UpdateCJRMVI Where CJRMVI_MODFOR = @ModFor And CJRMVI_CODFOR = @CodFor And CJRMVI_NROFOR = @NroFor
UpdateCJRMVH Where CJRMVH_MODFOR = @ModFor And CJRMVH_CODFOR = @CodFor And CJRMVH_NROFOR = @NroFor

/* Proveedores */
UpdatePVRMVG Where PVRMVG_MODFOR = @ModFor And PVRMVG_CODFOR = @CodFor And PVRMVG_NROFOR = @NroFor
UpdatePVRMVD Where PVRMVD_MODFOR = @ModFor And PVRMVD_CODFOR = @CodFor And PVRMVD_NROFOR = @NroFor
UpdatePVRMVT Where PVRMVT_MODFOR = @ModFor And PVRMVT_CODFOR = @CodFor And PVRMVT_NROFOR = @NroFor
UpdatePVRMVI Where PVRMVI_MODFOR = @ModFor And PVRMVI_CODFOR = @CodFor And PVRMVI_NROFOR = @NroFor
UpdatePVRMVC Where PVRMVC_MODFOR = @ModFor And PVRMVC_CODFOR = @CodFor And PVRMVC_NROFOR = @NroFor
UpdatePVRMVR Where PVRMVR_MODFOR = @ModFor And PVRMVR_CODFOR = @CodFor And PVRMVR_NROFOR = @NroFor
UpdatePVRMVN Where PVRMVN_MODFOR = @ModFor And PVRMVN_CODFOR = @CodFor And PVRMVN_NROFOR = @NroFor
UpdatePVRMVH Where PVRMVH_MODFOR = @ModFor And PVRMVH_CODFOR = @CodFor And PVRMVH_NROFOR = @NroFor

/* Compras */
UpdateCORMVG Where CORMVG_MODFOR = @ModFor And CORMVG_CODFOR = @CodFor And CORMVG_NROFOR = @NroFor
UpdateCORMVD Where CORMVD_MODFOR = @ModFor And CORMVD_CODFOR = @CodFor And CORMVD_NROFOR = @NroFor
UpdateCORMVP Where CORMVP_MODFOR = @ModFor And CORMVP_CODFOR = @CodFor And CORMVP_NROFOR = @NroFor
UpdateCORMVI Where CORMVI_MODFOR = @ModFor And CORMVI_CODFOR = @CodFor And CORMVI_NROFOR = @NroFor
UpdateCORMVH Where CORMVH_MODFOR = @ModFor And CORMVH_CODFOR = @CodFor And CORMVH_NROFOR = @NroFor

*/