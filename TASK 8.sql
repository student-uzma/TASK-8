use bankemp;
select * from customer;

-- Create Procedure with single parameter
DELIMITER $$
create procedure ALL_records()
begin
select customer_id,first_name
from customer
where address_id > 6;
end $$
DELIMITER ;

-- Execute the procedure
call all_records;

-- Creating function with multiple parameter
DELIMITER $$
create procedure ALL_records2()
begin
select customer_id,first_name,last_name
from customer
where address_id > 6 and customer_id > 3;
end $$
DELIMITER ;

-- Executing procedure
call All_records2();

-- Creating function
delimiter //
create function get_amount_func(amount INT)
returns varchar(50)
deterministic
begin
declare comment varchar(30);
if amount <=70 then
 set comment ='Not eligible';
 else
 set comment = 'eligible';
 end if;
 return comment;
 end //
 delimiter ;
 
 -- calling functiont get_amount;
 select bankemp.get_amount_func(50);
 
 