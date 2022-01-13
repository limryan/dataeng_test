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
    serial_number   text not null references Cars(serial_number)
);

