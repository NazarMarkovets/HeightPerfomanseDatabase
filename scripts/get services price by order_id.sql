select sum(service_price)
	from inno.services
	join order_services on fk_service_id = service_id
    join `order` on order_id = fk_order_id
    where order_id = 1
	group by fk_order_id;