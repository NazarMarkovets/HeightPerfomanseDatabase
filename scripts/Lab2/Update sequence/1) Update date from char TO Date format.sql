update my.fonts SET fontsDATE = str_to_date(fontsDATE, "%m/%d/%Y");
update my.macket_to_print SET macketDATE = str_to_date(macketDATE, "%m/%d/%Y");
update my.order SET order_start = str_to_date(order_start, "%m/%d/%Y");
update my.order SET order_done = str_to_date(order_done, "%m/%d/%Y");
update my.paper SET paperDATE = str_to_date(paperDATE, "%m/%d/%Y");
update my.services SET serviceDATE = str_to_date(serviceDATE, "%m/%d/%Y");
update my.user SET registerDate = str_to_date(registerDate, "%m/%d/%Y");

update inno.fonts SET fontsDATE = str_to_date(fontsDATE, "%m/%d/%Y");
update inno.macket_to_print SET macketDATE = str_to_date(macketDATE, "%m/%d/%Y");
update inno.order SET order_start = str_to_date(order_start, "%m/%d/%Y");
update inno.order SET order_done = str_to_date(order_done, "%m/%d/%Y");
update inno.paper SET paperDATE = str_to_date(paperDATE, "%m/%d/%Y");
update inno.services SET serviceDATE = str_to_date(serviceDATE, "%m/%d/%Y");
update inno.user SET registerDate = str_to_date(registerDate, "%m/%d/%Y");