-- Доделать

create index `age` on `my`.`user` (`age`);

create index `total_price` on `my`.`order` (`order_total_price`);

create index `service_code` on `inno`.`services` (`service_code` (10));

create index `paper_color` on `my`.`paper` (`fk_paper_color`);

create unique index `email` on `my`.`user` (`email`);

create unique index `phone` on `my`.`user` (`phone`);