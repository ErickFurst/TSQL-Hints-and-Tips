sp_who2 active

sp_lock

select object_name(X)

select * from sysobjects 
where id in ( X,  Y, Z)

sp_updatestats






CREATE PROCEDURE DBO.sp_TbLock @spid INT
AS
SELECT * FROM SYSOBJECTS
WHERE ID IN (SELECT rsc_objid As ObjId 
             FROM master.dbo.syslockinfo,
                  master.dbo.spt_values v,
                  master.dbo.spt_values x,
                  master.dbo.spt_values u
             WHERE master.dbo.syslockinfo.rsc_type = v.number and 
                   v.type = 'LR' and 
                   master.dbo.syslockinfo.req_status = x.number and 
                   x.type = 'LS' and 
                   master.dbo.syslockinfo.req_mode + 1 = u.number and 
                   u.type = 'L' and 
                   req_spid in (@spid))


