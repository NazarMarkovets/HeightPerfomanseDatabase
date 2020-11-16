update mu.fonts SET fontsDATA = str_to_date(fontsDATA, "%m/%d/%Y");
update mu.macket_to_print SET macketDATA = str_to_date(macketDATA, "%m/%d/%Y");
update mu.order SET order_start = str_to_date(order_start, "%m/%d/%Y");
update mu.order SET order_done = str_to_date(order_done, "%m/%d/%Y");
update mu.paper SET paperDATE = str_to_date(paperDATE, "%m/%d/%Y");
update mu.services SET serviceDATE = str_to_date(serviceDATE, "%m/%d/%Y");
update mu.user SET registerDate = str_to_date(registerDate, "%m/%d/%Y");

update my.fonts SET fontsDATA = str_to_date(fontsDATA, "%m/%d/%Y");
update my.macket_to_print SET macketDATA = str_to_date(macketDATA, "%m/%d/%Y");
update my.order SET order_start = str_to_date(order_start, "%m/%d/%Y");
update my.order SET order_done = str_to_date(order_done, "%m/%d/%Y");
update my.paper SET paperDATE = str_to_date(paperDATE, "%m/%d/%Y");
update my.services SET serviceDATE = str_to_date(serviceDATE, "%m/%d/%Y");
update my.user SET registerDate = str_to_date(registerDate, "%m/%d/%Y");