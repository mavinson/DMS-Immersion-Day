Lab 1 - SCT

Source Endpoint:
Server Port - 1521
Oracle SID - ORACLEDB
User Name - dbmaster
Password - dbmaster123
Oracle Driver Path - C:\Users\Administrator\Desktop\DMS Workshop\JDBC\ojdbc7.jar

Target Endpoint:
Server Port - 5432
Database - AuroraDB
User Name - dbmaster
Password - dbmaster123
Amazon Aurora Driver Path - C:\Users\Administrator\Desktop\DMS Workshop\JDBC\postgresql-42.2.6.jar


Lab 2 - DMS

Step 8 (Grants for Oracle endpoint)
GRANT SELECT ANY TABLE to DMS_USER;
GRANT SELECT on ALL_VIEWS to DMS_USER;
GRANT SELECT ANY TRANSACTION to DMS_USER; 
GRANT SELECT on DBA_TABLESPACES to DMS_USER; 
GRANT SELECT on ALL_TAB_PARTITIONS to DMS_USER; 
GRANT SELECT on ALL_INDEXES to DMS_USER;
GRANT SELECT on ALL_OBJECTS to DMS_USER;
GRANT SELECT on ALL_TABLES to DMS_USER;
GRANT SELECT on ALL_USERS to DMS_USER;
GRANT SELECT on ALL_CATALOG to DMS_USER;
GRANT SELECT on ALL_CONSTRAINTS to DMS_USER; 
GRANT SELECT on ALL_CONS_COLUMNS to DMS_USER; 
GRANT SELECT on ALL_TAB_COLS to DMS_USER; 
GRANT SELECT on ALL_IND_COLUMNS to DMS_USER; 
GRANT SELECT on ALL_LOG_GROUPS to DMS_USER; 
GRANT LOGMINING TO DMS_USER;

Step 9 (RDSADMIN Procedures for Oracle endpoint)
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$ARCHIVED_LOG','DMS_USER','SELECT'); 
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOG','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGFILE','DMS_USER','SELECT'); 
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$DATABASE','DMS_USER','SELECT'); 
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$THREAD','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$PARAMETER','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$NLS_PARAMETERS','DMS_USER','SELECT'); 
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$TIMEZONE_NAMES','DMS_USER','SELECT'); 
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$TRANSACTION','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('DBA_REGISTRY','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('OBJ$','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_ENCRYPTED_COLUMNS','DMS_USER','SELECT'); 
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_LOGS','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_CONTENTS','DMS_USER','SELECT'); 
exec rdsadmin.rdsadmin_util.grant_sys_object('DBMS_LOGMNR','DMS_USER','EXECUTE');

Step 10 (Retention Hours)
exec rdsadmin.rdsadmin_util.set_configuration('archivelog retention hours',24);

Step 11 (Supplemental Logging)
exec rdsadmin.rdsadmin_util.alter_supplemental_logging('ADD');

Step 12 (Primary Key)
exec rdsadmin.rdsadmin_util.alter_supplemental_logging('ADD','PRIMARY KEY');

Ste 13 (Supplemental Logging)
alter table dms_sample.nfl_stadium_data add supplemental log data (ALL) columns; 
alter table dms_sample.mlb_data add supplemental log data (ALL) columns;
alter table dms_sample.nfl_data add supplemental log data (ALL) columns;

Step 46 (Insert Data into Source)
INSERT ALL
INTO dms_sample.sport_type (name,description) VALUES ('hockey', 'A sport in which two teams play against each other by trying to more a puck into the opponents goal using a hockey stick')
INTO dms_sample.sport_type (name,description) VALUES ('basketball', 'A sport in which two teams of five players each that oppose one another shoot a basketball through the defenders hoop')
INTO dms_sample.sport_type (name,description) VALUES ('soccer','A sport played with a spherical ball between two teams of eleven players')
INTO dms_sample.sport_type (name,description) VALUES ('volleyball','two teams of six players are separated by a net and each team tries to score by grounding a ball on the others court')
INTO dms_sample.sport_type (name,description) VALUES ('cricket','A bat-and-ball game between two teams of eleven players on a field with a wicket at each end')
SELECT * FROM dual;
COMMIT;
SELECT * FROM dms_sample.sport_type;

