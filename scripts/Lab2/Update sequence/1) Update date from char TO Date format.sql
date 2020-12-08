update my.fonts SET fonts_DATE = str_to_date(fonts_DATE, "%m/%d/%Y");
update my.macket_to_print SET macket_DATE = str_to_date(macket_DATE, "%m/%d/%Y");
update my.order SET order_start = str_to_date(order_start, "%m/%d/%Y");
update my.order SET order_done = str_to_date(order_done, "%m/%d/%Y");
update my.paper SET paper_DATE = str_to_date(paper_DATE, "%m/%d/%Y");
update my.services SET service_date = str_to_date(service_date, "%m/%d/%Y");
update my.user SET registerDate = str_to_date(registerDate, "%m/%d/%Y");

update inno.fonts SET fonts_DATE = str_to_date(fonts_DATE, "%m/%d/%Y");
update inno.macket_to_print SET macket_DATE = str_to_date(macket_DATE, "%m/%d/%Y");
update inno.order SET order_start = str_to_date(order_start, "%m/%d/%Y");
update inno.order SET order_done = str_to_date(order_done, "%m/%d/%Y");
update inno.paper SET paper_DATE = str_to_date(paper_DATE, "%m/%d/%Y");
update inno.services SET service_date = str_to_date(service_date, "%m/%d/%Y");
update inno.user SET registerDate = str_to_date(registerDate, "%m/%d/%Y");