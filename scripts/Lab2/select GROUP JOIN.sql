-- show summ size in mb for all formats

/*
use inno;
select 
	format(sum(M.Size), 2) as Size,
    f.`name`
from macket_to_print M
join format_type F on M.fk_macket_to_formatType = F.id
group by F.name
ORDER by size desc
*/


-- show count of role for users
/*
use inno;
select 
	count(1) as `count`,
    r.`name`
from `user` u
join `role` r on r.id = u.fk_user_to_role
group by r.`name`
 */
 
 
 -- show totoal money for all order's statuses
 /*
 use inno;
 select 
	concat(format(sum(o.total_price), 2), ' uah') as `all money`,
    os.`name`
from 
	`order` o
join `status` os on os.id = o.fk_order_to_stat
group by os.`name`
*/

-- show all users they count of orders and summary order price
/*
use inno;
select 
	u.id `user id`,
	count(1) `count of orders`,
    concat(format(sum(o.total_price), 2), ' uah') as `all money spent`
from 
	`order` o
 join 
	`user` u on u.id = o.fk_order_user
group by u.id having sum(o.total_price)>8000
*/

-- show count of servicec uses каждый paper color

use inno;
select 
	col.id `color id`,
	count(1) `services used color`,
    col.`name`
from 
	`services` s
join 
	paper p on p.id = s.fk_service_paper
join 
	paper_colors col on col.id = p.fk_paper_color
group by col.`name`




    
    
	



