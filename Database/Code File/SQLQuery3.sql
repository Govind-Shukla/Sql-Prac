CREATE DATABASE EXAM

USE EXAM

SELECT * FROM Students
-- Students who passed SQL or Excel but failed Python
SELECT * FROM Students WHERE Excel_Pass_Fail='Pass' AND Python_Pass_Fail = 'Fail' 
Union 
SELECT * FROM Students WHERE SQL_Pass_Fail='Pass' AND Python_Pass_Fail = 'Fail' 

--Students who passed Python or Excel but failed SQL
SELECT * FROM Students WHERE Excel_Pass_Fail='Fail' AND Python_Pass_Fail = 'Pass' 
Union 
SELECT * FROM Students WHERE SQL_Pass_Fail='Pass' AND Excel_Pass_Fail = 'Fail'

--Students who passed SQL or Python but failed Excel
SELECT * FROM Students Where SQL_Pass_Fail ='Pass' And Excel_Pass_Fail = 'Fail'
Union
Select * FROM Students Where Python_Pass_Fail = 'Pass' And Excel_Pass_Fail = 'Fail'

--Students who failed SQL or Excel but passed Python
SELECT * FROM Students Where SQL_Pass_Fail ='Fail' And Python_Pass_Fail = 'Pass'
Union
Select * FROM Students Where Excel_Pass_Fail = 'Fail' And Python_Pass_Fail = 'Pass'

--Students who failed Python or Excel but passed SQL
SELECT * FROM Students Where Python_Pass_Fail ='Fail' And SQL_Pass_Fail = 'Pass'
Union
Select * FROM Students Where Excel_Pass_Fail = 'Fail' And SQL_Pass_Fail = 'Pass'


--Students who failed SQL or Python but passed Excel
SELECT * FROM Students Where Python_Pass_Fail ='Fail' And Excel_Pass_Fail = 'Pass'
Union
Select * FROM Students Where SQL_Pass_Fail = 'Fail' And Excel_Pass_Fail = 'Pass'

DROP TABLE Students_grades
CREATE TABLE Students_grades ( ID INT, NAME VARCHAR(50) , SCORE INT)
INSERT INTO Students_grades(ID, NAME, SCORE)
VALUES
      (1,'Simisola',60),
	  (2,'Ivan',80),
	  (3,'Metodija',52),
	  (4,'callum',98),
	  (5,'Leia',84),
      (6,'Aparecida',82),
(7,'Ursula',69),
(8,'Ramazan',78),
(9,'Corona',87),
(10,'Alise',57),
(11,'Galadriel',89),
(12,'Merel',99),
(13,'Cherice',55),
(14,'Nithya',81),
(15,'Elsad',71),
(16,'Liisi',90),
(17,'Johanna',90),
(18,'Anfisa',90),
(19,'Ryosuke',97),
(20,'Sakchai',61),
(21,'Elbert',63),
(22,'Ketleyn',51);

SELECT * From Students_grades
SELECT * ,CASE
               When SCORE >=93 Then 'A+'
			   When SCORE >=90 THEN 'A'
			   WHEN SCORE >= 87 THEN 'A-'
			   WHEN SCORE >=83 THEN 'B+'
			   WHEN SCORE >=80 THEN 'B'
			   WHEN SCORE >=77 THEN 'B-'
			   WHEN SCORE >=73 THEN 'C+'
			   WHEN SCORE >=70 THEN 'C'
			   WHEN SCORE >=67 THEN 'C-'
			   WHEN SCORE >=63 THEN 'D+'
			   WHEN SCORE >=60 THEN 'D'
			   ELSE 'F'
			   END AS GRADES
	FROM Students_grades
	ORDER BY ID


SELECT COUNT(ID), 
                CASE WHEN SCORE >=60 THEN'PASSED'
				ELSE'FAILED'
				END AS STATUS
	FROM Students_grades
	GROUP BY  SCORE , 'STATUS'

	SELECT
CASE
WHEN score >= 60
THEN 'PASSED'
ELSE 'Failed'
END AS result,
COUNT(*) AS number_of_students
FROM Students_grades
GROUP BY 'result'



SELECT SCORE, COUNT(ID) NO.OF STUDENT FROM STUDENT GROUP BY 

SELECT COUNT(*) NO_OF_STUDENTS  ,CASE
               When SCORE >=93 Then 'A+'
			   When SCORE >=90 THEN 'A'
			   WHEN SCORE >= 87 THEN 'A-'
			   WHEN SCORE >=83 THEN 'B+'
			   WHEN SCORE >=80 THEN 'B'
			   WHEN SCORE >=77 THEN 'B-'
			   WHEN SCORE >=73 THEN 'C+'
			   WHEN SCORE >=70 THEN 'C'
			   WHEN SCORE >=67 THEN 'C-'
			   WHEN SCORE >=63 THEN 'D+'
			   WHEN SCORE >=60 THEN 'D'
			   ELSE 'F'
			   END AS GRADES
	FROM Students_grades
	GROUP BY GRADES,ID


SELECT
CASE
WHEN score >= 60
THEN 'passed'
ELSE 'failed'
END AS result,
COUNT(*) AS number_of_students
FROM students_grades

ORDER BY result DESC;
FROM students_grades;

--a.	Students whose names start with A and who joined in march
 
 SELECT * FROM Students Where Student_Name Like 'a%' AND MONTH(Joining_Date) = 03


--b.	Students having C in their name and at least 7 characters in their name.
Select * From Students WHERE Student_Name Like '%c%' And LEN(Student_Name) >=7
--c.	In which month the maximum number of students registered for EXCEL.

SELECT MAX(coun) FROm
(SELECT COUNT(Student_Name) coun, MONTH(Joining_Date) FROM Students GROUP BY MONTH (Joining_Date))

SELECT MAX (mycount) 
FROM (SELECT COUNT(Student_Name) mycount, MONTH(Joining_Date) 
FROM Students
GROUP BY MONTH(Joining_Date)
) ss;

--d.	Student with minimum duration(days, and months) in EXCEL, SQL and python.





--e.	Section wise average duration (days and months) of students in course.

SELECT AVG (Duration (SELECT Datediff(MONTH, Joining_Date,Leaving_Date) Duration , Section FROM Students) 
