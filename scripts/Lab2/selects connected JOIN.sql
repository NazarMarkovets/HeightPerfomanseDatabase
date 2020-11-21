-- select 10 the more important persons, register date is also important for company
/*
use inno;
select 
	u.id,
	u.`name`,
    u.sname,
    u.age,
    r.`name` `status`
from 
	`user` u
join 
	`role` r on u.fk_user_to_role = r.id
ORDER by r.id, u.`History` ASC limit 10;
*/

-- select top 10 the largest files from users
/*
use inno;
select 
	M.id `ID`,
    M.`File`,
	concat(M.size ,' MB') as Size,
    concat(M.height,' pxls') as height,
    concat(M.width,' pxls') as width,
    f.`name` `Format`
from macket_to_print M
join format_type F on M.fk_macket_to_formatType = F.id
ORDER by size desc
limit 10;
*/



-- Показать заказы отсортированые по цене со статусом "новый" включая название услуги и данные про макеты пользователей
/*
use inno;
select 
	o.id, o.order_start,
    O.total_price,
    st.`name` `Status`,
    se.name_service `Service`, mp.`File`,
    concat(mp.height,' pxls') as height,
    concat(mp.width,' pxls') as width,
    concat(mp.size,' MB') as size
from order_macket om
	join `order` o On o.id = om.id_order
    join macket_to_print mp ON mp.id = om.id_macket
    join `status` st ON st.id = o.fk_order_to_stat
	join order_services card ON card.fk_order_id = o.id
    join services se ON se.id = card.fk_service_id
where st.`name` = 'new' Order by total_price desc;
*/

/* Показать все услуги с кодом начинающимся с #200, 
включая подробную информацию про бумагу с отбеливатилями больше 2-х грамм
отсортированное в порядке убывания*/
/*
use inno;
select 
	se.id,
    se.code_service,
    concat(i.height, ' см') AS `paper height`,
    concat(i.width, ' см') AS `paper width`,
    i.`name` `ISO`,
    col.`name` color ,
    cov.`name` covering ,
    concat(pb.Lvl, ' гр/м') `Добавок отбеливания`,
    concat(pd.lvl, ' pp/м') `Плотность`,
    se.name_service `service`
from paper p
	join paper_brightness pb on pb.id = p.fk_paper_to_bright
	join paper_iso i on i.id = p.fk_paper_to_iso
	join paper_covering cov on cov.id = p.fk_paper_covering
	join paper_colors col on col.id = p.fk_paper_color
	join paper_density pd on pd.id = p.fk_paper_to_density
	join services se on se.fk_service_paper = p.id
where se.code_service like '#2008%' and pb.Lvl > 2
Order by pb.Lvl desc;
*/


-- показать заказы отсортированные по убыванию даты заключения, с цветом бумаги "белая" и матовым покрытием

/*
use inno;
select 
	o.id, o.total_price,
    o.order_start,
    st.`name` `Status`,
    se.code_service,
    se.Price,
    se.name_service,
    col.`name` `color`,
    cov.`name` `covering`
from 
	`order` o
	join order_services card on card.fk_order_id = o.id
    join services se on card.fk_service_id = se.id
    join paper p on p.id = se.fk_service_paper
	join `status` st on st.id = o.fk_order_to_stat
	join paper_covering cov on cov.id = p.fk_paper_covering
    join paper_colors col on col.id = p.fk_paper_color
where 
	p.fk_paper_color = 5 AND cov.`name` = 'matt'
order by o.order_start desc;
*/

