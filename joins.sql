.open dreamhome.sqlite
.mode column

SELECT b.branchno, b.city, s.staffno, s.fname, s.lname, p.propertyno
FROM branch b, propertyforrent p
RIGHT JOIN staff s ON b.branchno = s.branchno AND s.staffno = p.staffno
ORDER BY b.branchno, s.staffno, p.propertyno;