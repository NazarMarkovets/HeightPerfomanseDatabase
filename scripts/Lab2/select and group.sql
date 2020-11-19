-- Показать заказы с найбольшим количеством услуг в нём за 2015 год
/*
use my;
select 
	fk_order_id `Order number`,
    o.order_done,
    o.total_price,
    count(fk_service_id) as `Services in order`
from order_services os, `order` o
where o.id_order = os.fk_order_id and o.order_done like '2015%'
group by fk_order_id
Order by `Services in order` desc
*/

-- показать 10 самых пожилых покупателей возрастом от 60 до 100 лет
/*
use my;
select idUser `ID`, nameUser `Name`, snameuser `Surname`, age, totalSpent `Total money spend`, emailUser `Email`, phoneNumb `Phone`
from `user` u, user_role r
where idStatusUser = fk_user_to_role AND fk_user_to_role = 2 and (age between 60 and 100)
group by age
order by age desc
limit 10;
*/

-- show all done orders with summary price and status done
/*
use my;
	select 
    sum(total_price) as totalSpent,
    os.name_status,
    `user`.nameUser,
    `user`.snameUser,
    `user`.phoneNumb
from 
    `order`,
    `user`,
    order_status os
where 
	`order`.fk_order_user = `user`.idUser 
    and os.id_order_status = `order`.fk_order_to_stat
    and `order`.fk_order_to_stat = 4 
group by `user`.idUser 
*/

-- show the count of mackets by differnt formats sorted by amout with average meanings
/*
use my;
select 
format(avg(m.sizebyte), 2)`average size MB`,
count(1) amount,
format(avg(m.height), 2)`average heidght pX`,
format(avg(m.width), 2)`average width px`, f.nameFormat
from macket_to_print m, format_type f
where f.idFormatType = m.fk_macket_to_formatType
group by f.nameFormat
order by amount desc
*/


-- показать все усл
use my;
select 
count(1) as `count` , p.covering
from paper p, services s
where s.fk_service_paper = p.idPaper
group by p.covering



