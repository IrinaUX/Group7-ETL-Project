drop table domestic_revenue;

-- Create table for wiki data to be loaded into
CREATE TABLE domestic_revenue (
id serial primary key,
gross BigInt,
name text
)

select * from domestic_revenue;

drop table international;
select * from international;

-- Join two tables on name column
select * from domestic_revenue 
join international 
on (domestic_revenue.name = international.name);

-- Create total_revenue table from joining domestic and international revenues
create table total_revenue as
select * from domestic_revenue 
outer join international 
on (international.name = domestic.name);

drop table test;
CREATE TABLE test AS
SELECT     international.ww_gross, international.name 
FROM       international
LEFT JOIN  domestic_revenue *
ON         international.name = domestic_revenue.name;
select * from test;

-- CREATE TABLE merged AS
-- SELECT     international.name, international.name  
-- FROM       international
-- LEFT JOIN  domestic_revenue
-- ON         domestic_revenue.name = international.name;
