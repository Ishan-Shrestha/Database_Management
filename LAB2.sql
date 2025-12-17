CREATE DATABASE LAB2

USE LAB2

-- Initialization of Tables
CREATE TABLE Employee(
    eid INT PRIMARY KEY,
    ename VARCHAR(50) NOT NULL,
    dateofemploy DATE DEFAULT '2010-01-01', 
    salary FLOAT
);

CREATE TABLE issues(
    IID INT PRIMARY KEY,
    NAME VARCHAR(25) NOT NULL,
    dateofissue DATE,
        FOREIGN KEY (IID)
        REFERENCES Employee(eid)
);

CREATE TABLE Booklist(
    isbn VARCHAR(20) PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    publication VARCHAR(50)
);

CREATE TABLE Book(
    bid VARCHAR(20) PRIMARY KEY,
    bname VARCHAR(50) NOT NULL,
    author VARCHAR(50),
    price INT CHECK(price<5000),
        FOREIGN KEY (bid)
        REFERENCES Booklist(isbn)
);

-- Insertion of Values
INSERT INTO Employee VALUES
(1, 'RAMESH', '2005-11-01', 20000.0),
(2, 'KAMAL','2007-12-01', 25000.1),
(3, 'HAMAL','2005-09-01', 8000.0),
(4, 'JAMAL', '2005-11-01',20000.11),
(5, 'BABAL','1998-11-01', 15000),
(6, 'KABAL','2005-11-01', 5000);

INSERT INTO issues(IID,NAME,dateofissue) VALUES
(1, 'ABC', '2005-11-12'),
(2, 'BCD','2007-12-11'),
(3, 'CDE','2005-12-11'),
(4, 'DEF', '2015-11-01'),
(5, 'EFG','2024-11-01'),
(6, 'FGH','2015-11-01')

INSERT INTO Booklist(isbn, name, publication) VALUES
('1235-1111-1211', 'Harry Potter', 'WHITEHAT'),
('1121-111-211', 'One Piece', 'EKTA'),
('1771-1003-111', 'Dune', 'HERITAGE'),
('1331-1003-1211', 'Naruto', 'HERITAGE'),
('1854-2432-11', 'ABCD', 'SUNRISE'),
('1255-1121-11', 'NNN', 'ENUM BOOKS');

INSERT INTO Book(bid, bname, author, price) VALUES
('1235-1111-1211', 'Harry Potter goblet of fire', 'JK', 800),
('1121-111-211', 'One Piece ch-333', 'EO', 300),
('1771-1003-111', 'Dune ch-2', '---', 1350),
('1331-1003-1211', 'Naruto ch-123', '---', 700),
('1854-2432-11', 'ABCD 1', '---', 3350),
('1255-1121-11', 'NNN 2 year', '---', 1770);

-- DISPLAY
SELECT * FROM Employee

SELECT * FROM issues

SELECT * FROM Booklist

SELECT * FROM Book

-- EID, ENAME OF ALL EMPLOYEES WHOSE SALARY < 10000
SELECT eid, ename 
FROM Employee
WHERE salary<10000;

-- record of books where price ranges from 2500 to 5000
SELECT * 
FROM Book
WHERE price>2500 AND price<5000;

-- booklist where publication name starts with 'E'
SELECT * 
FROM Booklist
WHERE publication LIKE 'E%'

--all employees whose name ends with '-SH'
SELECT * 
FROM Employee
WHERE ename LIKE '%SH'

-- all employee whose name consists exactly 5 characters
SELECT *
FROM Employee
WHERE ename LIKE '_____'

-- all employee whose name starts with 'K' and Salary>10000
SELECT *
FROM Employee
WHERE ename LIKE 'K%'
AND salary>10000

-- all books where bookid lies in range 1001-5099 or price between 2000 and 5000
SELECT *
FROM Book
WHERE bid>1000 AND bid<5099 
OR price > 2000;

-- display ISBN number and bookname where booklist must not contain 1003
SELECT bid, bname
FROM Book
WHERE bid NOT LIKE '%1003%'