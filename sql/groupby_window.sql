CREATE SCHEMA demo;


CREATE TABLE demo.pop_can
(
    year double precision,
    month double precision,
    region text COLLATE pg_catalog."default",
    population integer
);


INSERT INTO demo.pop_can(
	year, month, region, population)
	VALUES
	(2019, 1, 'Newfoundland and Labrador',524883),
	(2019, 1, 'Prince Edward Island',155244),
	(2019, 1, 'Nova Scotia',963890),
	(2019, 1, 'New Brunswick',772748),
	(2019, 1, 'Quebec',8446906),
	(2019, 1, 'Ontario',14428712),
	(2019, 1, 'Manitoba',1361632),
	(2019, 1, 'Saskatchewan',1168461),
	(2019, 1, 'Alberta',4330698),
	(2019, 1, 'British Columbia',5046576),
	(2019, 1, 'Yukon',40947),
	(2019, 1, 'Northwest Territories',45194),
	(2019, 1, 'Nunavut',38348),
	(2019, 4, 'Newfoundland and Labrador',524126),
	(2019, 4, 'Prince Edward Island',155833),
	(2019, 4, 'Nova Scotia',965287),
	(2019, 4, 'New Brunswick',773805),
	(2019, 4, 'Quebec',8465271),
	(2019, 4, 'Ontario',14467162),
	(2019, 4, 'Manitoba',1364223),
	(2019, 4, 'Saskatchewan',1169286),
	(2019, 4, 'Alberta',4343951),
	(2019, 4, 'British Columbia',5063527),
	(2019, 4, 'Yukon',41040),
	(2019, 4, 'Northwest Territories',45118),
	(2019, 4, 'Nunavut',38526),
	(2019, 7, 'Newfoundland and Labrador',523476),
	(2019, 7, 'Prince Edward Island',157262),
	(2019, 7, 'Nova Scotia',969747),
	(2019, 7, 'New Brunswick',776868),
	(2019, 7, 'Quebec',8501703),
	(2019, 7, 'Ontario',14544718),
	(2019, 7, 'Manitoba',1369540),
	(2019, 7, 'Saskatchewan',1172302),
	(2019, 7, 'Alberta',4361694),
	(2019, 7, 'British Columbia',5090955),
	(2019, 7, 'Yukon',41477),
	(2019, 7, 'Northwest Territories',45028),
	(2019, 7, 'Nunavut',38614),
	(2019, 10, 'Newfoundland and Labrador',524137),
	(2019, 10, 'Prince Edward Island',158334),
	(2019, 10, 'Nova Scotia',975231),
	(2019, 10, 'New Brunswick',780154),
	(2019, 10, 'Quebec',8540429),
	(2019, 10, 'Ontario',14637880),
	(2019, 10, 'Manitoba',1373574),
	(2019, 10, 'Saskatchewan',1176272),
	(2019, 10, 'Alberta',4384968),
	(2019, 10, 'British Columbia',5125659),
	(2019, 10, 'Yukon',41668),
	(2019, 10, 'Northwest Territories',45100),
	(2019, 10, 'Nunavut',38637),
	(2020, 1, 'Newfoundland and Labrador',523631),
	(2020, 1, 'Prince Edward Island',158629),
	(2020, 1, 'Nova Scotia',975898),
	(2020, 1, 'New Brunswick',780040),
	(2020, 1, 'Quebec',8556650),
	(2020, 1, 'Ontario',14689075),
	(2020, 1, 'Manitoba',1377004),
	(2020, 1, 'Saskatchewan',1179154),
	(2020, 1, 'Alberta',4402045),
	(2020, 1, 'British Columbia',5131575),
	(2020, 1, 'Yukon',41731),
	(2020, 1, 'Northwest Territories',45119),
	(2020, 1, 'Nunavut',38726),
	(2020, 4, 'Newfoundland and Labrador',522994),
	(2020, 4, 'Prince Edward Island',159249),
	(2020, 4, 'Nova Scotia',977043),
	(2020, 4, 'New Brunswick',781024),
	(2020, 4, 'Quebec',8572054),
	(2020, 4, 'Ontario',14723497),
	(2020, 4, 'Manitoba',1378818),
	(2020, 4, 'Saskatchewan',1179618),
	(2020, 4, 'Alberta',4417006),
	(2020, 4, 'British Columbia',5142404),
	(2020, 4, 'Yukon',41980),
	(2020, 4, 'Northwest Territories',45201),
	(2020, 4, 'Nunavut',38966),
	(2020, 7, 'Newfoundland and Labrador',522103),
	(2020, 7, 'Prince Edward Island',159625),
	(2020, 7, 'Nova Scotia',979351),
	(2020, 7, 'New Brunswick',781476),
	(2020, 7, 'Quebec',8574571),
	(2020, 7, 'Ontario',14734014),
	(2020, 7, 'Manitoba',1379263),
	(2020, 7, 'Saskatchewan',1178681),
	(2020, 7, 'Alberta',4421876),
	(2020, 7, 'British Columbia',5147712),
	(2020, 7, 'Yukon',42052),
	(2020, 7, 'Northwest Territories',45161),
	(2020, 7, 'Nunavut',39353)
	


select * from demo.pop_can LIMIT 10;

select year, month, sum(population) as population
from demo.pop_can
group by year, month;

select *,
sum(population) as country_pop OVER(PARTITION BY year, month) as total_quarter_pop
from demo.pop_can;

select year, month, sum(population) as population, 
    count(*) over() as window_test 
	from demo.pop_can
group by year, month;

select year, month, sum(population) as population, count(*) over(PARTITION BY year) as window_test 
from demo.pop_can
group by year, month;

select year, month, sum(population) as population, 
    sum(population) over(PARTITION BY year) as window_test 
from demo.pop_can
group by year, month;

select year, month, sum(population) as population, 
    max(sum(population)) over(PARTITION BY year) as window_test
from demo.pop_can
group by year, month;