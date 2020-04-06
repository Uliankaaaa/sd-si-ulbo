use nchome;

select a.object_type_id as 'Object Type ID', sum(p.value) as 'Sum Value' 
from nc_params p
left join nc_attributes a
on p.attr_id = a.attr_id
where a.attr_id in (10, 11, 12)
group by a.object_type_id
having sum(p.value) > 60;

select o.object_id as 'Order ID', o.name as 'Order Name', min(p.value) as 'Minimum Price' 
from nc_objects o
join nc_params p
on p.object_id = o.object_id
join nc_attributes a
on p.attr_id = a.attr_id
where a.attr_id in (10, 11, 12) and o.object_type_id = 1
having min(p.value);

select o.object_id as 'Order ID', o.name as 'Order Name', max(p.value) as 'Maximum Period' 
from nc_objects o
join nc_params p
on p.object_id = o.object_id
join nc_attributes a
on p.attr_id = a.attr_id
where a.attr_id in (7, 8, 9) and o.object_type_id in (1, 2)
having max(p.value);

select o.object_id as 'Order ID', o.name as 'Order Name', round(avg(p.value)) as 'Average' 
from nc_objects o
join nc_params p
on p.object_id = o.object_id
join nc_attributes a
on p.attr_id = a.attr_id
where a.attr_id in (7, 8, 9)
group by o.object_type_id
having avg(p.value);

select sum(p1.value) as 'Sum Price', sum(p.value) as 'Price', sum(p1.value)/sum(p.value) as 'Period' 
from nc_objects o
join nc_params p
on p.object_id = o.object_id
join nc_params p1
on p1.object_id = o.object_id
where p.attr_id in(7, 8, 9) and o.object_type_id = 1 and  p1.attr_id in(10, 11, 12);

select sum(p.value) as 'Sum' 
from  nc_params p
where p.object_id  in (1, 2, 5)
having sum(p.value);

select 
case 
when p.value = (select max(nc_params.value) from nc_params where p.attr_id in (10, 11, 12)) then 'The most expensive'
when p.value = (select min(nc_params.value) from nc_params where p.attr_id in (10, 11, 12)) then 'The cheapest'
else 'The other'
end as 'Result', 
o.object_id as 'Order ID', o.name as 'Order Name', p.value as 'ProductPrise' 
from nc_objects o
join nc_params p
on p.object_id = o.object_id
where p.attr_id in (10, 11, 12)
order by p.value;

select count(*) 'Counter', p.value 'Value', p.list_value_id 'List Value'
from nc_params p
group by case
when p.list_value_id is not null then p.list_value_id
else p.value
end;

select * from nc_objects
order by case
when object_type_id != 9 then object_type_id
else description
end;

select * from nc_params;
select * from nc_attributes;
select * from nc_objects;
