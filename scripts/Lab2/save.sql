-- Показать номера заказов с найбольшим количеством услуг в нём
/*
use my;
select fk_order_id `Order number`, count(fk_service_id) as `Services in order` from order_services
group by fk_order_id
Order by `Services in order` desc
*/