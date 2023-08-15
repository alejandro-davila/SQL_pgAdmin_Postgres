# Employee Database-SQL: A Mystery in Two Parts

<p align="center">
<img width="700" height="300" alt="picture" src=https://github.com/alejandro-davila/sql-challenge/assets/135288005/7e2df702-07c7-4f89-80ff-15758d971449>


<h1 align="center">Background</h1>

It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.
For this project, you’ll design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. That is, you’ll perform data modeling, data engineering, and data analysis, respectively.

<h1 align="center">1. Data Modeling</h1>

A fundamental data modeling approach known as Entity-Relationship Diagrams (ERD) was employed to structure the employee data. This technique facilitated the identification of six distinct entities or tables within the employee database: namely, employees, departments, salaries, titles, department managers, and department employees. Comprehensive details about the attributes and data types associated with each entity were also provided. The final step involved creating an ER diagram that visually represents the relationships between these entities/objects, including primary and foreign keys within the database. For a comprehensive understanding of the employee database, you can access the detailed description by following this link and downloading the corresponding txt file: [Employees_ERD.txt](https://github.com/alejandro-davila/sql-challenge/blob/397ca84083975a003b588a0ed5456ff1b0466a50/Employees_ERD.txt).


The visual representation of the ER diagram is as follows:

app.quickdatabasediagrams.com             |pgAdmin 4
:-------------------------:|:-------------------------:
<img width="800" height="500" alt="picture" src=https://github.com/alejandro-davila/sql-challenge/assets/135288005/a305ba2a-519f-4f3c-b740-6949a39440f8>  |  <img width="800" height="500" alt="picture" src=https://github.com/alejandro-davila/sql-challenge/assets/135288005/79df47e5-e294-4979-aa14-fb76505d821c>



<h1 align="center">2. Data Engineering</h1>

Utilizing the provided information, a table schema was meticulously crafted for each of the six CSV files. This process encompassed defining data types, establishing primary keys, configuring foreign keys, and implementing necessary constraints. The arrangement of the tables was meticulously organized to align with the hierarchy of primary and foreign key relationships.

For a direct view of the detailed schema file, you can access it via the following link: [employees_schema.mssql](https://github.com/alejandro-davila/sql-challenge/blob/d18c47d12b8eb10854a441fb53891f1896296171/employees_schema.mssql).

<h1 align="center">3. Data Analysis</h1>

After completing the importing process a Postgresql analysiss was perfomed and you can find the full query in this file [employees_query.mssql](https://github.com/alejandro-davila/sql-challenge/blob/397ca84083975a003b588a0ed5456ff1b0466a50/employees_query.mssql)  

The analysis query was executed and subsequently presented in the following formats:

1. The query to list the following details of each employee: employee number, last name, first name, sex, and salary

```
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;
```
<p align="center">
<img width="800" height="300" alt="picture" src=https://github.com/alejandro-davila/sql-challenge/assets/135288005/3e104bc0-5be1-4466-96f1-2fccd211d398>




   
2. The query to list first name, last name, and hire date for employees who were hired in 1986.

```
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';
```

<p align="center">
<img width="600" height="300" alt="picture" src=https://github.com/alejandro-davila/sql-challenge/assets/135288005/e5e6429b-af9f-4b17-9bd0-54b05da4abb9>

 
3. The query list the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

```
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;
```

<p align="center">
<img width="600" height="250" alt="picture" src=https://github.com/alejandro-davila/sql-challenge/assets/135288005/9a1f5e72-585e-4038-9b3e-e044c2547c76>


4. The query to list the department of each employee with the following information: employee number, last name, first name, and department name.

```
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;
```

<p align="center">
<img width="500" height="250" alt="picture" src=https://github.com/alejandro-davila/sql-challenge/assets/135288005/4d22d146-68a6-40d8-95e6-393159cd17a2>


5. The query to list first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

```
SELECT first_name, last_name,sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
```

<p align="center">
<img width="550" height="250" alt="picture" src=https://github.com/alejandro-davila/sql-challenge/assets/135288005/2e4c93e7-a291-4b57-9a4c-8c04a437092e>


6. The query to list all employees in the Sales department, including their employee number, last name, first name, and department name.

```
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
```

<p align="center">
<img width="550" height="250" alt="picture" src=https://github.com/alejandro-davila/sql-challenge/assets/135288005/b72a7e40-5fba-4556-a77b-c9f82873f779>


7. The query to list all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

```
SELECT dept_emp.emp_no, employees.last_name,employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';
```

<p align="center">
<img width="550" height="250" alt="picture" src=https://github.com/alejandro-davila/sql-challenge/assets/135288005/526183b5-f4be-4bd9-8539-b72be6114ef6>

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

```
SELECT last_name,
COUNT(last_name) AS "shared_last_name"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
```

<p align="center">
<img width="400" height="250" alt="picture" src=https://github.com/alejandro-davila/sql-challenge/assets/135288005/a6c198b6-6ecb-444f-bd01-6d51a36d71ab>


<h2 align="center">Resources</h2>

<img width="187" alt="pgAdmin" src="https://github.com/alejandro-davila/sql-challenge/assets/135288005/a9f816ec-15e8-4fe1-b40d-5c6b0de8fa6a">
