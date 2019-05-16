
--- Resolución:
--- 0: 640 x 480
--- 1: 800 x 600
--- 2: 1024 x 768

---- Facturas de Compras PV
EXEC CopiarResolucionYFormato 'USRFC_0400-0400S12',2,'USR_FCR_04000400S09'
EXEC CopiarResolucionYFormato 'USR_FC_05000500_S12',2,'USR_FCR_05000500S9'
EXEC CopiarResolucionYFormato 'USR_FC_07000700_S12',2,'USR_FCR_07000700_S9'


EXEC CopiarResolucionYFormato 'USR_FCRM_04000350',2,'USR_FCR_04000320'

EXEC CopiarResolucionYFormato 'USR_COR_04500450',2,'USR_COR_04510451'
EXEC CopiarResolucionYFormato 'USR_COR_04500450',2,'USR_COR_04600460'
EXEC CopiarResolucionYFormato 'USR_COR_04500450',2,'USR_COR_04610461'
EXEC CopiarResolucionYFormato 'USR_COR_04500450',2,'USR_COR_27002700'
	---- Notas de Crédito
EXEC CopiarResolucionYFormato 'USR_COR_04500450',2,'USR_COR_07500750'
EXEC CopiarResolucionYFormato 'USR_COR_04500450',2,'USR_COR_07510751'
EXEC CopiarResolucionYFormato 'USR_COR_04500450',2,'USR_COR_07600760'
EXEC CopiarResolucionYFormato 'USR_COR_04500450',2,'USR_COR_07610761'
---- Facturas de PV3
EXEC CopiarResolucionYFormato 'USR_PV3_SIA',2,'USR_LT'
EXEC CopiarResolucionYFormato 'USR_PV3_SIA',2,'USR_GB'
EXEC CopiarResolucionYFormato 'USR_PV3_SIA',2,'USRGDV'
---- Comprobantes de Tesoreria
EXEC CopiarResolucionYFormato 'USRBD',2,'USRCJRMVH_BD1'

/*

CREATE PROCEDURE CopiarResolucionYFormato
	@ObjetoOrigen varchar(100),
	@ResolucionOrigen int,
	@ObjetoDestino varchar(100)
as
---===================================================================================
BEGIN TRANSACTION 

	DECLARE @Destino1 int, @Destino2 int

	IF @ResolucionOrigen = 0
		BEGIN
		SET @Destino1 = 1
		SET @Destino2 = 2
	END
	IF @ResolucionOrigen = 1 
		BEGIN
		SET @Destino1 = 0
		SET @Destino2 = 2
	END
	IF @ResolucionOrigen = 2
		BEGIN
		SET @Destino1 = 0
		SET @Destino2 = 1
	END

--Borra los datos para destino 1 y 2

	delete from cwtmscreenobjects where (resolution=@destino1 or resolution=@destino2) and 
	objectname = @ObjetoOrigen

--Inserta los datos para Destino1
	insert into cwtmscreenobjects (OBJECTNAME, TABLENAME, OPERATION, FIELDNAME,
	TABINDEX, LEFTCOORD, TOPCOORD, WIDTH, HEIGHT,
	CONTAINER, CAPTION_ARG, CAPTION_BRA, CAPTION_USA, CAPTION_DEU, CAPTION_FRA,
	BACKCOLOR,  FORECOLOR, FROZEN, ISFRAME,
	RELATIVEPOSITIONS, OWNER, SHOWDESCRIPTION , Resolution)

	select OBJECTNAME, TABLENAME, OPERATION, FIELDNAME, TABINDEX, LEFTCOORD,
	TOPCOORD, WIDTH, HEIGHT, CONTAINER, CAPTION_ARG,
	CAPTION_BRA, CAPTION_USA, CAPTION_DEU, CAPTION_FRA, BACKCOLOR, FORECOLOR,
	FROZEN, ISFRAME, RELATIVEPOSITIONS, OWNER,
	SHOWDESCRIPTION, @destino1 from cwtmscreenobjects where objectName =
	@ObjetoOrigen AND Resolution = @ResolucionOrigen


--Inserta datos para Destino2
	insert into cwtmscreenobjects (OBJECTNAME, TABLENAME, OPERATION, FIELDNAME,
	TABINDEX, LEFTCOORD, TOPCOORD, WIDTH, HEIGHT,
	CONTAINER, CAPTION_ARG, CAPTION_BRA, CAPTION_USA, CAPTION_DEU, CAPTION_FRA,
	BACKCOLOR,  FORECOLOR, FROZEN, ISFRAME,
	RELATIVEPOSITIONS, OWNER, SHOWDESCRIPTION , Resolution)

	select OBJECTNAME, TABLENAME, OPERATION, FIELDNAME, TABINDEX, LEFTCOORD,
	TOPCOORD, WIDTH, HEIGHT, CONTAINER, CAPTION_ARG,
	CAPTION_BRA, CAPTION_USA, CAPTION_DEU, CAPTION_FRA, BACKCOLOR, FORECOLOR,
	FROZEN, ISFRAME, RELATIVEPOSITIONS, OWNER,
	SHOWDESCRIPTION, @destino2 from cwtmscreenobjects where objectName =
	@ObjetoOrigen AND Resolution = @ResolucionOrigen

---
---===================================================================================

------------------------------------------------------------ 
--- CwTmScreenObjects 
------------------------------------------------------------ 
--select * from cwtmscreenobjects where OBJECTNAME= @@Origen 

	DELETE from cwtmscreenobjects where OBJECTNAME=@ObjetoDestino 

	INSERT INTO cwtmscreenobjects 

	(OBJECTNAME , TABLENAME , RESOLUTION , OPERATION , FIELDNAME , 
	TABINDEX , LEFTCOORD , TOPCOORD , WIDTH , HEIGHT , CONTAINER , 
	CAPTION_ARG , CAPTION_BRA , CAPTION_USA , CAPTION_DEU , CAPTION_FRA , 
	BACKCOLOR , FORECOLOR , FROZEN , ISFRAME , RELATIVEPOSITIONS , OWNER , SHOWDESCRIPTION , 
	cwTMSc_FECALT , cwTMSc_FECMOD , cwTMSc_USERID , cwTMSc_ULTOPR , cwTMSc_DEBAJA , cwTMSc_HORMOV , 
	cwTMSc_MODULE , cwTMSc_OALIAS ) 

	(SELECT 
	@ObjetoDestino , TABLENAME , RESOLUTION , OPERATION , FIELDNAME , 
	TABINDEX , LEFTCOORD , TOPCOORD , WIDTH , HEIGHT , CONTAINER , 
	CAPTION_ARG , CAPTION_BRA , CAPTION_USA , CAPTION_DEU , CAPTION_FRA , 
	BACKCOLOR , FORECOLOR , FROZEN , ISFRAME , RELATIVEPOSITIONS , OWNER , SHOWDESCRIPTION , 
	GETDATE() , GETDATE() , 'CWA' , 'A' , 'N' , cwTMSc_HORMOV , 
	cwTMSc_MODULE , cwTMSc_OALIAS 

	FROM cwtmscreenobjects 
	WHERE OBJECTNAME= @ObjetoOrigen ) 

------------------------------------------------------------ 
--- CWTMSCREENS 
------------------------------------------------------------ 
--SELECT * FROM CWTMSCREENS WHERE OBJECTNAME = @@DESTINO 

	DELETE from CWTMSCREENS where OBJECTNAME=@ObjetoDestino 

	INSERT INTO CWTMSCREENS 

	(OBJECTNAME , TABLENAME , RESOLUTION , OPERATION , STATE , 
	cwTMSc_FECALT , cwTMSc_FECMOD , cwTMSc_USERID , cwTMSc_ULTOPR , 
	cwTMSc_DEBAJA , cwTMSc_HORMOV , cwTMSc_MODULE , cwTMSc_OALIAS ) 

	(SELECT 
	@ObjetoDestino , TABLENAME , RESOLUTION , OPERATION , STATE , 
	GETDATE() , GETDATE() , 'CWA' , 'A' , 
	'N' , cwTMSc_HORMOV , cwTMSc_MODULE , cwTMSc_OALIAS 

	FROM CWTMSCREENS 
	WHERE OBJECTNAME=@ObjetoOrigen  ) 

------------------------------------------------------------ 
--- CWTMITEMORDER 
------------------------------------------------------------ 
--SELECT * FROM CWTMITEMORDER WHERE OBJECTNAME = @@ORIGEN 

	DELETE from CWTMITEMORDER where OBJECTNAME=@ObjetoDestino 

	INSERT INTO CWTMITEMORDER 
	(ObjectName , ObjectClass , TableName , OrderNumber , 
	cwTMIt_FECALT , cwTMIt_FECMOD , cwTMIt_USERID , cwTMIt_ULTOPR , cwTMIt_DEBAJA , 
	cwTMIt_HORMOV , cwTMIt_MODULE , cwTMIt_OALIAS ) 

	(SELECT 
	@ObjetoDestino , ObjectClass , TableName , OrderNumber , 
	GETDATE() , GETDATE() , 'CWA' , 'A' , 'N' , 
	cwTMIt_HORMOV , cwTMIt_MODULE , cwTMIt_OALIAS 

	FROM CWTMITEMORDER 
	WHERE OBJECTNAME= @ObjetoOrigen ) 

COMMIT TRANSACTION 
*/
