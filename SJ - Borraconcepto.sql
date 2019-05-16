declare @cptdes float, @cpthas float

set @cptdes = 60600
set @cpthas = 60600

select * from sjccoh where
(sjccoh_codcpt between  @cptdes and @cpthas) 


delete sjccoa where
(sjccoa_codcpt between  @cptdes and @cpthas) 
delete sjccoe where
(sjccoe_codcpt between  @cptdes and @cpthas) 
delete sjccoi where
(sjccoi_codcpt between  @cptdes and @cpthas) 
delete sjccom where
(sjccom_codcpt between  @cptdes and @cpthas) 
delete sjccor where
(sjccor_codcpt between  @cptdes and @cpthas) 
delete sjccov where
(sjccov_codcpt between  @cptdes and @cpthas) 
delete sjccom where
(sjccom_codcpt between  @cptdes and @cpthas) 
delete sjccoh where
(sjccoh_codcpt between  @cptdes and @cpthas) 

