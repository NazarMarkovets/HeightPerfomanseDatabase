delimiter $$
create procedure `get_paper_covering`()
begin
	declare v_paper_id int;
    declare v_paper_name varchar(30);
    declare v_covering varchar(30);
    declare isfinished integer default 0;
    declare c1 cursor for Select paper_id, paper_name,fk_paper_covering from inno.paper;
    declare continue handler for NOT FOUND set isfinished = 1;
    open c1;
    get_covering: loop
		fetch c1 into v_paper_id, v_paper_name, fk_paper_covering;
        if isfinished = 1 then leave get_covering;
        end if;
        if fk_paper_covering = 1 then (select covering_name from inno.paper_covering where fk_paper_covering) into v_covering;
        elseif fk_paper_covering = 2 then (select covering_name from inno.paper_covering where covering_id = fk_paper_covering) into v_covering;
        elseif fk_paper_covering = 3 then (select covering_name from inno.paper_covering where covering_id = fk_paper_covering) into v_covering;
        elseif fk_paper_covering = 4 then (select covering_name from inno.paper_covering where covering_id = fk_paper_covering) into v_covering;
        elseif fk_paper_covering = 5 then (select covering_name from inno.paper_covering where covering_id = fk_paper_covering) into v_covering;
        end if;
        select concat(v_paper_id, v_paper_name, v_covering);
	END LOOP get_covering;
    close c1;
end $$