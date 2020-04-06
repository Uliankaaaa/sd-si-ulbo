use nchome;

select * from nc_attributes
where object_type_id = 3
order by attr_id desc;

select o.object_id as 'Order ID', o.name as 'Order Name' from nc_objects o
join nc_attributes a
on o.object_type_id = a.object_type_id
join nc_params p
on a.attr_id = p.attr_id
where a.attr_id = 4 and p.value = '10 Mbps';

select * from nc_objects;
select * from nc_object_types;
select * from nc_attributes;
select * from nc_params;
select * from nc_references;

select o.object_id as 'Order ID', o.name as 'Order Name' from nc_objects o
join nc_attributes a
on o.object_type_id = a.object_type_id
where a.attr_id = 2 and o.name = '07454343676';

select o.object_id as 'Order ID', o.name as 'Order Name', ot.object_type_id as 'Object Type ID', ot.name as 'Object Type Name' from nc_objects o
join nc_object_types ot
on o.object_type_id = ot.object_type_id
join nc_attributes a
on o.object_type_id = a.object_type_id
where a.attr_id = 2 and o.name = '07454343676';

