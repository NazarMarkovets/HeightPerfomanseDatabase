-- select 10 the more important persons, register date is also important for company
/*
use my;
select idUser, nameUser,snameUser, age, R.nameStatus
from user U
join user_role R on U.fk_user_to_role = R.idStatusUser
ORDER by idStatusUser, U.History ASC
limit 10;
*/

-- select top 10 the largest files from users
/*
use my;
select 
	idMacket_to_Print `ID`,
	concat(M.sizebyte,' MB') as Size,
    concat(M.height,' pxls') as height,
    concat(M.width,' pxls') as width,
    nameFormat
from macket_to_print M
join format_type F on M.fk_macket_to_formatType = F.idFormatType
ORDER by SizeByte desc
limit 10;

*/

-- Показать заказы отсортированые по цене со статусом "новый" включая название услуги и данные про макеты пользователей
use my;
select 
	OM.id_order,
    O.order_start, O.total_price, OS.name_status, S.name_service,
    mp.`File`,
    concat(mp.height,' pxls') as height,
    concat(mp.width,' pxls') as width,
    concat(mp.sizebyte,' MB') as Size

from order_macket OM
	join `order` O using(id_order)
    join macket_to_print mp on mp.idMacket_to_Print = OM.id_macket
    join order_status OS On OS.id_order_status = O.fk_order_to_stat
	join order_services card on card.fk_order_id = O.id_order 
    join services S on S.idSerivces = card.fk_service_id
where OS.name_status = 'new'
Order by total_price desc;


