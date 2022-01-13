/* Create tables */
create table Customers (
    cid     serial  primary key,
    name    text    not null,
    phone   char(8) not null,
    check (phone ~ '^\d*$')
);

create table Salespersons (
    sid     serial  primary key,
    name    text    not null
);

create table Cars (
    serial_number   text    primary key,
    manufacturer    text    not null,
    model_name      text    not null,
    weight          numeric not null,
    price           money   not null
);

create table Transactions (
    tid             serial  primary key,
    sale_date       date    not null,
    sale_time       time    not null,
    cid             integer not null references Customers(cid),
    sid             integer not null references Salespersons(sid),
    serial_number   text    not null references Cars(serial_number)
);

/* Sample Data */

insert into Salespersons (name) values ('Anna Jakobsson');
insert into Salespersons (name) values ('Andrew Ness');
insert into Salespersons (name) values ('Alexa Laurenceau');
insert into Salespersons (name) values ('Anthony Jeanel');

insert into Customers (name, phone) values ('Carrie Dassindale','93679718');
insert into Customers (name, phone) values ('Cheng Couchman','96327241');
insert into Customers (name, phone) values ('Carissa Dorie','93917008');
insert into Customers (name, phone) values ('Charles Bassill','97683246');
insert into Customers (name, phone) values ('Callum Caddock','98313647');
insert into Customers (name, phone) values ('Caiyi Chen','97855336');

insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('2T2ZK1BA8BC043485', 'Honda', 'Accord', 875, 27000);
insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('1G1JD5SH1E4151009', 'Honda', 'Fit', 598, 14450);
insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('2D8HN44E09R548778', 'Toyota', 'Harrier', 1394, 36000);
insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('SAJWA0FS4FPU36769', 'Audi', 'Q3', 1183, 54800);
insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('1HGEJ8148WL151129', 'BMW', 'X5', 1324, 60100);
insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('1GKDM19WXPB549372', 'BMW', 'Z4', 812, 52000);
insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('JTEEP21A250130305', 'Volvo', 'S90', 927, 65700);
insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('1C6RD6GT5CS336323', 'Toyota', 'Camry', 1031, 43000);
insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('1HSHEAHN7TH313103', 'Volvo', 'XC60', 1343, 58000);
insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('JM1DE1KZ9D0179732', 'Audi', 'A4', 1283, 54580);
insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('5GAKRBKD5EJ249598', 'Toyota', 'Prius', 741, 34100);
insert into Cars (serial_number, manufacturer, model_name, weight, price) values 
    ('1GNFK36329R259855', 'BMW', 'i3', 659, 40900);

insert into Transactions (sale_date, sale_time, cid, sid, serial_number) values
    ('2021-12-09','13:00',1,2,'1G1JD5SH1E4151009');
insert into Transactions (sale_date, sale_time, cid, sid, serial_number) values
    ('2021-12-18','13:00',2,1,'SAJWA0FS4FPU36769');
insert into Transactions (sale_date, sale_time, cid, sid, serial_number) values
    ('2022-01-03','16:20',3,3,'2D8HN44E09R548778');
insert into Transactions (sale_date, sale_time, cid, sid, serial_number) values
    ('2022-01-04','09:40',3,4,'2T2ZK1BA8BC043485');
insert into Transactions (sale_date, sale_time, cid, sid, serial_number) values
    ('2022-01-05','11:10',4,1,'1HGEJ8148WL151129');
insert into Transactions (sale_date, sale_time, cid, sid, serial_number) values
    ('2022-01-05','15:50',5,1,'1GKDM19WXPB549372');
insert into Transactions (sale_date, sale_time, cid, sid, serial_number) values
    ('2022-01-07','15:50',6,4,'JTEEP21A250130305');
insert into Transactions (sale_date, sale_time, cid, sid, serial_number) values
    ('2022-01-10','12:30',1,1,'1C6RD6GT5CS336323');