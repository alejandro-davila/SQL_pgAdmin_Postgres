-- Data Engineering
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

CREATE TABLE "departments" (
    -- Department number is a primary key, and it is
    -- aslo found in department employees and department manager list
    "dept_no" VARCHAR   NOT NULL,
    -- Department names
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    -- Title id is a primary key,
    -- and it also found in employees as emp_title_id
    "title_id" VARCHAR(10)   NOT NULL,
    -- List of titles
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    -- Employees number is a primary key
    -- and also found in department employees, department manager
    -- and salaries list
    "emp_no" INT   NOT NULL,
    -- Employees have a title id employees(emp_title_id)
    -- So, this id has relationship with-
    -- the composite foreign key titles(title_id)
    "emp_title_id" VARCHAR(10)   NOT NULL,
    -- Employees birth date
    "birth_date" DATE   NOT NULL,
    -- Employees first name
    "first_name" VARCHAR(30)   NOT NULL,
    -- Employees last name
    "last_name" VARCHAR(30)   NOT NULL,
    -- Employees sex
    "sex" VARCHAR(2)   NOT NULL,
    -- Employees hired date
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    -- Employees number in department employees list and
    -- which shared a unique key with employees(emp_no)
    "emp_no" INT   NOT NULL,
    -- Department number in department employees list and
    -- which shared a unique key with dept_emp(dept_no)
    "dept_no" VARCHAR(5)   NOT NULL
);

CREATE TABLE "dept_manager" (
    -- Department number in department manger list and
    -- which shared a unique key with dept_emp(dept_no)
    "dept_no" VARCHAR(5)   NOT NULL,
    -- Employees number in department manger list and
    -- which  shared a unique key with employees(emp_no)
    "emp_no" INT   NOT NULL
);

CREATE TABLE "salaries" (
    -- Employees number in salaries and
    -- which shared unique keys with employees(emp_no)
    "emp_no" INT   NOT NULL,
    -- Employees salaries
    "salary" INT   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Viewing the tables 
SELECT * FROM departments;
SELECT * FROM titles;	
SELECT * FROM employees;	
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;	
SELECT * FROM salaries;