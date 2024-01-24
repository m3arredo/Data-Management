sqlite3

CREATE TABLE Flights(fid int, month_id int references Months, day_of_month int, 
                    day_of_week_id int references Weekdays, carrier_id varchar(7) references Carriers,
                    flight_num int,origin_city varchar(34),origin_state varchar(47),dest_city varchar(34),dest_state varchar(46), 
                    departure_delay int,taxi_out int, arrival_delay int,canceled int,actual_time int, distance int,capacity int,price int,primary key(fid));

CREATE TABLE Carriers(cid varchar(7) primary key, name varchar(83));
CREATE TABLE Months(mid int primary key, month varchar(9));
CREATE TABLE Weekdays(did int primary key, day_of_week varchar(9));
PRAGMA foreign_keys=ON ;

.mode csv

.import carriers.csv Carriers 
.import months.csv Months 
.import weekdays.csv Weekdays 
.import flights-small.csv Flights 

2.1
SELECT c.name as name, SUM(f.departure_delay) as delay 
    FROM Flights as f, Carriers as c
    WHERE f.carrier_id=c.cid
    GROUP BY c.name;

2.2
SELECT SUM(f.capacity) as totalcapacity 
    FROM Flights as f, Months as m
    WHERE f.month_id = m.mid
        AND ((f.origin_city = "San Diego CA" OR f.dest_city = "San Francisco CA")
            OR (f.origin_city = "San Francisco CA" OR f.dest_city = "San Diego CA"))
    AND m.month = "July"
            AND f.day_of_month = 1 ; 

            #output = 24559

2.3
SELECT c.name as name, ROUND(AVG(f.canceled) *100, 2) as percent 
    FROM Flights as f , Carriers as c
    WHERE f.carrier_id=c.cid AND f.origin_city = "San Diego CA" 
    GROUP BY c.name
    HAVING percent > 1
    ORDER BY percent ASC ;

2.4 
SELECT DISTINCT c.name as name, count(*) as flightcount
    FROM Flights as f, Carriers as c, Months as m 
    WHERE f.carrier_id=c.cid AND f.origin_state= "California"
    GROUP BY c.name, m.month
    HAVING count(*) > 5000 ; 