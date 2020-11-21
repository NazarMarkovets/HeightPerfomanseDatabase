-- show all registered users
/*
use inno;
select 
	u.id `ID`,
    u.`name` `Name`,
    sname `Surname`,
    age, 
    email `Email`,
    phone `Phone`
from 
	inno.`user` u,
    inno.`role` r
where 
	(r.id = u.fk_user_to_role) AND (u.fk_user_to_role = 2);
*/


-- show all users spend more than 5000 
/*
use inno;
select 
    o.total_price,
	os.`name`,
    u.`name`,
    u.sname,
    u.phone
from 
    `order` o,
    `user` u,
    `status` os
where 
		(o.fk_order_user = u.id)
    and (os.id = o.fk_order_to_stat)
    and (o.total_price > 5000)
*/




-- show all canseled orders
/*
use inno;
select 
	o.id `ID` ,
    order_done `Canseled date`,
    total_price `Order Price`,
    Details,
    s.`name`
from 
	inno.`order` o,
    `status` s
where 
	fk_order_to_stat =  s.id
    and fk_order_to_stat = 3;
*/


-- show all services with black paper 
/*
use inno;
	select 
		se.id, se.name_service,
        price, code_service, 
		concat(i.height, ' см') AS `paper height`,
        concat(i.width, ' см') AS `paper width`,
        i.`name` `paper format`,
        p.thickness, c.`name`
	from 
		services se, paper p,
        paper_colors c, paper_iso i
	where 
		se.fk_service_paper = p.id and p.fk_paper_to_iso = i.id
        and p.fk_paper_color = c.id and c.name = 'black'
*/


-- show all services with using font size > 15
/*
use inno;
select 
    se.id, se.name_service,
    se.price, se.code_service, 
    f.`name`, f.size `Font size`
from 
	services se,
    fonts f
where 
    f.id = se.fk_service_fonts
	AND f.size >15;
*/


-- Show detail data about paper
/*
use inno;
select 
	p.id `ID`, p.`name`,
    i.`name` `ISO`, 
    concat(i.height, ' см') `paper height`,
    concat(i.width, ' см')`paper width`,
    concat(B.lvl, ' гр/м') `Добавок отбеливания`,
    concat(D.lvl, ' pp/м') `плотность`
from 
	paper p, paper_brightness B,
    paper_density D, paper_iso i
where 
	(fk_paper_to_bright = B.id)
and (fk_paper_to_bright = D.id)
and (fk_paper_to_iso = i.id)
*/

-- show detail new orders
/*
use inno;
select 
    o.id `ID`, st.`name` `Status`,
    order_start `Create date`, o.total_price `Order Price`,
    se.name_service,
    u.`name` `user name`, u.sname, u.phone
from 
	order_services os, `order` o,
    services se, `status` st,
    `user` u
where 
	(os.fk_order_id = o.id) and (fk_service_id = se.id) 
and (o.fk_order_to_stat =  st.id) and (fk_order_to_stat = 1)
and (o.fk_order_user = u.id);
*/
