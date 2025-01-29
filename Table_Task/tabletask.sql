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
    postcode    TEXT    VARCHAR(10)     CHECK(length(postcode) <= 7)
);

CREATE TABLE staff(
    staffno                                             TEXT    VARCHAR(5)      CHECK(length(staffno) = 5),
    fname                                               TEXT    VARCHAR(20),
    lname                                               TEXT    VARCHAR(10),
    position                                            TEXT    VARCHAR(15),
    sex                                                 TEXT    VARCHAR(1)      CHECK(length(sex) = 1),
    dob                                                 TEXT    VARCHAR(10)     CHECK(length(dob) = 10),
    salary                                              INTEGER INT(10),
    branchno                                            TEXT    VARCHAR(4),
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
    propertyno                                              TEXT    VARCHAR(10),
    street                                                  TEXT    VARCHAR(10),
    city                                                    TEXT    VARCHAR(10),
    postcode                                                TEXT    VARCHAR(10),
    type                                                    TEXT    VARCHAR(10),
    rooms                                                   TEXT    VARCHAR(10),
    rent                                                    INT     INT(10),
    ownerno                                                 TEXT    VARCHAR(6),
    staffno                                                 TEXT    VARCHAR(5),
    branchno                                                TEXT    VARCHAR(4),
    FOREIGN KEY(ownerno) REFERENCES privateowner(ownerno),
    FOREIGN KEY(staffno) REFERENCES staff(staffno),    
    FOREIGN KEY(branchno) REFERENCES branch(branchno)    
);

CREATE TABLE registration(
    reg_id                                              INTEGER     INT(2)      CHECK(length(clientno) = 6),
    clientno                                            TEXT        VARCHAR(6),
    branchno                                            TEXT        VARCHAR(4),
    staffno                                             TEXT        VARCHAR(5),
    FOREIGN KEY(clientno) REFERENCES client(clientno),
    FOREIGN KEY(branchno) REFERENCES branch(branchno),
    FOREIGN KEY(staffno) REFERENCES staff(staffno),
    datejoined                                          TEXT        VARCHAR(6)  CHECK(length(datejoined) = 10)
);



INSERT INTO branch
(branchno, street, city, postcode)
VALUES
('B721', '22 Deer Rd', 'London', 'SW1 4EH'),
('B052', '163 Main St', 'Glasgow', 'G11 9QX'),
('B678', '32 Manse Rd', 'Bristol', 'BS99 1NZ'),
('B901', '56 Clover Dr', 'London', 'NW10 6EU'),
('B235', '123 Park Ave', 'Edinburgh', 'EH1 3QR'),
('B467', '78 High St', 'Cardiff', 'CF10 1AA') ,
('B189', '55 Seaside Rd', 'Brighton', 'BN1 1AA'),
('B843', '12 West End Ave', 'Manchester', 'M1 2BB'),
('B576', '33 Main St', 'Liverpool', 'L1 2HJ');