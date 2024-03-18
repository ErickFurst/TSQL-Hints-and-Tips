
select * from msdb..sysjobs 
where name = 'job jde carga duplicata'

select * from msdb..sysjobservers
where job_id = (select job_id from msdb..sysjobs where name = 'job jde carga duplicata')

select * from msdb..sysjobsteps
where job_id = (select job_id from msdb..sysjobs where name = 'job jde carga duplicata')

select * from msdb..sysjobhistory
where job_id = (select job_id from msdb..sysjobs where name = 'job jde carga duplicata')

select * from msdb..sysjobschedules
where job_id = (select job_id from msdb..sysjobs where name = 'job jde carga duplicata')



msdb..sp_help_job '3FB17F1D-39E4-47E2-BCBB-BFE51A5EC328'
msdb..sp_help_jobstep '3FB17F1D-39E4-47E2-BCBB-BFE51A5EC328'
msdb..sp_help_jobhistory '3FB17F1D-39E4-47E2-BCBB-BFE51A5EC328'
