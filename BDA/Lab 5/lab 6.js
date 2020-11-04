CREATE KEYSPACE Employee WITH replication = {'class':'SimpleStrategy','replication_factor':3};

CREATE COLUMNFAMILY employee_info(emp_id INT PRIMARY KEY,emp_name VARCHAR,desgination VARCHAR,doj VARCHAR,dept_name VARCHAR,salary INT);

BEGIN BATCH
        INSERT INTO employee_info(emp_id,dept_name,desgination,doj,emp_name,salary)values(120,'Development','CTO','10/11/2015','Ayush',2000000);
        INSERT INTO employee_info(emp_id,dept_name,desgination,doj,emp_name,salary)values(121,'HR','Employee','20/01/2011','Raghav',1500000);
        INSERT INTO employee_info(emp_id,dept_name,desgination,doj,emp_name,salary)values(122,'Maintainance','staff','10/07/2020','Sanjay',50000);
        INSERT INTO employee_info(emp_id,dept_name,desgination,doj,emp_name,salary)values(123,'IT','Assistant','25/07/2014','Tanya',100000);
APPLY BATCH;

select * from employee_info;

UPDATE employee_info SET emp_name = 'Aakash',dept_name = 'IT' WHERE emp_id = 121;

select * from employee_info;

ALTER TABLE employee_info ADD Project VARCHAR;

UPDATE employee_info SET project='TIP' WHERE emp_id=120;
UPDATE employee_info SET project='Sentiment Analysis' WHERE emp_id=121;
UPDATE employee_info SET project='Facial recognition' WHERE emp_id=123;

INSERT INTO employee_info(emp_id, dept_name, desgination, doj, emp_name,project,salary)values(124, 'PR','Senior Manager','8/8/2020','Load balancing server','Abhi',20000) USING TTL 60;
SELECT TTL(desgination) FROM employee_info where emp_id=124;




2)
 CREATE COLUMNFAMILY libraryinfo(stud_id uuid, counter_value counter, stud_name VARCHAR, book_name VARCHAR, book_id INT, DOI VARCHAR, PRIMARY KEY(stud_id,stud_name,book_name,book_id,doi));

UPDATE libraryinfo set counter_value=counter_value+1 where stud_id=cdd43759-bc64-4119-91bf-3e9ec59ca966 and stud_name='Anjali' and book_name='malgudi' and book_id=1 and doi='1/2/2020';
UPDATE libraryinfo set counter_value=counter_value+1 where stud_id=uuid() and stud_name='Ayush' and book_name='Hardy boys' and book_id=1 and doi='1/2/2020';
UPDATE libraryinfo set counter_value=counter_value+1 where stud_id=uuid() and stud_name='meghna' and book_name='BDA' and book_id=1 and doi='1/2/2020';

select * from libraryinfo;

UPDATE libraryinfo set counter_value=counter_value+1 where stud_id=a56165fc-11c0-4e47-ba0b-e4ad8dd7b69d and stud_name='meghna' and book_name='BDA' and book_id=1 and doi='1/2/2020';

select * from libraryinfo;

SELECT * from libraryinfo where counter_value=2 ALLOW FILTERING;

CAPTURE
CAPTURE 'C:\Users\ayush\OneDrive\Desktop\college\7th sem\BDA\BDA lab\user.csv';
select * from libraryinfo;
