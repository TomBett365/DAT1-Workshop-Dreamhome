.open dreamhome2.sqlite
.mode column

PRAGMA foreign_key = ON;

DROP TABLE IF EXISTS branch;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS privateowner;
DROP TABLE IF EXISTS propertyforrent;
DROP TABLE IF EXISTS registration;
DROP TABLE IF EXISTS staff;
--DROP TABLE IF EXISTS viewing

CREATE TABLE branch(
    branchno    TEXT    VARCHAR(10)     CHECK(length(branchno) = 4)     PRIMARY KEY,
    street      TEXT    VARCHAR(20),
    city        TEXT    VARCHAR(15),
    postcode    TEXT    VARCHAR(10)     CHECK(length(postcode) <= 8)
);

CREATE TABLE staff(
    staffno     TEXT    VARCHAR(5)      CHECK(length(staffno) = 5)      PRIMARY KEY,
    fname       TEXT    VARCHAR(20),
    lname       TEXT    VARCHAR(10),
    position    TEXT    VARCHAR(15),
    sex         TEXT    VARCHAR(1)      CHECK(length(sex) = 1),
    dob         TEXT    VARCHAR(10)     CHECK(length(dob) = 10),
    salary      INTEGER INT(10),
    branchno    TEXT    VARCHAR(4)      CHECK(length(branchno) = 4),
    FOREIGN KEY(branchno) REFERENCES branch(branchno)
);

CREATE TABLE client(
    clientno    TEXT    VARCHAR(6)     CHECK(length(clientno) = 6)     PRIMARY KEY,
    fname       TEXT    VARCHAR(10),
    lname       TEXT    VARCHAR(15),
    telno       INTEGER INT(13)         CHECK(length(telno) = 13),
    preftype    TEXT    VARCHAR(10),
    maxrent     INTEGER INT(10),
    email       TEXT    VARCHAR(20)     CHECK(email LIKE '%@%')           
);

CREATE TABLE privateowner(
    ownerno     TEXT    VARCHAR(6)     CHECK(length(ownerno) = 6)       PRIMARY KEY,
    fname       TEXT    VARCHAR(10),  
    lname       TEXT    VARCHAR(15),
    address     TEXT    VARCHAR(20),
    telno       INTEGER INT(13)         CHECK(length(telno) = 13),
    email       TEXT    VARCHAR(20)     CHECK(email LIKE '%@%'),
    password    TEXT    VARCHAR(10)
);

CREATE TABLE propertyforrent(
    propertyno  TEXT    VARCHAR(10)     PRIMARY KEY,
    street      TEXT    VARCHAR(10),
    city        TEXT    VARCHAR(10),
    postcode    TEXT    VARCHAR(10)     CHECK(length(postcode) <= 8),
    type        TEXT    VARCHAR(10),
    rooms       TEXT    VARCHAR(10),
    rent        INT     INT(10),
    ownerno     TEXT    VARCHAR(6)      CHECK(length(ownerno) = 6),
    staffno     TEXT    VARCHAR(5)      CHECK(length(staffno) = 5),
    branchno    TEXT    VARCHAR(4)      CHECK(length(branchno) = 4),
    FOREIGN KEY(ownerno) REFERENCES privateowner(ownerno),
    FOREIGN KEY(staffno) REFERENCES staff(staffno),    
    FOREIGN KEY(branchno) REFERENCES branch(branchno)    
);

CREATE TABLE registration(
    reg_id      INTEGER     INT(2)      CHECK(length(clientno) = 6),
    clientno    TEXT        VARCHAR(6)  CHECK(length(clientno) = 6),
    branchno    TEXT        VARCHAR(4)  CHECK(length(branchno) = 4),
    staffno     TEXT        VARCHAR(5)  CHECK(length(staffno) = 5),
    datejoined  TEXT        VARCHAR(6)  CHECK(length(datejoined) = 10),
    FOREIGN KEY(clientno) REFERENCES client(clientno),
    FOREIGN KEY(branchno) REFERENCES branch(branchno),
    FOREIGN KEY(staffno) REFERENCES staff(staffno)
);


-- Branch data
INSERT INTO branch
(branchno, street, city, postcode)
VALUES
('B721', '22 Deer Rd'     , 'London'    , 'SW1 4EH'),
('B394', '16 Argyll St'   , 'Aberdeen'  , 'AB2 3SU'),
('B052', '163 Main St'    , 'Glasgow'   , 'G11 9QX'),
('B678', '32 Manse Rd'    , 'Bristol'   , 'BS99 1NZ'),
('B901', '56 Clover Dr'   , 'London'    , 'NW10 6EU'),
('B235', '123 Park Ave'   , 'Edinburgh' , 'EH1 3QR'),
('B467', '78 High St'     , 'Cardiff'   , 'CF10 1AA'),
('B189', '55 Seaside Rd'  , 'Brighton'  , 'BN1 1AA'),
('B843', '12 West End Ave', 'Manchester', 'M1 2BB'),
('B576', '33 Main St'     , 'Liverpool' , 'L1 2HJ');

-- Registration data
INSERT INTO registration (reg_id, clientno, branchno, staffno, datejoined) VALUES
(1, 'CL7623', 'B721', 'SAS37', '2013-01-02'),
(2, 'CL7623', 'B721', 'SAS37', '2012-04-11'),
(3, 'CL7623', 'B721', 'SAS37', '2011-11-16'),
(4, 'CL7623', 'B721', 'SAS37', '2012-03-07'),
(5, 'CL7623', 'B721', 'SAS37', '2013-02-20'),
(6, 'CL7623', 'B721', 'SAS37', '2013-05-11'),
(7, 'CL7623', 'B721', 'SAS37', '2013-03-15'),
(8, 'CL7623', 'B721', 'SAS37', '2013-01-09'),
(9, 'CL7623', 'B721', 'SAS37', '2013-04-02'),
(10, 'CL7623', 'B721', 'SAS37', '2013-02-11'),
(11, 'CL7623', 'B721', 'SAS37', '2013-05-10'),
(12, 'CL7623', 'B721', 'SAS37', '2013-06-07'),
(13, 'CL7623', 'B721', 'SAS37', '2013-07-15'),
(14, 'CL7623', 'B721', 'SAS37', '2013-08-20'),
(15, 'CL7623', 'B721', 'SAS37', '2013-08-22'),
(16, 'CL7623', 'B721', 'SAS37', '2013-09-01'),
(17, 'CL7623', 'B721', 'SAS37', '2013-09-05'),
(18, 'CL7623', 'B721', 'SAS37', '2013-09-10'),
(19, 'CL7623', 'B721', 'SAS37', '2013-09-12'),
(20, 'CL7623', 'B721', 'SAS37', '2013-09-15'),
(21, 'CL7623', 'B721', 'SAS37', '2013-09-20'),
(22, 'CL7623', 'B721', 'SAS37', '2013-09-22'),
(23, 'CL7623', 'B721', 'SAS37', '2013-09-25'),
(24, 'CL7623', 'B721', 'SAS37', '2013-09-28'),
(25, 'CL7623', 'B721', 'SAS37', '2013-10-01'),
(26, 'CL7623', 'B721', 'SAS37', '2013-10-03'),
(27, 'CL7623', 'B721', 'SAS37', '2013-10-05'),
(28, 'CL7623', 'B721', 'SAS37', '2013-10-08'),
(29, 'CL7623', 'B721', 'SAS37', '2013-10-10'),
(30, 'CL7623', 'B721', 'SAS37', '2013-10-12'),
(31, 'CL7623', 'B721', 'SAS37', '2013-10-15'),
(32, 'CL7623', 'B721', 'SAS37', '2013-10-18'),
(33, 'CL7623', 'B721', 'SAS37', '2013-10-20'),
(34, 'CL7623', 'B721', 'SAS37', '2013-10-22'),
(35, 'CL7623', 'B721', 'SAS37', '2013-10-25');

-- Property for Rent data
INSERT INTO propertyforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) VALUES
('PR1423', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'PO4621', 'SAS37', 'B721'),
('PR9478', '6 Argyll St', 'London', 'NW2', 'Flat', 4, 400, 'PO4621', 'SAS37', 'B721'),
('PR4567', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'PO4621', NULL, 'B721'),
('PR3689', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'PO4621', 'SAS37', 'B721'),
('PR2145', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600, 'PO4621', 'SAS37', 'B721'),
('PR1678', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'PO4621', 'SAS37', 'B721'),
('PR1589', '44 Elm St', 'Edinburgh', 'EH3 5FD', 'Flat', 2, 750, 'PO4621', 'SAS37', 'B721'),
('PR9512', '10 Broadway', 'Cardiff', 'CF24 3SG', 'House', 4, 950, 'PO4621', 'SAS37', 'B721'),
('PR5623', '3 Hillcrest', 'Brighton', 'BN1 3PQ', 'Flat', 1, 420, 'PO4621', NULL, 'B721'),
('PR3734', '1 Riverside', 'Manchester', 'M1 3HJ', 'Flat', 2, 600, 'PO4621', 'SAS37', 'B721'),
('PR2289', '9 Meadow Rd', 'Liverpool', 'L1 4RT', 'House', 3, 800, 'PO4621', 'SAS37', 'B721'),
('PR1534', '20 King St', 'Liverpool', 'L1 9DG', 'Flat', 3, 600, 'PO4621', 'SAS37', 'B721'),
('PR1645', '5 Queen St', 'Manchester', 'M3 1DU', 'House', 5, 1200, 'PO4621', 'SAS37', 'B721'),
('PR1756', '15 Princess St', 'Cardiff', 'CF24 1BY', 'Flat', 2, 700, 'PO4621', 'SAS37', 'B721'),
('PR1867', '33 Castle St', 'Bristol', 'BS1 4PQ', 'House', 4, 850, 'PO4621', 'SAS37', 'B721'),
('PR1978', '12 York Rd', 'Leeds', 'LS1 4AJ', 'Flat', 3, 650, 'PO4621', 'SAS37', 'B721'),
('PR2089', '45 Park Rd', 'Edinburgh', 'EH1 5BU', 'House', 5, 1100, 'PO4621', 'SAS37', 'B721'),
('PR2190', '29 Station St', 'Birmingham', 'B2 4RT', 'Flat', 2, 550, 'PO4621', 'SAS37', 'B721'),
('PR2212', '50 Grove Rd', 'Newcastle', 'NE1 4BP', 'House', 4, 900, 'PO4621', 'SAS37', 'B721'),
('PR2323', '80 Elm St', 'Brighton', 'BN1 2RT', 'Flat', 1, 450, 'PO4621', 'SAS37', 'B721'),
('PR2434', '60 Crescent Rd', 'Oxford', 'OX1 1LP', 'House', 5, 1200, 'PO4621', 'SAS37', 'B721'),
('PR2545', '18 Abbey Rd', 'Liverpool', 'L12 5BW', 'Flat', 3, 750, 'PO4621', 'SAS37', 'B721'),
('PR2656', '7 Market St', 'Manchester', 'M2 2FJ', 'House', 4, 950, 'PO4621', 'SAS37', 'B721'),
('PR2767', '9 Victoria St', 'Cardiff', 'CF11 6RG', 'Flat', 2, 650, 'PO4621', 'SAS37', 'B721'),
('PR2878', '22 George St', 'Bristol', 'BS2 0DH', 'House', 5, 1000, 'PO4621', 'SAS37', 'B721'),
('PR2989', '11 Church Lane', 'Manchester', 'M4 1NP', 'Flat', 2, 550, 'PO4621', 'SAS37', 'B721'),
('PR3090', '33 Rose Street', 'Glasgow', 'G1 2TU', 'House', 4, 850, 'PO4621', 'SAS37', 'B721'),
('PR3112', '7 Oakwood Drive', 'Birmingham', 'B1 1WW', 'Flat', 3, 700, 'PO4621', 'SAS37', 'B721'),
('PR3223', '19 Willow Road', 'Leeds', 'LS1 5XX', 'House', 5, 1100, 'PO4621', 'SAS37', 'B721'),
('PR3334', '26 Cedar Avenue', 'Bristol', 'BS1 6YY', 'Flat', 2, 600, 'PO4621', 'SAS37', 'B721'),
('PR3445', '42 Maple Street', 'Edinburgh', 'EH1 1ZZ', 'House', 4, 950, 'PO4621', 'SAS37', 'B721'),
('PR3556', '15 Birch Lane', 'Liverpool', 'L1 7AA', 'Flat', 1, 450, 'PO4621', 'SAS37', 'B721'),
('PR3667', '8 Pine Close', 'Cardiff', 'CF10 2BB', 'House', 3, 800, 'PO4621', 'SAS37', 'B721'),
('PR3778', '23 Elm Road', 'Newcastle', 'NE1 3CC', 'Flat', 2, 550, 'PO4621', 'SAS37', 'B721'),
('PR3889', '37 Sycamore Avenue', 'Brighton', 'BN1 4DD', 'House', 5, 1200, 'PO4621', 'SAS37', 'B721');