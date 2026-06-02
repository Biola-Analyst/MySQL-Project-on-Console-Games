drop database console;
set sql_safe_updates=0;
Create database `Console`;
use console;

select Discontinued, str_to_date(Discontinued, '%Y-%m-%d') as `converedted date` from `p9-consoledates`;

alter table `p9-consoledates`
add column `New Discontiund Date` date;

update `p9-consoledates`
set `New Discontiund Date` = str_to_date(Discontinued, '%Y-%m-%d')
where Discontinued is not NULL
and Discontinued != "";

alter table `p9-consoledates`
add column `New FirstRetailAvailability` date;

update `p9-consoledates`
set `New FirstRetailAvailability` = str_to_date(FirstRetailAvailability, '%Y-%m-%d')
where FirstRetailAvailability is not NULL
and FirstRetailAvailability != "";

select count(distinct Platform) from `p9-consoledates`;
select count(distinct Platform) from `p9-consolegames`;


alter table `p9-consoledates`
modify column Platform varchar(30);

alter table `p9-consoledates`
add primary key(Platform);

alter table `p9-consolegames`
modify column Platform varchar(30);

set foreign_key_checks = 0;

alter table `p9-consolegames`
add constraint FK_Consoleplatform
foreign key(Platform) references `p9-consoledates`(Platform);

#### 1 % of Global Sales made in North America. ####
select round((sum(NA_Sales)/(sum(NA_Sales)+sum(EU_Sales)+sum(JP_Sales)+sum(Other_Sales)))*100,2) as `Global sales`
from `p9-consolegames`;

#### 2 List console games by platform (A–Z) and release year (newest first). ####
select Name, (ifnull(nullif(Platform, ""),'Not Available')) as `Organized platform`, Year
from `p9-consolegames`
order by `Organized platform` asc, Year desc;

#### 3 Show first four letters of each publisher’s name.####
select Name, left(Publisher, 4)
from `p9-consolegames`;


### 4 Display platforms released near Black Friday or Christmas.###
select Platform, FirstRetailAvailability
from `p9-consoledates`
where month(`New FirstRetailAvailability`) = 11
or (month(`New FirstRetailAvailability`) = 12
and day(`New FirstRetailAvailability`) < 19);

### 5 Sort platforms by longevity (shortest to longest)###
select Platform, datediff(`New Discontiund Date`, `New FirstRetailAvailability`) as Longevity	
from `p9-consoledates`
order by Longevity asc;

### 6 Convert Game_Year column to another data type. ###
describe `p9-consolegames`;
alter table `p9-consolegames`
modify column Year varchar(20);
describe `p9-consolegames`;

### 7 Suggest ways to handle missing data. ###
### Recommendations for dealing with missing data

# Step 1 — Identify missing values
select * from `p9-consoledates`;

# Step 2 — Count missing values
select count(Discontinued), count(Comment) from `p9-consoledates`
where (Discontinued = '' or Discontinued = " ")
and (Comment = '' or Discontinued = " ");


## recommendation 1: delete empty fields
delete from `p9-consoledates`
where (Discontinued = '' or Discontinued = " ")
and (Comment = '' or Comment = " ");

## recommendation 2: replace empty field in date column to Null
select nullif(trim(Discontinued), "")
from `p9-consoledates`;

update `p9-consoledates`
set Discontinued = nullif(trim(Discontinued), "")
where trim(Discontinued) = '';

## recommendation 3: replace empty field in comment column to "Not Available"
select ifnull(nullif(trim(Comment),''), "Not Availabe")
from `p9-consoledates`;

update `p9-consoledates`
set Comment = ifnull(nullif(trim(Comment),''), "Not Availabe")
where trim(Comment) = '';

##join all the tables###
select cg.Rank, cg.Name, cg.Platform, cg.Year, cg.Genre, Publisher, cg.NA_Sales, cg.EU_Sales, cg.JP_Sales, cg.Other_Sales, cd.`New FirstRetailAvailability` as `First Retail Availability`, cd.`New Discontiund Date` as `Discontiund Date`, cd.Comment, cd.UnitsSoldMillions
from `p9-consolegames` cg
left join `p9-consoledates` cd
on cg.Platform = cd.Platform;