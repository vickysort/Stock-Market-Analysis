-- Stock Market Analysis

-- Selecting the database Assignment

USE Assignment;

-- Creating table bajaj1 containing the date, close price, 20 Day MA and 50 Day MA with Date as Primary Key

create table bajaj1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM Assignment.`bajaj auto`;

-- Creating table eicher1 containing the date, close price, 20 Day MA and 50 Day MA with Date as Primary Key

create table eicher1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM Assignment.`eicher motors`;

-- Creating table hero1 containing the date, close price, 20 Day MA and 50 Day MA with Date as Primary Key

create table hero1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM Assignment.`hero motocorp`;

-- Creating table infosys1 containing the date, close price, 20 Day MA and 50 Day MA with Date as Primary Key

create table infosys1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM Assignment.`infosys`;

-- Creating table tcs1 containing the date, close price, 20 Day MA and 50 Day MA with Date as Primary Key

create table tcs1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM Assignment.`tcs`;

-- Creating table tvs1 containing the date, close price, 20 Day MA and 50 Day MA with Date as Primary Key

create table tvs1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM Assignment.`tvs motors`;

-- Creating master_table containing the date and close price of all the six stocks

create table master_table as 

select b.date as `Date`, 
b.`Close Price` as `Bajaj`, 
tc.`Close Price` as `TCS`,
tv.`Close Price` as `TVS`,
i.`Close Price` as `Infosys`,
e.`Close Price` as `Eicher`,
h.`Close Price` as `Hero`

from bajaj1 b 

inner join tcs1 tc on tc.date = b.date
inner join tvs1 tv on tv.date = tc.date
inner join infosys1 i on i.date = tv.date
inner join eicher1 e on e.date = i.date
inner join hero1 h on h.date = e.date;

-- Using bajaj1 create bajaj2 to generate buy and sell signal in column Signal

create table bajaj2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.bajaj1;

-- Using eicher1 create eicher2 to generate buy and sell signal in column Signal

create table eicher2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.eicher1;

-- Using hero1 create hero2 to generate buy and sell signal in column Signal

create table hero2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.hero1;

-- Using infosys1 create infosys2 to generate buy and sell signal in column Signal

create table infosys2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.infosys1;

-- Using tcs1 create tcs2 to generate buy and sell signal in column Signal

create table tcs2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.tcs1;

-- Using tvs1 create tvs2 to generate buy and sell signal in column Signal

create table tvs2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
		WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.tvs1;

-- Creating a User defined function signalForTheDay that takes the date as input 
-- and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock

DROP function IF EXISTS Assignment.signalForTheDay;

delimiter $$
create function signalForTheDay ( given_date varchar(10) )
returns varchar(4)
deterministic
begin
declare signal_value varchar(4);
select `Signal` into signal_value from bajaj2 where date=STR_TO_DATE(given_date, "%Y-%m-%d");
return signal_value;
end$$ 
delimiter ;

-- Getting the BUY/SELL/HOLD Signal for particular dates

select signalForTheDay('2015-05-18') as `Signal`; -- BUY
select signalForTheDay('2015-05-21') as `Signal`; -- HOLD
select signalForTheDay('2015-08-24') as `Signal`; -- SELL
select signalForTheDay('2015-10-19') as `Signal`; -- BUY
select signalForTheDay('2015-12-11') as `Signal`; -- SELL
