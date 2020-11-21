-- надати всі можливі варіанти SQL-запиту SELECT з використанням
-- інструкцій LEFT JOIN, RIGHT JOIN і INNER JOIN (без використання WHERE)
-- для двох таблиць бази даних. 

-- показать пользователей которые не имеют заказов, и вывести информацию про пользователей сделавших заказы
/*
use inno;
select 
	u.id `user id`,
    u.`name`,
    o.id `order id`,
    
    s.`name` `status`,
    o.order_start
from `order` o
	right join `user` u on u.id = o.fk_order_user
    left join `status` s on s.id = o.fk_order_to_stat
order by s.`name` desc
*/


-- show paper with colors black yellow that are not used in services
/*
use inno;
select
	s.id `serive id`,
	s.name_service service,
    p.id `Paper id`,
    p.thickness,
    col.`name`
from 
	`services` s   right join paper p
    on  s.fk_service_paper = p.id
	join paper_colors col
    on p.fk_paper_color = col.id
    where col.id between 2 and 3
order by p.id
*/


-- show orders that don't have mackets
/*
use inno;
select 
	m.id `macket id`,
    o.id `order id`,
    o.order_start,
    m.size,
    m.height,
    m.width
    
from order_macket om
  right join `order` o on om.id_order = o.id
 left join macket_to_print m on om.id_macket = m.id
 order by o.id
*/

-- show individual orders that don't use any service
/*
use inno;
select 
	s.id `service id`,
    s.name_service,
    s.code_service,
    o.id `order id`
from `services` s
	left join order_services os on os.fk_service_id = s.id
    right join `order` o on o.id = os.fk_order_id
order by o.id
 */
 
-- show paper with covering matt and smooth that are not used in services
/*
use inno;
select
	s.id `serive id`,
	s.name_service service,
    p.id `Paper id`,
    p.thickness,
    cov.`name`
from 
	`services` s   right join paper p
    on  s.fk_service_paper = p.id
	join paper_covering cov
    on p.fk_paper_covering = cov.id
    where cov.id between 2 and 3
order by cov.name
*/


