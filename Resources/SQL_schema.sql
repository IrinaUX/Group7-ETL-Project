drop table domestic_revenue;

-- Create table for wiki data to be loaded into
CREATE TABLE domestic_revenue (
id serial primary key,
gross BigInt,
name text
)

select * from domestic_revenue;

drop table international_revenue;
select * from international_revenue;

-- Join two tables on name column
select * from domestic_revenue 
join international
on (domestic_revenue.name = international_revenue.name);

-- Create total_revenue table from joining domestic and international revenues
create table total_revenue as
select * from domestic_revenue
outer join international_revenue 
on (international.name = domestic.name);

-- Create total_revenue table from joining domestic_revenue_v2 and international_v2 revenues
drop table combined_revenue;

create table combined_revenue as
select * from domestic_revenue 
full outer join international_revenue 
on domestic_revenue.name_domestic = international_revenue.name_international;
-- order by international_revenue_usd desc;

select * from international_revenue;

select * from combined_revenue;

select name_international, international_revenue_usd, director 
from combined_revenue;