-- select admin users
/*
use inno;
select 
	u.id,
	u.`name`,
    u.sname
from `user` u
where u.fk_user_to_role IN (select r.id from `role` r) and u.fk_user_to_role = 1
*/


-- show all orders with status canseled
/*
use inno;
select
	o.id,
    o.order_start
from `order` o
where o.fk_order_to_stat = ANY (select s.id from `status` s where s.name = 'Canceled')
*/

-- select all orders that have незаданный статус
/*
use inno;
select
	o.id,
    o.order_start
from `order` o
where exists (select s.id from `status` s where s.id = 5)
*/

-- find all orders that have status `canseled`
/*
use inno;
select
	o.id `order id`,
    o.order_start
from `order` o
where exists (select s.id from `status` s where s.id = o.fk_order_to_stat and s.id = 3)
order by o.id
*/


-- select users that don't have orders 
/*
use inno;
select 
	u.id,
	u.name,
    u.sname
from `user` u
where NOT EXISTS (select o.fk_order_user from `order` o where o.fk_order_user = u.id)
*/

-- select all users that don't have canseled orders

use inno;
select 
	u.id `user id`,
	u.`name` `user name`,
    u.sname
from `user` u
where u.id NOT IN (
	select o.fk_order_user 
    from `order` o 
    where o.fk_order_to_stat = 
		(select s.id from `status` s where s.name = 'Canceled') 
	and fk_order_user is not null) 


-- select paper without paper color 'black'
/*
use inno;
select 
	p.id `paper id`,
    p.`name`,
    p.thickness
from paper p
where not exists (select col.id from paper_colors col where col.id = p.fk_paper_color and col.name = 'black')
*/

-- show paper that have type of covering matt
/*
use inno;
select
	p.id,
    p.`name`
from paper p
where p.fk_paper_covering = ANY (select cov.id from paper_covering cov where cov.name = 'matt')
*/

-- select all paper которая не меньше 800 на 800
/*
use inno;
select 
	p.id,
	p.name,
    p.fk_paper_to_iso
from paper p
where p.fk_paper_to_iso not in (select i.id from paper_iso i where (i.height < 800 or i.width < 800))
*/