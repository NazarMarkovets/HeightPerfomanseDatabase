-- show all registered users
/*use my;
select idUser `ID`, nameUser `Name`, snameuser `Surname`, age, 
emailUser `Email`, phoneNumb `Phone`
from my.user, my.user_role
where idStatusUser = fk_user_to_role AND fk_user_to_role = 2;*/

-- show all users spend more than 5000 
/* 
use my;
	select 
    `order`.total_price,
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
    and `order`.total_price > 5000

*/



-- show all canseled orders
/*
use my;
select id_order `ID` , order_done `Canseled date`, total_price `Order Price`, Details, order_status.name_status
from my.order, order_status
where fk_order_to_stat =  id_order_status and fk_order_to_stat = 3;
*/


-- show all services with black paper 
/*
use my;
	select idSerivces, name_service, price, code_service, 
		concat(paper.height, ' см') AS `paper height`, concat(paper.width, ' см') AS `paper width`,
        paper.iso_format `paper format`, paper.thickness ,services.description
	from my.services, my.paper
	where fk_service_paper = idPaper AND paper.color = 'black';
*/

-- show all services with paper covering matt and additional font size > 8 

/*
use my;
	select idSerivces, name_service, price, code_service, 
        paper.iso_format `paper format`, concat(paper.thickness, ' mm')AS `paper thickness`, paper.covering, fonts.name_font, fonts.size `Font size`
	from my.services, my.paper, my.fonts
	where (fk_service_paper = idPaper) AND (fk_service_fonts = idFonts) AND paper.covering = 'matt' AND fonts.size >8;
*/

-- Show detail data about paper
/*
use my;
	select idPaper `ID`, name_paper, iso_format, 
    concat(paper.height, ' см') `paper height`,
    concat(paper.width, ' см')`paper width`,
    concat(B.brighnessLvl, ' гр/м') `Добавок отбеливания`,
    concat(D.density_lvl, ' pp/м') `Добавок отбеливания`
    from paper, paper_brightness B, paper_density D
    where (fk_paper_to_bright = B.idPaper_brightness) and (fk_paper_to_bright = D.id_density);
*/

-- show detail new orders
/*
use my;
	select 
    id_order `ID`,
    order_status.name_status,
    order_start `Create date`,
    total_price `Order Price`,
    services.name_service,
    `user`.nameUser,
    `user`.snameUser,
    `user`.phoneNumb
from order_services, `order`, services, order_status, `user`
where (fk_order_id = `order`.`id_order`) 
and (fk_service_id = services.idSerivces) 
and (`order`.fk_order_to_stat =  id_order_status) and (fk_order_to_stat = 1)
and (`order`.fk_order_user = `user`.idUser);
*/
