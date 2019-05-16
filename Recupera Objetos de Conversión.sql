select * from cwomobjects
where
not exists (select * from comcam.dbo.cwomobjects a where
a.name = cwomobjects.name) and
name like 'USR%'

select * from cwomhierarchy
where
not exists (select * from comcam.dbo.cwOMHierarchy a where
a.objectname = cwOMHierarchy.objectname) and
objectname like 'USR%'

select * from cwomobjectaliases
where
not exists (select * from comcam.dbo.cwomobjectaliases a where
a.aliasname = cwomobjectaliases.aliasname) and
cwomobjectaliases.aliasname like 'USR%'

select * from cwtmscreens
where
not exists (select * from comcam.dbo.cwtmscreens a where
a.objectname = cwtmscreens.objectname) and
cwtmscreens.objectname like 'USR%'

select * from cwtmscreenobjects
where
not exists (select * from comcam.dbo.cwtmscreenobjects a where
a.objectname = CWTMSCREENOBJECTS.objectname) and
cwtmscreenobjects.objectname like 'USR%'