-- Показать заказы с найбольшим количеством услуг в нём за 2015 год
/* D
use inno;
select 
	fk_order_id `Order number`,
    o.order_done,
    o.total_price,
    count(fk_service_id) as `Services in order`
from order_services os, `order` o
where o.id = os.fk_order_id and o.order_done like '2015%'
group by fk_order_id
Order by `Services in order`desc

*/

-- показать 10 самых пожилых покупателей возрастом от 60 до 100 лет
/* D
use inno;
select 
	u.id `ID`,
    u.`name`,
    u.sname `Surname`,
    age,
    email,
    phone
from 
	`user` u,
    `role` r
where 
	r.id = fk_user_to_role 
AND fk_user_to_role = 2 
AND (age between 60 and 100)
group by age
order by age desc
limit 10;

*/

-- show all done orders with summary price and status done
/* D

use inno;
select 
    sum(total_price) as totalSpent,
    os.`name`,
    `user`.`name`,
    `user`.sname,
    `user`.phone
from 
    `order`,
    `user`,
    `status` os
where 
	`order`.fk_order_user = `user`.id
    and os.id = `order`.fk_order_to_stat
    and `order`.fk_order_to_stat = 4 
group by `user`.id

*/

-- show the count of mackets by differnt formats sorted by amout with average meanings
/* D

use inno;
select 
	format(avg(m.size), 2)`average size MB`,
	count(1) amount,
	format(avg(m.height), 2)`average heidght pX`,
	format(avg(m.width), 2)`average width px`,
    f.`name` `Format type`
from 
	macket_to_print m,
    format_type f
where 
	f.id = m.fk_macket_to_formatType
group by f.`name`
order by amount desc

*/

-- показать услуги использующие один размер бумаги по стандарту ISO и тип покрытия матовый
/*
use inno;
select
	s.id,
    s.name_service,
    s.Price,
    i.`name` ISO,
	i.height,
    i.width
from 
	paper p,
    paper_colors col,
    paper_covering cov,
    services s,
    paper_iso i
    
where 
	s.fk_service_paper = p.id AND
    p.fk_paper_to_iso = i.id AND
    p.fk_paper_covering = cov.id AND
    cov.`name` = 'matt'
group by 
	i.`name`, cov.`name`
Order by s.id

*/

