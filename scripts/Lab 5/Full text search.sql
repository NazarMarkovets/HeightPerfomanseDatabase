-- SELECT order_id, order_start,order_total_price, order_details,
-- match(`order_details`)
-- against ('0PKLULY5' ) as coin
-- FROM my.order
-- where match (`order_details`)
-- against ('0PKLULY5' );

-- SELECT order_id, order_start,order_total_price, order_details,
-- match(`order_details`)
-- against ('0PKLULY5' IN BOOLEAN MODE) as coin
-- FROM my.order
-- where match (`order_details`)
-- against ('0PKLULY5' IN BOOLEAN MODE);


SELECT order_id, order_start,order_total_price, order_details,
match(`order_details`)
against ('0PKLULY5' WITH QUERY EXPANSION) as coin
FROM my.order
where match (`order_details`)
against ('0PKLULY5' WITH QUERY EXPANSION);