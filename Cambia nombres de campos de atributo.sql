DECLARE @SERIE VARCHAR (MAX), @DESPACHO VARCHAR (MAX), @ENVASE VARCHAR (MAX), @ESTANTE VARCHAR (MAX), @UBICACION VARCHAR (MAX), @OTROS VARCHAR (MAX), @ATRIBUTO VARCHAR (MAX)

-- Definicion de nombres de atributos

set @SERIE = 'Motor'
set @ENVASE = 'Cuadro'
set @ESTANTE = 'Certificado'
set @UBICACION = 'Contenedor-Cajón'
set @OTROS = 'Packing'
set @ATRIBUTO = 'Color'



update cwtmfields set longCAPTION_ARG = @SERIE, shortcaption_arg = @SERIE where fieldname like '%_NSERIE'
update cwtmfields set longCAPTION_ARG = @SERIE + ' (Transferencia)', shortcaption_arg = @SERIE + ' (Transferencia)' where fieldname like '%_TSERIE'
update cwtmfields set longCAPTION_ARG = @SERIE, shortcaption_arg = @SERIE where fieldname like '%_DEFSER'

update cwtmfields set longCAPTION_ARG = @ENVASE, shortcaption_arg = @ENVASE where fieldname like '%_ENVASE'
update cwtmfields set longCAPTION_ARG = @ENVASE + ' (Transferencia)', shortcaption_arg = @ENVASE + ' (Transferencia)' where fieldname like '%_TENVAS'
update cwtmfields set longCAPTION_ARG = @ENVASE, shortcaption_arg = @ENVASE where fieldname like '%_DEFENV'

update cwtmfields set longCAPTION_ARG = @ESTANTE, shortcaption_arg = @ESTANTE where fieldname like '%_NESTAN'
update cwtmfields set longCAPTION_ARG = @ESTANTE + ' (Transferencia)', shortcaption_arg = @ESTANTE + ' (Transferencia)' where fieldname like '%_TESTAN'
update cwtmfields set longCAPTION_ARG = @ESTANTE, shortcaption_arg = @ESTANTE where fieldname like '%_DEFEST'

update cwtmfields set longCAPTION_ARG = @UBICACION, shortcaption_arg = @UBICACION where fieldname like '%_NUBICA'
update cwtmfields set longCAPTION_ARG = @UBICACION + ' (Transferencia)', shortcaption_arg = @UBICACION + ' (Transferencia)' where fieldname like '%_TUBICA'
update cwtmfields set longCAPTION_ARG = @UBICACION, shortcaption_arg = @UBICACION where fieldname like '%_DEFUBI'

update cwtmfields set longCAPTION_ARG = @OTROS, shortcaption_arg = @OTROS where fieldname like '%_NOTROS'
update cwtmfields set longCAPTION_ARG = @OTROS + ' (Transferencia)', shortcaption_arg = @OTROS + ' (Transferencia)' where fieldname like '%_TOTROS'
update cwtmfields set longCAPTION_ARG = @OTROS, shortcaption_arg = @OTROS where fieldname like '%_DEFOTR'

update cwtmfields set longCAPTION_ARG = @ATRIBUTO, shortcaption_arg = @ATRIBUTO where fieldname like '%_NATRIB'
update cwtmfields set longCAPTION_ARG = @ATRIBUTO + ' (Transferencia)', shortcaption_arg = @ATRIBUTO + ' (Transferencia)' where fieldname like '%_TATRIB'
update cwtmfields set longCAPTION_ARG = @ATRIBUTO, shortcaption_arg = @ATRIBUTO where fieldname like '%_DEFATR'
