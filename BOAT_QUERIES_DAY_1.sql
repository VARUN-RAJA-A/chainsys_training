------------------------TABLE-CREATIONS-----------------

Create 3 tables sailors, boats and reserves
 
create table sailors
(
 sid int constraint pk_sid primary key,
 sname varchar(20),
 rating int,
 age int
);

create table boats
(
 bid int constraint pk_bid primary key,
 bname varchar(20),
 color varchar(20)
)
 
create table reserves
(
sid int constraint fk_sid foreign key(sid) references sailors(sid),
bid int constraint fk_bid foreign key(bid) references boats(bid),
day date
)
 
insert into sailors values(22,'dustin',7,45)
insert into sailors values(29,'brutus',1,39)
insert into sailors values(31,'lubber',9,55)
insert into sailors values(32,'andy',8,25)
insert into sailors values(58,'Rusty',10,35)
 
insert into boats values(101,'interlake','blue')
insert into boats values(102,'interlake','red')
insert into boats values(103,'clipper','green')
insert into boats values(104,'marine','red')
 
insert into reserves values(22,101,'1/1/2004')
insert into reserves values(22,102,'1/1/2004')
insert into reserves values(22,103,'1/2/2004')
insert into reserves values(31,103,'5/5/2005')
insert into reserves values(32,104,'7/4/2005');
 
 ---------------------------------------------------------------------------
 
-------------------------------QUESTIONS----------------------------------------------------------------------

--1)Write a query to find the name of the sailors who reserved red boat

select * from sailors_2605;
SELECT * FROM BOATS_2605;
SELECT * FROM RESERVES_2605;
select s.sname from sailors_2605 s where s.sid in
(select r.sid from reserves_2605 r where  r.bid in
(select b.bid from boats_2605 b where color='red'));

------------------

--2) Write a query to find the names of sailors who have reserved a red and a
--green boat.

select s.sname from sailors_2605 s where s.sid in
(select r.sid from reserves_2605 r where r.bid in
(select b.bid from boats_2605 b where b.color='red' or b.color='green'));

----------------

--3) Write a query to find the name of sailor who reserved 1 boat

select sname from sailors_2605 S ,RESERVES_2605 R WHERE S.SID=R.SID GROUP BY SNAME;

-------------

--4) Write a query to find the sids of all sailors who have reserved red boats
--but not green boats.

SELECT S.SID FROM SAILORS_2605 S,RESERVES_2605 B,BOATS_2605 C 
WHERE S.SID =B.SID AND B.BID=C.BID 
AND C.COLOR='red';

-------------------

--5) Write a query to find the sailors with the highest rating

SELECT A.SNAME,RATING FROM SAILORS_2605 A WHERE RATING=(SELECT MAX(RATING)FROM SAILORS_2605);

-------------

--6) Write a query to find  the number of sailors elligible to vote

SELECT COUNT(SNAME) FROM SAILORS_2605 WHERE age>18;

---------------

--7) Write a query to count different sailors name

SELECT SNAME,COUNT(SNAME) FROM SAILORS_2605 GROUP BY SNAME;

---------------

--8) Write a query to find  the oldest sailor

SELECT SNAME FROM SAILORS_2605 WHERE AGE=(SELECT MAX(AGE) FROM SAILORS_2605);

----------------

--9)Write a query to find name as SAILERNAME,Rating,Age,bname as BOATNAME,Color,Day.

SELECT SNAME,RATING,BNAME AS BOATNAME,COLOR,DAY
FROM SAILORS_2605 A,RESERVES_2605 B,BOATS_2605 C
WHERE a.sid=b.sid AND B.BID=C.BID;

--------------

--10)Write a query to display the sailor name  starts with letter a and b. 

SELECT SNAME FROM SAILORS_2605 WHERE sname LIKE'a%' OR SNAME LIKE 'b%';

---------------

--11)Find the names of the Sailors who have reserved at least one boat.

Select DISTINCT(SNAME) FROM SAILORS_2605 A,RESERVES_2605 B,boats_2605 C 
WHERE A.SID=B.SID AND b.bid=C.BID;

------------------

--12)Compute increments for the ratings of persons who have sailed two different boats on the same day.



---------------

--13)Find the ages of sailors whose name begins and ends with B and has at least 3 characters.

SELECT AGE FROM SAILORS_2605  WHERE SNAME LIKE'b___%'; 

----------------------