-- Drop tables if they exist
DROP TABLE IF EXISTS dept_manager, dept_emp, titles, salaries, employees, departments;

-- Creation of employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(35) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- Creation of departments table
CREATE TABLE departments (
    dept_no VARCHAR(8) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

-- Creation of titles for table
CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR(40) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Creation of department employee table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(8) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- Creationg of salaries table
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Creation of Department manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(8) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- Date formatting 
UPDATE dept_manager
SET to_date = CURRENT_DATE
WHERE EXTRACT(YEAR FROM to_date) = 9999;

UPDATE dept_emp
SET to_date = CURRENT_DATE
WHERE EXTRACT(YEAR FROM to_date) = 9999;

UPDATE titles
SET to_date = CURRENT_DATE
WHERE EXTRACT(YEAR FROM to_date) = 9999;
