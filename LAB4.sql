-- Sort by name descending
SELECT *
FROM Employee

SELECT ename
FROM Employee
ORDER BY ename DESC;

-- SORT NAME, PUBLICATION BY ASCENDING

SELECT *
FROM Booklist

SELECT name, publication
FROM Booklist
ORDER BY name, publication;

-- DISPLAY TOP THREE RECORDS FROM TEACHER
SELECT TOP 3 *
FROM Teacher

-- SUM OF ALL SALARIES EMPLOYEE
SELECT SUM(salary) as totalSalary
FROM Employee

-- MINIMUM SALARY OF EMPLOYEE
SELECT MIN(salary) as minimum
FROM Employee

-- AVERAGE PRICE OF BOOK BY AUTHOR
SELECT author, AVG(price) as averagePrice
FROM Book
GROUP BY author

-- DISPLAY PUBLICATION NAME AND NO OF BOOKS BY THEM 
SELECT publication, COUNT(publication) as noOfBooks
FROM Booklist
GROUP BY publication

-- BID AND BNAME OF BOOKS WHOSE PRICE>AVERAGE
SELECT bid, bname
FROM Book
WHERE price > (SELECT AVG(price) FROM Book)

-- FIND BID, BNAME AND AUTHOR IN ASCENDING ORDER WHERE AUTHOR NAME STARTS WITH E
SELECT bid, bname, author
FROM Book
WHERE author LIKE 'E%'

SELECT * 
FROM issues

SELECT * 
FROM Teacher

SELECT * 
FROM Book

--  TEACHER NAME AND BOOK TAKEN BY HIGHEST SALARY TEACHER
SELECT t.name, b.bname
FROM Teacher t
JOIN issues i ON t.tid = i.IID
LEFT JOIN Book b ON i.bid = b.bid
WHERE t.salary = (SELECT MAX(salary) FROM Teacher);

-- AUTHOR WITH MORE THAN 1 BOOKS
SELECT author
FROM Book
GROUP BY author
HAVING COUNT(bid) > 1;
