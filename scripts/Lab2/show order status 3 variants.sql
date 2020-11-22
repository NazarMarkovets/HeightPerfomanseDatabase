-- var 1
/*
use inno;
SELECT 
	o.id, o.order_start,
    o.total_price, o.details,
    o.order_done,
CASE
	when o.fk_order_to_stat = 1 then 'New'
	when o.fk_order_to_stat = 2 then 'Applied'
	when o.fk_order_to_stat = 3 then 'Canseled'
	when o.fk_order_to_stat = 4 then 'Done'
END as `Order status`
    FROM inno.order o;
*/


-- var 2

use inno;
SELECT 
	o.id,
    o.order_start,
    o.total_price,
    o.details,
    o.order_done,
    (select s.`name` from `status` s where s.id = o.fk_order_to_stat) `order status`
from `order` o;


