Insert CWOMUSERS (ID,ISNTUSER,DOMAINNAME,NTUSERNAME,DESCRIPTION,GROUPNAME,PWD,ALLWAYSASNTUSER,ISADMIN,SID,CWOMUS_FECALT,CWOMUS_FECMOD,CWOMUS_USERID,CWOMUS_ULTOPR,CWOMUS_DEBAJA,CWOMUS_HORMOV,CWOMUS_MODULE,CWOMUS_OALIAS,CWOMUS_LOTTRA,CWOMUS_LOTREC,CWOMUS_LOTORI,ISSPECIALADMINENC,CWOMUS_SYSVER,CWOMUS_CMPVER)
(select ID,ISNTUSER,DOMAINNAME,NTUSERNAME,DESCRIPTION,GROUPNAME,PWD,ALLWAYSASNTUSER,ISADMIN,SID,CWOMUS_FECALT,CWOMUS_FECMOD,CWOMUS_USERID,CWOMUS_ULTOPR,CWOMUS_DEBAJA,CWOMUS_HORMOV,CWOMUS_MODULE,CWOMUS_OALIAS,CWOMUS_LOTTRA,CWOMUS_LOTREC,CWOMUS_LOTORI,ISSPECIALADMINENC,CWOMUS_SYSVER,CWOMUS_CMPVER from CoreVieja.dbo.CWOMUSERS Where Id <> 'Admin')

Insert cwOMGroups (Name,Description,cwOMGr_FECALT,cwOMGr_FECMOD,cwOMGr_USERID,cwOMGr_ULTOPR,cwOMGr_DEBAJA,cwOMGr_HORMOV,cwOMGr_MODULE,cwOMGr_OALIAS,cwOMGr_LOTTRA,cwOMGr_LOTORI,cwOMGr_SYSVER,cwOMGr_CMPVER)
(select NAME,DESCRIPTION,cwOMGr_FECALT,cwOMGr_FECMOD,cwOMGr_USERID,cwOMGr_ULTOPR,cwOMGr_DEBAJA,cwOMGr_HORMOV,cwOMGr_MODULE,cwOMGr_OALIAS,cwOMGr_LOTTRA,cwOMGr_LOTORI,cwOMGr_SYSVER,cwOMGr_CMPVER from CoreVieja.dbo.cwOMGroups)

Insert CWOMAREASBYGROUP (GROUPNAME,COMPANYNAME,AREANAME,ACCESSLEVEL,CWOMAR_FECALT,CWOMAR_FECMOD,CWOMAR_USERID,CWOMAR_ULTOPR,CWOMAR_DEBAJA,CWOMAR_HORMOV,CWOMAR_MODULE,CWOMAR_OALIAS,CWOMAR_LOTTRA,CWOMAR_LOTREC,CWOMAR_LOTORI,CWOMAR_SYSVER,CWOMAR_CMPVER)
(Select GROUPNAME,COMPANYNAME,AREANAME,ACCESSLEVEL,CWOMAR_FECALT,CWOMAR_FECMOD,CWOMAR_USERID,CWOMAR_ULTOPR,CWOMAR_DEBAJA,CWOMAR_HORMOV,CWOMAR_MODULE,CWOMAR_OALIAS,CWOMAR_LOTTRA,CWOMAR_LOTREC,CWOMAR_LOTORI,CWOMAR_SYSVER,CWOMAR_CMPVER from CoreVieja.dbo.CWOMAREASBYGROUP)

Insert CWOMOBJECTSBYGroup(GROUPNAME,COMPANYNAME,OBJECTNAME,OBJECTCLASS,ACCESSLEVEL,CWOMOB_FECALT,CWOMOB_FECMOD,CWOMOB_USERID,CWOMOB_ULTOPR,CWOMOB_DEBAJA,CWOMOB_HORMOV,CWOMOB_MODULE,CWOMOB_OALIAS,CWOMOB_LOTTRA,CWOMOB_LOTREC,CWOMOB_LOTORI,CWOMOB_SYSVER,CWOMOB_CMPVER)
(Select GROUPNAME,COMPANYNAME,OBJECTNAME,OBJECTCLASS,ACCESSLEVEL,CWOMOB_FECALT,CWOMOB_FECMOD,CWOMOB_USERID,CWOMOB_ULTOPR,CWOMOB_DEBAJA,CWOMOB_HORMOV,CWOMOB_MODULE,CWOMOB_OALIAS,CWOMOB_LOTTRA,CWOMOB_LOTREC,CWOMOB_LOTORI,CWOMOB_SYSVER,CWOMOB_CMPVER from CoreVieja.dbo.CWOMOBJECTSBYGROUP) ---- Aca decia CWOMOBJECTSBYUSER

Insert CWOMOBJECTSBYUSER (USERID,COMPANYNAME,OBJECTNAME,OBJECTCLASS,ACCESSLEVEL,CWOMOB_FECALT,CWOMOB_FECMOD,CWOMOB_USERID,CWOMOB_ULTOPR,CWOMOB_DEBAJA,CWOMOB_HORMOV,CWOMOB_MODULE,CWOMOB_OALIAS,CWOMOB_LOTTRA,CWOMOB_LOTREC,CWOMOB_LOTORI,CWOMOB_SYSVER,CWOMOB_CMPVER)
(Select USERID,COMPANYNAME,OBJECTNAME,OBJECTCLASS,ACCESSLEVEL,CWOMOB_FECALT,CWOMOB_FECMOD,CWOMOB_USERID,CWOMOB_ULTOPR,CWOMOB_DEBAJA,CWOMOB_HORMOV,CWOMOB_MODULE,CWOMOB_OALIAS,CWOMOB_LOTTRA,CWOMOB_LOTREC,CWOMOB_LOTORI,CWOMOB_SYSVER,CWOMOB_CMPVER from CoreVieja.dbo.CWOMOBJECTSBYUSER)

Insert cwOMGroupsByUser (userID,GroupName,cwOMGr_FECALT,cwOMGr_FECMOD,cwOMGr_USERID,cwOMGr_ULTOPR,cwOMGr_DEBAJA,cwOMGr_HORMOV,cwOMGr_MODULE,cwOMGr_OALIAS,cwOMGr_LOTTRA,cwOMGr_LOTORI,cwOMGr_SYSVER,cwOMGr_CMPVER)
(select UserID,GroupName,cwOMGr_FECALT,cwOMGr_FECMOD,cwOMGr_USERID,cwOMGr_ULTOPR,cwOMGr_DEBAJA,cwOMGr_HORMOV,cwOMGr_MODULE,cwOMGr_OALIAS,cwOMGr_LOTTRA,cwOMGr_LOTORI,cwOMGr_SYSVER,cwOMGr_CMPVER from CoreVieja.dbo.cwOMGroupsByUser)

Insert CWOMAREASBYUSER (UserID,COMPANYNAME,AREANAME,ACCESSLEVEL,CWOMAR_FECALT,CWOMAR_FECMOD,CWOMAR_USERID,CWOMAR_ULTOPR,CWOMAR_DEBAJA,CWOMAR_HORMOV,CWOMAR_MODULE,CWOMAR_OALIAS,CWOMAR_LOTTRA,CWOMAR_LOTREC,CWOMAR_LOTORI,CWOMAR_SYSVER,CWOMAR_CMPVER)
(Select UserID,COMPANYNAME,AREANAME,ACCESSLEVEL,CWOMAR_FECALT,CWOMAR_FECMOD,CWOMAR_USERID,CWOMAR_ULTOPR,CWOMAR_DEBAJA,CWOMAR_HORMOV,CWOMAR_MODULE,CWOMAR_OALIAS,CWOMAR_LOTTRA,CWOMAR_LOTREC,CWOMAR_LOTORI,CWOMAR_SYSVER,CWOMAR_CMPVER from CoreVieja.dbo.CWOMAREASBYUSER)


Insert cwOMRightsByGroup(GROUPNAME,COMPANYNAME,EDITREPORTS,EDITDICTIONARY,EDITFORMS,cwOMRi_FECALT,cwOMRi_FECMOD,cwOMRi_USERID,cwOMRi_ULTOPR,cwOMRi_DEBAJA,cwOMRi_HORMOV,cwOMRi_MODULE,cwOMRi_OALIAS,cwOMRi_LOTTRA,cwOMRi_LOTREC,cwOMRi_LOTORI,cwOMRi_SYSVER,cwOMRi_CMPVER)
(select GROUPNAME,COMPANYNAME,EDITREPORTS,EDITDICTIONARY,EDITFORMS,cwOMRi_FECALT,cwOMRi_FECMOD,cwOMRi_USERID,cwOMRi_ULTOPR,cwOMRi_DEBAJA,cwOMRi_HORMOV,cwOMRi_MODULE,cwOMRi_OALIAS,cwOMRi_LOTTRA,cwOMRi_LOTREC,cwOMRi_LOTORI,cwOMRi_SYSVER,cwOMRi_CMPVER from CoreVieja.dbo.cwOMRightsByGroup)


select * from cwOMGroups