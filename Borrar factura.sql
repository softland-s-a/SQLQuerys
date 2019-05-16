/* Borra un movimiento especifico */
/*IMPORTANTE: Se debe regenerar la numeración en forma manual*/

Declare @ModFor VarChar(2), @CodFor VarChar(6), @NroForDesde Numeric(9), @NroForHasta Numeric(9)
Select @ModFor = 'CJ', @CodFor = 'FB0005', @NroForDesde = 22709, @NroForHasta = 22710

If @ModFor = 'VT' Begin
	Select VTRMVH_NROCAE,* From VTRMVH Where VTRMVH_MODFOR = @ModFor And VTRMVH_CODFOR = @CodFor And VTRMVH_NROFOR >= @NroForDesde
End

Update GRCFOR Set GRCFOR_ULTNRO = @NroForDesde -1 Where GRCFOR_MODFOR = @ModFor And GRCFOR_CODFOR = @CodFor

/* Generales */
--Delete GRAFEI Where GRAFEI_MODFOR = @ModFor And GRAFEI_CODFOR = @CodFor And GRAFEI_NROFOR Between @NroForDesde And @NroForHasta
--Delete GRAFEH Where GRAFEH_MODFOR = @ModFor And GRAFEH_CODFOR = @CodFor And GRAFEH_NROFOR Between @NroForDesde And @NroForHasta

/* Informes Gerenciales */
Delete IGRMVG Where IGRMVG_MODFOR = @ModFor And IGRMVG_CODFOR = @CodFor And IGRMVG_NROFOR Between @NroForDesde And @NroForHasta
Delete IGRMVI Where IGRMVI_MODFOR = @ModFor And IGRMVI_CODFOR = @CodFor And IGRMVI_NROFOR Between @NroForDesde And @NroForHasta

/*Contabilidad*/
If @ModFor = 'CG' Begin
	Update VTRMVH Set VTRMVH_MODASI = NULL, VTRMVH_CODASI = NULL, VTRMVH_NROASI = NULL Where VTRMVH_MODASI = @ModFor And VTRMVH_CODASI = @CodFor And VTRMVH_NROASI  Between @NroForDesde And @NroForHasta
	Update CJRMVH Set CJRMVH_MODASI = NULL, CJRMVH_CODASI = NULL, CJRMVH_NROASI = NULL Where CJRMVH_MODASI = @ModFor And CJRMVH_CODASI = @CodFor And CJRMVH_NROASI  Between @NroForDesde And @NroForHasta
	Update PVRMVH Set PVRMVH_MODASI = NULL, PVRMVH_CODASI = NULL, PVRMVH_NROASI = NULL Where PVRMVH_MODASI = @ModFor And PVRMVH_CODASI = @CodFor And PVRMVH_NROASI  Between @NroForDesde And @NroForHasta
	Delete CGRMVG Where CGRMVG_MODFOR = @ModFor And CGRMVG_CODFOR = @CodFor And CGRMVG_NROFOR Between @NroForDesde And @NroForHasta
	Delete CGRMVD Where CGRMVD_MODFOR = @ModFor And CGRMVD_CODFOR = @CodFor And CGRMVD_NROFOR Between @NroForDesde And @NroForHasta
	Delete CGRMVI Where CGRMVI_MODFOR = @ModFor And CGRMVI_CODFOR = @CodFor And CGRMVI_NROFOR Between @NroForDesde And @NroForHasta
	Delete CGRMVH Where CGRMVH_MODFOR = @ModFor And CGRMVH_CODFOR = @CodFor And CGRMVH_NROFOR Between @NroForDesde And @NroForHasta
End

/* Stock */
If @ModFor = 'ST' Begin
	Delete STRACG Where STRACG_MODFOR = @ModFor And STRACG_CODFOR = @CodFor And STRACG_NROFOR Between @NroForDesde And @NroForHasta
	Delete STRACD Where STRACD_MODFOR = @ModFor And STRACD_CODFOR = @CodFor And STRACD_NROFOR Between @NroForDesde And @NroForHasta
	Delete STRMVI Where STRMVI_MODFOR = @ModFor And STRMVI_CODFOR = @CodFor And STRMVI_NROFOR Between @NroForDesde And @NroForHasta
	Delete STRMVH Where STRMVH_MODFOR = @ModFor And STRMVH_CODFOR = @CodFor And STRMVH_NROFOR Between @NroForDesde And @NroForHasta
End

/* Produccion */
Delete PDRMVP Where PDRMVP_MODFOR = @ModFor And PDRMVP_CODFOR = @CodFor And PDRMVP_NROFOR Between @NroForDesde And @NroForHasta
Delete PDRMVI Where PDRMVI_MODFOR = @ModFor And PDRMVI_CODFOR = @CodFor And PDRMVI_NROFOR Between @NroForDesde And @NroForHasta
Delete PDRMVH Where PDRMVH_MODFOR = @ModFor And PDRMVH_CODFOR = @CodFor And PDRMVH_NROFOR Between @NroForDesde And @NroForHasta

/* Facturacion */
Delete FCRMVX Where FCRMVX_MODFOR = @ModFor And FCRMVX_CODFOR = @CodFor And FCRMVX_NROFOR Between @NroForDesde And @NroForHasta
Delete FCRMVA Where FCRMVA_MODFOR = @ModFor And FCRMVA_CODFOR = @CodFor And FCRMVA_NROFOR Between @NroForDesde And @NroForHasta
Delete FCRMVV Where FCRMVV_MODFOR = @ModFor And FCRMVV_CODFOR = @CodFor And FCRMVV_NROFOR Between @NroForDesde And @NroForHasta
Delete FCRMVP Where FCRMVP_MODFOR = @ModFor And FCRMVP_CODFOR = @CodFor And FCRMVP_NROFOR Between @NroForDesde And @NroForHasta
Delete FCRMVG Where FCRMVG_MODFOR = @ModFor And FCRMVG_CODFOR = @CodFor And FCRMVG_NROFOR Between @NroForDesde And @NroForHasta
Delete FCRMVD Where FCRMVD_MODFOR = @ModFor And FCRMVD_CODFOR = @CodFor And FCRMVD_NROFOR Between @NroForDesde And @NroForHasta
Delete FCRMVI Where FCRMVI_MODFOR = @ModFor And FCRMVI_CODFOR = @CodFor And FCRMVI_NROFOR Between @NroForDesde And @NroForHasta
Delete FCRMVH Where FCRMVH_MODFOR = @ModFor And FCRMVH_CODFOR = @CodFor And FCRMVH_NROFOR Between @NroForDesde And @NroForHasta

/* Clientes */
If @ModFor = 'VT' Begin
	Delete VTRMVG Where VTRMVG_MODFOR = @ModFor And VTRMVG_CODFOR = @CodFor And VTRMVG_NROFOR Between @NroForDesde And @NroForHasta
	Delete VTRMVD Where VTRMVD_MODFOR = @ModFor And VTRMVD_CODFOR = @CodFor And VTRMVD_NROFOR Between @NroForDesde And @NroForHasta
	Delete VTRMVP Where VTRMVP_MODFOR = @ModFor And VTRMVP_CODFOR = @CodFor And VTRMVP_NROFOR Between @NroForDesde And @NroForHasta
	Delete VTRMVI Where VTRMVI_MODFOR = @ModFor And VTRMVI_CODFOR = @CodFor And VTRMVI_NROFOR Between @NroForDesde And @NroForHasta
	Delete VTRMVC Where VTRMVC_MODFOR = @ModFor And VTRMVC_CODFOR = @CodFor And VTRMVC_NROFOR Between @NroForDesde And @NroForHasta
	Delete VTRMVN Where VTRMVN_MODFOR = @ModFor And VTRMVN_CODFOR = @CodFor And VTRMVN_NROFOR Between @NroForDesde And @NroForHasta
	Delete VTRMVH Where VTRMVH_MODFOR = @ModFor And VTRMVH_CODFOR = @CodFor And VTRMVH_NROFOR Between @NroForDesde And @NroForHasta
End

/* Tesorería */
If @ModFor = 'CJ' Begin
	Delete CJRMVG Where CJRMVG_MODFOR = @ModFor And CJRMVG_CODFOR = @CodFor And CJRMVG_NROFOR Between @NroForDesde And @NroForHasta
	Delete CJRMVD Where CJRMVD_MODFOR = @ModFor And CJRMVD_CODFOR = @CodFor And CJRMVD_NROFOR Between @NroForDesde And @NroForHasta
	Delete CJRMVI Where CJRMVI_MODFOR = @ModFor And CJRMVI_CODFOR = @CodFor And CJRMVI_NROFOR Between @NroForDesde And @NroForHasta
    Update CJRMVH Set CJRMVH_MODREV = NULL, CJRMVH_CODREV = NULL, CJRMVH_NROREV = NULL Where CJRMVH_MODREV = @ModFor And CJRMVH_CODREV = @CodFor And CJRMVH_NROREV  Between @NroForDesde And @NroForHasta
	Delete CJRMVH Where CJRMVH_MODFOR = @ModFor And CJRMVH_CODFOR = @CodFor And CJRMVH_NROFOR Between @NroForDesde And @NroForHasta
End
 
 /* Proveedores */
If @ModFor = 'PV' Begin
	Delete PVRMVP Where PVRMVP_MODFOR = @ModFor And PVRMVP_CODFOR = @CodFor And PVRMVP_NROFOR Between @NroForDesde And @NroForHasta
	Delete PVRMVG Where PVRMVG_MODFOR = @ModFor And PVRMVG_CODFOR = @CodFor And PVRMVG_NROFOR Between @NroForDesde And @NroForHasta
	Delete PVRMVD Where PVRMVD_MODFOR = @ModFor And PVRMVD_CODFOR = @CodFor And PVRMVD_NROFOR Between @NroForDesde And @NroForHasta
	Delete PVRMVT Where PVRMVT_MODFOR = @ModFor And PVRMVT_CODFOR = @CodFor And PVRMVT_NROFOR Between @NroForDesde And @NroForHasta
	Delete PVRMVI Where PVRMVI_MODFOR = @ModFor And PVRMVI_CODFOR = @CodFor And PVRMVI_NROFOR Between @NroForDesde And @NroForHasta
	Delete PVRMVC Where PVRMVC_MODFOR = @ModFor And PVRMVC_CODFOR = @CodFor And PVRMVC_NROFOR Between @NroForDesde And @NroForHasta
	Delete PVRMVR Where PVRMVR_MODFOR = @ModFor And PVRMVR_CODFOR = @CodFor And PVRMVR_NROFOR Between @NroForDesde And @NroForHasta
	Delete PVRMVN Where PVRMVN_MODFOR = @ModFor And PVRMVN_CODFOR = @CodFor And PVRMVN_NROFOR Between @NroForDesde And @NroForHasta
	Update PVRMVH Set PVRMVH_MODREV = NULL, PVRMVH_CODREV = NULL, PVRMVH_NROREV = NULL Where PVRMVH_MODREV = @ModFor And PVRMVH_CODREV = @CodFor And PVRMVH_NROREV  Between @NroForDesde And @NroForHasta
	Delete PVRMVH Where PVRMVH_MODFOR = @ModFor And PVRMVH_CODFOR = @CodFor And PVRMVH_NROFOR Between @NroForDesde And @NroForHasta
End

/* Compras */
Delete CORMVA Where CORMVA_MODFOR = @ModFor And CORMVA_CODFOR = @CodFor And CORMVA_NROFOR Between @NroForDesde And @NroForHasta
Delete CORMVV Where CORMVV_MODFOR = @ModFor And CORMVV_CODFOR = @CodFor And CORMVV_NROFOR Between @NroForDesde And @NroForHasta
Delete CORMVG Where CORMVG_MODFOR = @ModFor And CORMVG_CODFOR = @CodFor And CORMVG_NROFOR Between @NroForDesde And @NroForHasta
Delete CORMVD Where CORMVD_MODFOR = @ModFor And CORMVD_CODFOR = @CodFor And CORMVD_NROFOR Between @NroForDesde And @NroForHasta
Delete CORMVP Where CORMVP_MODFOR = @ModFor And CORMVP_CODFOR = @CodFor And CORMVP_NROFOR Between @NroForDesde And @NroForHasta
Delete CORMVI Where CORMVI_MODFOR = @ModFor And CORMVI_CODFOR = @CodFor And CORMVI_NROFOR Between @NroForDesde And @NroForHasta
Delete CORMVH Where CORMVH_MODFOR = @ModFor And CORMVH_CODFOR = @CodFor And CORMVH_NROFOR Between @NroForDesde And @NroForHasta

/* Agro */
Delete AGRMVL Where AGRMVL_MODFOR = @ModFor And AGRMVL_CODFOR = @CodFor And AGRMVL_NROFOR Between @NroForDesde And @NroForHasta
Delete AGRMVI Where AGRMVI_MODFOR = @ModFor And AGRMVI_CODFOR = @CodFor And AGRMVI_NROFOR Between @NroForDesde And @NroForHasta
Delete AGRMVD Where AGRMVD_MODFOR = @ModFor And AGRMVD_CODFOR = @CodFor And AGRMVD_NROFOR Between @NroForDesde And @NroForHasta
Delete AGRMVP Where AGRMVP_MODFOR = @ModFor And AGRMVP_CODFOR = @CodFor And AGRMVP_NROFOR Between @NroForDesde And @NroForHasta
Delete AGRMVH Where AGRMVH_MODFOR = @ModFor And AGRMVH_CODFOR = @CodFor And AGRMVH_NROFOR Between @NroForDesde And @NroForHasta

If @ModFor = 'RP' Begin
	Delete RPRMVI Where RPRMVI_MODFOR = @ModFor And RPRMVI_CODFOR = @CodFor And RPRMVI_NROFOR Between @NroForDesde And @NroForHasta
	Delete RPRMVH Where RPRMVH_MODFOR = @ModFor And RPRMVH_CODFOR = @CodFor And RPRMVH_NROFOR Between @NroForDesde And @NroForHasta
End

