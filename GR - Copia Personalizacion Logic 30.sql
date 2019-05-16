


--EJEMPLOS 

EXEC COPIARPERSONALIZACION30 'USRCJRMVH_OT', 'USRPRUEBAPERSON'
EXEC COPIARPERSONALIZACION30 'USR_FCR_01000100', 'USRPRUEBAPERSON', 'USUARIO'
EXEC COPIARPERSONALIZACION30 'USR_FCR_01000100', 'USRPRUEBAPERSON', 'USUARIO' , 'EMPRESAORIGEN', 'EMPRESADESTINO'

--CURSOR


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

EXEC COPIARPERSONALIZACION30    @NOMBRE  , @NOMBRE , 'ADMIN' , @EMPRESAORIGEN, @EMPRESADESTINO
              
Fetch Next From CURSORELECERP Into @NOMBRE
END 
Close CURSORELECERP
Deallocate CURSORELECERP


/*
CREATE PROCEDURE COPIARPERSONALIZACION30

@OBJETOORIGEN VARCHAR(120), 
@OBJETODESTINO VARCHAR(120), 
@USRID VARCHAR(60)= 'ADMIN', 
@EMPRESAORIGEN VARCHAR(120) = 'PORDEFECTO', 
@EMPRESADESTINO VARCHAR(120) = 'PORDEFECTO'

AS

----------------------------------------------------------------------------------------------------------------
DECLARE @Destino1 VARCHAR (10), @Destino2 VARCHAR (10)  , @VAR VARCHAR(MAX), @ResolucionOrigen varchar(1)
----------------------------------------------------------------------------------------------------------------
IF @EMPRESAORIGEN  = 'PORDEFECTO' BEGIN  SET @EMPRESAORIGEN  = (SELECT DB_NAME())  END
IF @EMPRESADESTINO  = 'PORDEFECTO' BEGIN SET @EMPRESADESTINO = (SELECT DB_NAME())  END
----------------------------------------------------------------------------------------------------------------								
SET @ResolucionOrigen = '2'
SET @Destino1 = '0'
SET @Destino2 = '1'
      
-------Borra los datos para destino 1 y 2----------------------------------------------------------------------

SET @VAR ='DELETE FROM  '+ @EMPRESAORIGEN +'.dbo.cwtmscreenobjects where (resolution= ''' + @Destino1 + 
           ''' or   resolution= ''' + @destino2 + ''' ) and objectname = '''+ @ObjetoOrigen+''''

EXEC (@VAR)
 
-------Inserta los datos para Destino1------------------------------------------------------------------------

SET @VAR = 'INSERT INTO  '+@EMPRESAORIGEN +'.dbo.cwtmscreenobjects (OBJECTNAME, TABLENAME, OPERATION, '
SET @VAR = @VAR +' FIELDNAME,TABINDEX , LEFTCOORD, TOPCOORD, WIDTH, HEIGHT,CONTAINER, CAPTION_ARG,CAPTION_BRA,'
SET @VAR = @VAR +'CAPTION_USA, CAPTION_DEU, CAPTION_FRA,BACKCOLOR, FORECOLOR, FROZEN, ISFRAME,RELATIVEPOSITIONS,'
SET @VAR = @VAR +' OWNER, SHOWDESCRIPTION,Resolution) '

SET @VAR = @VAR +' (SELECT OBJECTNAME, TABLENAME, OPERATION, FIELDNAME, TABINDEX, LEFTCOORD,TOPCOORD, '
SET @VAR = @VAR + ' WIDTH, HEIGHT,CONTAINER, CAPTION_ARG,CAPTION_BRA, CAPTION_USA, CAPTION_DEU, CAPTION_FRA, '
SET @VAR = @VAR + ' BACKCOLOR, FORECOLOR,FROZEN, ISFRAME, RELATIVEPOSITIONS,'
SET @VAR = @VAR + 'OWNER,SHOWDESCRIPTION, '''+ @destino1+'''' 
SET @VAR = @VAR + ' from ' +@EMPRESAORIGEN+'.dbo.cwtmscreenobjects '
SET @VAR = @VAR + ' where objectName =  '''+ @ObjetoOrigen + ''' AND Resolution = ''' + @ResolucionOrigen + ''')'

EXEC (@VAR) 

--------Inserta datos para Destino2------------------------------------------------------------------------------

SET @VAR = ' INSERT INTO '+ @EMPRESAORIGEN + '.dbo.cwtmscreenobjects (OBJECTNAME, TABLENAME, OPERATION, FIELDNAME,'
SET @VAR = @VAR +'TABINDEX, LEFTCOORD, TOPCOORD, WIDTH, HEIGHT, CONTAINER, CAPTION_ARG, CAPTION_BRA, CAPTION_USA,' 
SET @VAR = @VAR +'CAPTION_DEU,CAPTION_FRA,BACKCOLOR, FORECOLOR, FROZEN, ISFRAME, RELATIVEPOSITIONS, OWNER, '
SET @VAR = @VAR +'SHOWDESCRIPTION , Resolution)  '

SET @VAR = @VAR +' (SELECT  OBJECTNAME, TABLENAME, OPERATION, FIELDNAME, TABINDEX, LEFTCOORD,TOPCOORD, WIDTH,'
SET @VAR = @VAR +'  HEIGHT, CONTAINER, CAPTION_ARG,CAPTION_BRA, CAPTION_USA, CAPTION_DEU, CAPTION_FRA, BACKCOLOR,'
SET @VAR = @VAR +' FORECOLOR, FROZEN, ISFRAME, RELATIVEPOSITIONS, OWNER, SHOWDESCRIPTION, '''+ @destino2+'''' 
SET @VAR = @VAR +' from ' +@EMPRESAORIGEN +'.dbo.cwtmscreenobjects '
SET @VAR = @VAR +' where objectName = '''+ @ObjetoOrigen + ''' AND Resolution = ''' + @ResolucionOrigen + ''')'

EXEC (@VAR)

-------------------------------------------------------------- ---------------------------------------------------
----- CwTmScreenObjects ------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
 
SET @VAR ='DELETE from  ' + @EMPRESADESTINO +'.dbo.cwtmscreenobjects where OBJECTNAME = '''+ @ObjetoDestino+'''' 

SET @VAR = @VAR +' INSERT INTO ' + @EMPRESADESTINO +'.dbo.cwtmscreenobjects  (OBJECTNAME , TABLENAME , RESOLUTION , OPERATION , FIELDNAME ,' 
SET @VAR = @VAR +' TABINDEX , LEFTCOORD , TOPCOORD , WIDTH , HEIGHT , CONTAINER , CAPTION_ARG , CAPTION_BRA ,' 
SET @VAR = @VAR +' CAPTION_USA , CAPTION_DEU , CAPTION_FRA , BACKCOLOR , FORECOLOR , FROZEN , ISFRAME ,'
SET @VAR = @VAR +' RELATIVEPOSITIONS , OWNER , SHOWDESCRIPTION , cwTMSc_FECALT , cwTMSc_FECMOD , cwTMSc_USERID ,'
SET @VAR = @VAR +' cwTMSc_ULTOPR , cwTMSc_DEBAJA , cwTMSc_HORMOV , cwTMSc_MODULE , cwTMSc_OALIAS ) '

SET @VAR = @VAR +'(SELECT  '''+ @ObjetoDestino +''' , TABLENAME , RESOLUTION , OPERATION , FIELDNAME ,'
SET @VAR = @VAR +' TABINDEX , LEFTCOORD , TOPCOORD , WIDTH , HEIGHT , CONTAINER , CAPTION_ARG , CAPTION_BRA ,'
SET @VAR = @VAR +' CAPTION_USA , CAPTION_DEU , CAPTION_FRA , BACKCOLOR , FORECOLOR , FROZEN , ISFRAME ,'
SET @VAR = @VAR +' RELATIVEPOSITIONS , OWNER , SHOWDESCRIPTION , GETDATE() , GETDATE() , '
SET @VAR = @VAR + '''CWA'''+ ','+ '''A'''+','+ '''N'''+','
SET @VAR = @VAR + ' cwTMSc_HORMOV ,  cwTMSc_MODULE , cwTMSc_OALIAS '
SET @VAR = @VAR +  ' FROM  '+ @EMPRESAORIGEN + '.dbo.cwtmscreenobjects WHERE '
SET @VAR = @VAR + ' OBJECTNAME = '''+ @ObjetoOrigen+ ''''+ ')'

EXEC (@VAR) 

------------------------------------------------------------------------------------------------------------------
----- CWTMSCREENS  -----------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------ 

SET @VAR =' DELETE from  ' + @EMPRESADESTINO + '.dbo.CWTMSCREENS where OBJECTNAME= '''+ @ObjetoDestino+'''' 

SET @VAR = @VAR +' INSERT INTO ' + @EMPRESADESTINO +'.dbo.CWTMSCREENS (OBJECTNAME , TABLENAME , RESOLUTION , OPERATION , STATE , ' 
SET @VAR = @VAR +' cwTMSc_FECALT , cwTMSc_FECMOD , cwTMSc_USERID , cwTMSc_ULTOPR , cwTMSc_DEBAJA , ' 
SET @VAR = @VAR +' cwTMSc_HORMOV , cwTMSc_MODULE , cwTMSc_OALIAS )  '

SET @VAR = @VAR + ' (SELECT  ''' + @ObjetoDestino + ''' , TABLENAME , RESOLUTION , OPERATION , STATE ,'
SET @VAR = @VAR + '  GETDATE() , GETDATE() , '
SET @VAR = @VAR + '''CWA'''+ ','+ '''A'''+','+ '''N'''+','
SET @VAR = @VAR + 'cwTMSc_HORMOV , cwTMSc_MODULE , cwTMSc_OALIAS ' 
SET @VAR = @VAR + '  FROM  '+ @EMPRESAORIGEN + '.dbo.CWTMSCREENS WHERE OBJECTNAME= '''+ @ObjetoOrigen + ''')' 

EXEC (@VAR)

------------------------------------------------------------------------------------------------------------------ 
----- CWTMITEMORDER   --------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------ 

SET @VAR =' DELETE from ' + @EMPRESADESTINO +'.dbo.CWTMITEMORDER where OBJECTNAME= '''+ @ObjetoDestino+''''
 
SET @VAR = @VAR + ' INSERT INTO ' + @EMPRESADESTINO +'.dbo.CWTMITEMORDER  (ObjectName , ObjectClass , TableName , OrderNumber , '
SET @VAR = @VAR + ' cwTMIt_FECALT , cwTMIt_FECMOD , cwTMIt_USERID , cwTMIt_ULTOPR , cwTMIt_DEBAJA , '
SET @VAR = @VAR + ' cwTMIt_HORMOV , cwTMIt_MODULE , cwTMIt_OALIAS ) '

SET @VAR = @VAR + ' (SELECT '''+ @ObjetoDestino+ ''' ,ObjectClass,TableName,OrderNumber, GETDATE() ,GETDATE(),'
SET @VAR = @VAR + '''CWA'''+ ','+ '''A'''+','+ '''N'''+','
SET @VAR = @VAR + 'cwTMIt_HORMOV , cwTMIt_MODULE , cwTMIt_OALIAS'
SET @VAR = @VAR + '  FROM  '+ @EMPRESAORIGEN +'.dbo.CWTMITEMORDER WHERE OBJECTNAME= ''' + @ObjetoOrigen+ ''')' 

EXEC (@VAR)   

-------------------------------------------------------------------------------
SET @VAR =' DELETE from ' + @EMPRESADESTINO +'.dbo.CWLAYOUTCONTAINERS WHERE ObjectName= ''' + @OBJETODESTINO + ''' AND UserID = ''' + @USRID + ''''
EXEC (@VAR)   
SET @VAR =' DELETE from ' + @EMPRESADESTINO +'.dbo.CWLAYOUTFIELDS     WHERE ObjectName= ''' + @OBJETODESTINO + '''  AND UserID = ''' + @USRID + ''''
EXEC (@VAR)   
-------------------------------------------------------------------------------

SET @VAR = 'INSERT INTO  ' + @EMPRESADESTINO +'.dbo.CWLAYOUTFIELDS(UserID, ObjectType, ObjectName, TableID, ElementID, Deepness, ParentID, ElementStyle, LeftPadding, TopPadding, RightPadding, BottomPadding, iLeft,  '
SET @VAR = @VAR + ' iTop, Width, Height, Visible, OrderIndex, ImagePath, UseRelativeSize, RelativeSize, AdjustToParentWidth, AdjustToParentHeight, LeftMargin, TopMargin, RightMargin, BottomMargin,  '
SET @VAR = @VAR + ' Company, ShowDescription, Caption, Transparent, Freezed, GloballyHidden, CWLAYO_FECALT, CWLAYO_FECMOD, CWLAYO_USERID, CWLAYO_ULTOPR, CWLAYO_DEBAJA, CWLAYO_OALIAS) '

SET @VAR = @VAR + ' (SELECT '''+ @UsrID+ ''',  ObjectType, '''+ @OBJETODESTINO + ''' , TableID, ElementID, Deepness, ParentID, ElementStyle, LeftPadding, TopPadding, RightPadding, BottomPadding, iLeft, '
SET @VAR = @VAR + ' iTop, Width, Height, Visible, OrderIndex, ImagePath, UseRelativeSize, RelativeSize, AdjustToParentWidth, AdjustToParentHeight, LeftMargin, TopMargin, RightMargin, BottomMargin,  '
SET @VAR = @VAR + ' Company, ShowDescription, Caption, Transparent, Freezed, GloballyHidden, CWLAYO_FECALT, CWLAYO_FECMOD, CWLAYO_USERID, CWLAYO_ULTOPR, CWLAYO_DEBAJA, CWLAYO_OALIAS  '
SET @VAR = @VAR + ' FROM '+ @EMPRESAORIGEN +'.dbo.CWLAYOUTFIELDS  WHERE ObjectName= '''+ @OBJETOORIGEN + ''' AND UserID = +''' + @USRID +''' ) '

EXEC (@VAR)   
-------------------------------------------------------------------------------

SET @VAR = ' INSERT INTO ' + @EMPRESADESTINO +'.dbo.CWLAYOUTCONTAINERS(UserID, ObjectType, ObjectName, TableID, ElementID, Deepness, ParentID, ElementStyle, TabSelected, LeftPadding, TopPadding, RightPadding,  '
SET @VAR = @VAR + ' BottomPadding, HSpacing, VSpacing, AutoWidth, AutoHeight, AdjustToParentWidth, AdjustToParentHeight, iLeft, iTop, Width, Height, WindowStatus, Visible, Arrangement, Orientation,  '
SET @VAR = @VAR + ' ScrollbarStyle, UseSplitbars, UseRelativeSize, RelativeSize, OrderIndex, Temporal, ImagePath, UseGrid, GridSize, LeftMargin, TopMargin, RightMargin, BottomMargin, Company, Caption, '
SET @VAR = @VAR + ' CaptionVisible, BackgroundStyle, BackgroundColor, CaptionHeight, Transparent, BorderThickness, BorderColor, CWLAYO_FECALT, CWLAYO_FECMOD, CWLAYO_USERID, CWLAYO_ULTOPR,  '
SET @VAR = @VAR + ' CWLAYO_DEBAJA, CWLAYO_OALIAS) '

SET @VAR = @VAR + ' (SELECT ''' + @UsrID + ''' , ObjectType, '''+ @OBJETODESTINO + ''' , TableID, ElementID, Deepness, ParentID, ElementStyle, TabSelected, LeftPadding, TopPadding, RightPadding, '
SET @VAR = @VAR + ' BottomPadding, HSpacing, VSpacing, AutoWidth, AutoHeight, AdjustToParentWidth, AdjustToParentHeight, iLeft, iTop, Width, Height, WindowStatus, Visible, Arrangement, Orientation, '
SET @VAR = @VAR + ' ScrollbarStyle, UseSplitbars, UseRelativeSize, RelativeSize, OrderIndex, Temporal, ImagePath, UseGrid, GridSize, LeftMargin, TopMargin, RightMargin, BottomMargin, Company, Caption, '
SET @VAR = @VAR + ' CaptionVisible, BackgroundStyle, BackgroundColor, CaptionHeight, Transparent, BorderThickness, BorderColor, CWLAYO_FECALT, CWLAYO_FECMOD, CWLAYO_USERID, CWLAYO_ULTOPR,  '
SET @VAR = @VAR + ' CWLAYO_DEBAJA, CWLAYO_OALIAS FROM '+ @EMPRESAORIGEN +'.dbo.CWLAYOUTCONTAINERS WHERE ObjectName= '''+ @OBJETOORIGEN +'''  AND UserID ='''+ @USRID +''' )'

EXEC (@VAR)   

------------------------------------------------------------------------------- */
