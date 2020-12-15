CREATE DEFINER=`root`@`localhost` PROCEDURE `get_paper_covering`()
BEGIN
	declare v_paper_id int;
    declare v_fk_paper_covering int;
    declare v_paper_name varchar(30);
    declare isfinished integer default 0;
    declare c1 cursor for Select paper_id, paper_name, fk_paper_covering from inno.paper limit 5;
    declare continue handler for NOT FOUND set isfinished = 1;
    open c1;
    get_covering: loop
		fetch c1 into v_paper_id, v_paper_name, v_fk_paper_covering;
        if isfinished = 1 then leave get_covering;
        end if;
        if v_fk_paper_covering = 1 then select concat(v_paper_id,' ', v_paper_name, ' none') as `paperID || paper name || covering`;
        elseif v_fk_paper_covering = 2 then select concat(v_paper_id,' ', v_paper_name, ' matt')as `paperID || paper name || covering`;
        elseif v_fk_paper_covering = 3 then select concat(v_paper_id,' ', v_paper_name, ' smooth')as `paperID || paper name || covering`;
        elseif v_fk_paper_covering = 4 then select concat(v_paper_id,' ', v_paper_name, ' rought')as `paperID || paper name || covering`;
        elseif v_fk_paper_covering = 5 then select concat(v_paper_id,' ', v_paper_name, ' glossy')as `paperID || paper name || covering`;
        end if;
        
	END LOOP get_covering;
    close c1;
END