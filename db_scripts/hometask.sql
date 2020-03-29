create database nchome;

use nchome;

create table object_types(
		object_type_id int(6) unsigned auto_increment primary key,
        name varchar(50) not null,
        description varchar(200));
        
create table nc_objects(
		object_id int(6) unsigned auto_increment primary key,
        object_type_id int references object_types(object_type_id),
        name varchar(50) not null,
        description varchar(200));    
        
create table list_values(
		list_value_id int(6) unsigned auto_increment primary key,
        value varchar(50));
        
create table nc_attributes(
			attr_id int(6) unsigned auto_increment primary key,
			object_type_id int(6),
            name varchar(50),
            type int(6));
            
create table nc_references(
			object_id int references objects(object_id),
            attr_id int references attributes(attr_id),
            reference int(6));
            
 create table nc_params(
			object_id int references objects(object_id),
            attr_id int references attributes(attr_id),
            list_value_id int references list_values(list_value_id),
            value varchar(50));
            
insert into object_types
values(null, 'Internet Order Object Type', null);
insert into object_types
values(null, 'Video Order Object Type', null);
insert into object_types
values(null, 'Mobile Order Object Type', null);
insert into object_types
values(null, 'Abstract Order Object Type', 'Abstract object type for all porduct orders');
insert into object_types
values(null, 'Internet Instance Object Types', null);
insert into object_types
values(null, 'Video Instance Object Types', null);
insert into object_types
values(null, 'Mobile Order Object Type', null);
insert into object_types
values(null, 'Abstract Instance Object Types', 'Abstract object type for all porduct instances');
insert into object_types
values(null, 'Phone number', null);

insert into nc_objects
values(null, 1, 'Internet Order #1', null);
insert into nc_objects
values(null, 2, 'Video Order #1', null);
insert into nc_objects
values(null, 2, 'Video Order #2', null);
insert into nc_objects
values(null, 1, 'Internet Order #2', null);
insert into nc_objects
values(null, 3, 'Mobile Order #1', null);
insert into nc_objects
values(null, 9, '07454343676', 'Number in the system');

insert into nc_attributes
values(null, 18, 'Due Date', 4);
insert into nc_attributes
values(null, 8, 'Phone Number', 9);
insert into nc_attributes
values(null, 6, 'Access Type', 6);
insert into nc_attributes
values(null, 6, 'Download Speed', 0);
insert into nc_attributes
values(null, 8, 'Service Type', 6);
insert into nc_attributes
values(null, 7, 'Suspend Reason', 0);

insert into  list_values
values(null, 'XDSL');
insert into  list_values
values(null, 'GPON');
insert into  list_values
values(null, 'Postpaid');
insert into  list_values
values(null, 'Prepaid');

insert into nc_params
values(1, 3, 2, null);
insert into nc_params
values(1, 4, null, '100 Mbps');
insert into nc_params
values(2, 6, null, "Device Stolen");
insert into nc_params
values(3, 6, null, 'Tariff Change');
insert into nc_params
values(4, 3, 1, null);
insert into nc_params
values(4, 4, null, '500 Mbps');
insert into nc_params
values(5, 5, 3, null);
            
insert into nc_references
values(5, 9, 6);		

show tables;

select * from list_values;
select * from nc_attributes;
select * from nc_objects;
select * from nc_params;
select * from nc_references;
select * from object_types;