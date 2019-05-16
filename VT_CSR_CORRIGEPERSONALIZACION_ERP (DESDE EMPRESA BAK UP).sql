
DECLARE @NOMBRE  VARCHAR (100) ,  @EMPRESAORIGEN   VARCHAR (100) , @EMPRESADESTINO   VARCHAR (100) 

-------COMPLETAR LA EMPRESA DE ORIGENM Y DESTINO ---------------------------------------------

SET @EMPRESAORIGEN =  'PRUEBA'
SET @EMPRESADESTINO = 'VILLAM'

------------------------------------------------------------------------------------------------
DECLARE CURSORELECERP CURSOR FOR 

SELECT  NAME   FROM CWOMOBJECTS WHERE NAME LIKE 'USR%' AND MODULENAME = 'FC'

OPEN CURSORELECERP

Fetch Next From CURSORELECERP INTO @NOMBRE
While @@FETCH_STATUS = 0
Begin 

EXEC CopiarResolucionYFormato2    @NOMBRE  , '2',  @NOMBRE , @EMPRESAORIGEN, @EMPRESADESTINO
              
Fetch Next From CURSORELECERP Into @NOMBRE
END 
Close CURSORELECERP
Deallocate CURSORELECERP

--==============================================================================================================
--==============================================================================================================

/*
CREATE PROCEDURE CopiarResolucionYFormato2

	@ObjetoOrigen     VARCHAR (100),
	@ResolucionOrigen VARCHAR (100),
	@ObjetoDestino    VARCHAR (100),
	@EMPRESAORIGEN    VARCHAR (100),
	@EMPRESADESTINO   VARCHAR (100)

AS
--==============================================================================================================

DECLARE     @Destino1 VARCHAR (10), @Destino2 VARCHAR (10)  , @VAR1 VARCHAR (1000), @VAR2 VARCHAR (1000),
	        @VAR3     VARCHAR (1000), @VAR4   VARCHAR (1000), @VAR5 VARCHAR (1000), @VAR6 VARCHAR (1000)
	
      IF @ResolucionOrigen = '0'
            BEGIN
            SET @Destino1 = '1'
            SET @Destino2 = '2'
      END
      IF @ResolucionOrigen = '1' 
            BEGIN
            SET @Destino1 = '0'
            SET @Destino2 = '2'
      END
      IF @ResolucionOrigen = '2'
            BEGIN
            SET @Destino1 = '0'
            SET @Destino2 = '1'
      END

--=============================================================================================================

-------Borra los datos para destino 1 y 2----------------------------------------------------------------------

SET @VAR1 ='DELETE FROM  '+ @EMPRESAORIGEN +'.dbo.cwtmscreenobjects where (resolution= ''' + @Destino1 + 
           ''' or   resolution= ''' + @destino2 + ''' ) and objectname = '''+ @ObjetoOrigen+''''

EXEC (@VAR1)
 
-------Inserta los datos para Destino1------------------------------------------------------------------------

SET @VAR2 = 'INSERT INTO  '+@EMPRESAORIGEN +'.dbo.cwtmscreenobjects (OBJECTNAME, TABLENAME, OPERATION, '
SET @VAR2 = @VAR2 +' FIELDNAME,TABINDEX , LEFTCOORD, TOPCOORD, WIDTH, HEIGHT,CONTAINER, CAPTION_ARG,CAPTION_BRA,'
SET @VAR2 = @VAR2 +'CAPTION_USA, CAPTION_DEU, CAPTION_FRA,BACKCOLOR, FORECOLOR, FROZEN, ISFRAME,RELATIVEPOSITIONS,'
SET @VAR2 = @VAR2 +' OWNER, SHOWDESCRIPTION,Resolution) '

SET @VAR2 = @VAR2 +' (SELECT OBJECTNAME, TABLENAME, OPERATION, FIELDNAME, TABINDEX, LEFTCOORD,TOPCOORD, '
SET @VAR2 = @VAR2 + ' WIDTH, HEIGHT,CONTAINER, CAPTION_ARG,CAPTION_BRA, CAPTION_USA, CAPTION_DEU, CAPTION_FRA, '
SET @VAR2 = @VAR2 + ' BACKCOLOR, FORECOLOR,FROZEN, ISFRAME, RELATIVEPOSITIONS,'
SET @VAR2 = @VAR2 + 'OWNER,SHOWDESCRIPTION, '''+ @destino1+'''' 
SET @VAR2 = @VAR2 + ' from ' +@EMPRESAORIGEN+'.dbo.cwtmscreenobjects '
SET @VAR2 = @VAR2 + ' where objectName =  '''+ @ObjetoOrigen + ''' AND Resolution = ''' +@ResolucionOrigen + ''')'

EXEC (@VAR2) 

--------Inserta datos para Destino2------------------------------------------------------------------------------

SET @VAR3 = ' INSERT INTO '+ @EMPRESAORIGEN + '.dbo.cwtmscreenobjects (OBJECTNAME, TABLENAME, OPERATION, FIELDNAME,'
SET @VAR3 = @VAR3 +'TABINDEX, LEFTCOORD, TOPCOORD, WIDTH, HEIGHT, CONTAINER, CAPTION_ARG, CAPTION_BRA, CAPTION_USA,' 
SET @VAR3 = @VAR3 +'CAPTION_DEU,CAPTION_FRA,BACKCOLOR, FORECOLOR, FROZEN, ISFRAME, RELATIVEPOSITIONS, OWNER, '
SET @VAR3 = @VAR3 +'SHOWDESCRIPTION , Resolution)  '

SET @VAR3 = @VAR3 +' (SELECT  OBJECTNAME, TABLENAME, OPERATION, FIELDNAME, TABINDEX, LEFTCOORD,TOPCOORD, WIDTH,'
SET @VAR3 = @VAR3 +'  HEIGHT, CONTAINER, CAPTION_ARG,CAPTION_BRA, CAPTION_USA, CAPTION_DEU, CAPTION_FRA, BACKCOLOR,'
SET @VAR3 = @VAR3 +' FORECOLOR, FROZEN, ISFRAME, RELATIVEPOSITIONS, OWNER, SHOWDESCRIPTION, '''+ @destino2+'''' 
SET @VAR3 = @VAR3 +' from ' +@EMPRESAORIGEN +'.dbo.cwtmscreenobjects '
SET @VAR3 = @VAR3 +' where objectName = '''+ @ObjetoOrigen + ''' AND Resolution = ''' + @ResolucionOrigen + ''')'

EXEC (@VAR3)

-------------------------------------------------------------- ---------------------------------------------------
----- CwTmScreenObjects ------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
 

SET @VAR4 ='DELETE from  ' + @EMPRESADESTINO +'.dbo.cwtmscreenobjects where OBJECTNAME = '''+ @ObjetoDestino+'''' 

SET @VAR4 = @VAR4 +' INSERT INTO cwtmscreenobjects  (OBJECTNAME , TABLENAME , RESOLUTION , OPERATION , FIELDNAME ,' 
SET @VAR4 = @VAR4 +' TABINDEX , LEFTCOORD , TOPCOORD , WIDTH , HEIGHT , CONTAINER , CAPTION_ARG , CAPTION_BRA ,' 
SET @VAR4 = @VAR4 +' CAPTION_USA , CAPTION_DEU , CAPTION_FRA , BACKCOLOR , FORECOLOR , FROZEN , ISFRAME ,'
SET @VAR4 = @VAR4 +' RELATIVEPOSITIONS , OWNER , SHOWDESCRIPTION , cwTMSc_FECALT , cwTMSc_FECMOD , cwTMSc_USERID ,'
SET @VAR4 = @VAR4 +' cwTMSc_ULTOPR , cwTMSc_DEBAJA , cwTMSc_HORMOV , cwTMSc_MODULE , cwTMSc_OALIAS ) '

SET @VAR4 = @VAR4 +'(SELECT  '''+ @ObjetoDestino +''' , TABLENAME , RESOLUTION , OPERATION , FIELDNAME ,'
SET @VAR4 = @VAR4 +' TABINDEX , LEFTCOORD , TOPCOORD , WIDTH , HEIGHT , CONTAINER , CAPTION_ARG , CAPTION_BRA ,'
SET @VAR4 = @VAR4 +' CAPTION_USA , CAPTION_DEU , CAPTION_FRA , BACKCOLOR , FORECOLOR , FROZEN , ISFRAME ,'
SET @VAR4 = @VAR4 +' RELATIVEPOSITIONS , OWNER , SHOWDESCRIPTION , GETDATE() , GETDATE() , '
SET @VAR4 = @VAR4 + '''CWA'''+ ','+ '''A'''+','+ '''N'''+','
SET @VAR4 = @VAR4 + ' cwTMSc_HORMOV ,  cwTMSc_MODULE , cwTMSc_OALIAS '
SET @VAR4 = @VAR4 +  ' FROM  '+ @EMPRESAORIGEN + '.dbo.cwtmscreenobjects WHERE '
SET @VAR4 = @VAR4 + ' OBJECTNAME = '''+ @ObjetoOrigen+ ''''+ ')'

EXEC ( @VAR4) 

------------------------------------------------------------------------------------------------------------------
----- CWTMSCREENS  -----------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------ 

SET @VAR5 =' DELETE from CWTMSCREENS where OBJECTNAME= '''+ @ObjetoDestino+'''' 

SET @VAR5 = @VAR5 +' INSERT INTO CWTMSCREENS (OBJECTNAME , TABLENAME , RESOLUTION , OPERATION , STATE , ' 
SET @VAR5 = @VAR5 +' cwTMSc_FECALT , cwTMSc_FECMOD , cwTMSc_USERID , cwTMSc_ULTOPR , cwTMSc_DEBAJA , ' 
SET @VAR5 = @VAR5 +' cwTMSc_HORMOV , cwTMSc_MODULE , cwTMSc_OALIAS )  '

SET @VAR5 = @VAR5 + ' (SELECT  ''' + @ObjetoDestino + ''' , TABLENAME , RESOLUTION , OPERATION , STATE ,'
SET @VAR5 = @VAR5 + '  GETDATE() , GETDATE() , '
SET @VAR5 = @VAR5 + '''CWA'''+ ','+ '''A'''+','+ '''N'''+','
SET @VAR5 = @VAR5 + 'cwTMSc_HORMOV , cwTMSc_MODULE , cwTMSc_OALIAS ' 
SET @VAR5 = @VAR5 + '  FROM  '+ @EMPRESAORIGEN + '.dbo.CWTMSCREENS WHERE OBJECTNAME= '''+ @ObjetoOrigen + ''')' 

EXEC (@VAR5)

------------------------------------------------------------------------------------------------------------------ 
----- CWTMITEMORDER   --------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------ 

SET @VAR6 =' DELETE from CWTMITEMORDER where OBJECTNAME= '''+ @ObjetoDestino+''''
 
SET @VAR6 = @VAR6 + ' INSERT INTO CWTMITEMORDER  (ObjectName , ObjectClass , TableName , OrderNumber , '
SET @VAR6 = @VAR6 + ' cwTMIt_FECALT , cwTMIt_FECMOD , cwTMIt_USERID , cwTMIt_ULTOPR , cwTMIt_DEBAJA , '
SET @VAR6 = @VAR6 + ' cwTMIt_HORMOV , cwTMIt_MODULE , cwTMIt_OALIAS ) '

SET @VAR6 = @VAR6 + ' (SELECT '''+ @ObjetoDestino+ ''' ,ObjectClass,TableName,OrderNumber, GETDATE() ,GETDATE(),'
SET @VAR6 = @VAR6 + '''CWA'''+ ','+ '''A'''+','+ '''N'''+','
SET @VAR6 = @VAR6 + 'cwTMIt_HORMOV , cwTMIt_MODULE , cwTMIt_OALIAS'
SET @VAR6 = @VAR6 + '  FROM  '+ @EMPRESAORIGEN +'.dbo. CWTMITEMORDER WHERE OBJECTNAME= ''' + @ObjetoOrigen+ ''')' 

EXEC (@VAR6)   

 */