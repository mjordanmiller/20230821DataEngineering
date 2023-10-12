CREATE DATABASE hr_db;
GO

USE hr_db;
GO

CREATE TABLE regions(
	region_id INT IDENTITY PRIMARY KEY,
	region_name VARCHAR(25)
);
GO

CREATE TABLE countries(
	country_id CHAR(2) PRIMARY KEY,
	country_name VARCHAR(40),
	region_id INT FOREIGN KEY REFERENCES regions(region_id)
);
GO

CREATE TABLE locations(
	location_id INT PRIMARY KEY,
	street_address VARCHAR(40),
	postal_code VARCHAR(12),
	city VARCHAR(30),
	state_province VARCHAR(25),
	country_id CHAR(2) FOREIGN KEY REFERENCES countries(country_id)
);
GO

CREATE TABLE departments(
	department_id INT PRIMARY KEY,
	department_name VARCHAR(30),
	manager_id INT,
	location_id INT FOREIGN KEY REFERENCES locations(location_id)
);
GO

CREATE TABLE jobs (
	job_id VARCHAR(10) PRIMARY KEY,
	job_title VARCHAR(35),
	min_salary INT,
	max_salary INT
);
GO

CREATE TABLE employees(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(20),
	last_name VARCHAR(25),
	email VARCHAR(25),
	phone_number VARCHAR(20),
	hire_date DATE,
	job_id VARCHAR(10) FOREIGN KEY REFERENCES jobs(job_id),
	salary NUMERIC(8,2),
	commission_pct NUMERIC(2,2),
	manager_id INT,
	department_id INT FOREIGN KEY REFERENCES departments(department_id)
);
GO

CREATE TABLE job_history(
	employee_id INT,
	start_date DATE,
	end_date DATE,
	job_id VARCHAR(10) FOREIGN KEY REFERENCES jobs(job_id),
	department_id INT FOREIGN KEY REFERENCES departments(department_id),
	CONSTRAINT pk_job_history_employee_id_start_date PRIMARY KEY CLUSTERED(employee_id, start_date)
);
GO

CREATE VIEW emp_details_view (
	employee_id,
	job_id,
	manager_id,
	department_id,
	location_id,
	country_id,
	first_name,
	last_name,
	salary,
	commission_pct,
	department_name,
	job_title,
	city,
	state_province,
	country_name,
	region_name)
AS SELECT
    e.employee_id, 
    e.job_id, 
    e.manager_id, 
    e.department_id,
    d.location_id,
    l.country_id,
    e.first_name,
    e.last_name,
    e.salary,
    e.commission_pct,
    d.department_name,
    j.job_title,
    l.city,
    l.state_province,
    c.country_name,
    r.region_name
FROM
    employees e,
    departments d,
    jobs j,
    locations l,
    countries c,
    regions r
WHERE e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND l.country_id = c.country_id
    AND c.region_id = r.region_id
    AND j.job_id = e.job_id;
GO

CREATE INDEX emp_department_ix
   ON employees (department_id);
CREATE INDEX emp_job_ix
   ON employees (job_id);
CREATE INDEX emp_manager_ix
   ON employees (manager_id);
CREATE INDEX emp_name_ix
   ON employees (last_name, first_name);
CREATE INDEX dept_location_ix
   ON departments (location_id);
CREATE INDEX jhist_job_ix
   ON job_history (job_id);
CREATE INDEX jhist_employee_ix
   ON job_history (employee_id);
CREATE INDEX jhist_department_ix
   ON job_history (department_id);
CREATE INDEX loc_city_ix
   ON locations (city);
CREATE INDEX loc_state_province_ix
   ON locations (state_province);
CREATE INDEX loc_country_ix
   ON locations (country_id);
GO

ALTER TABLE departments
ADD CONSTRAINT fk_departments_manager_id FOREIGN KEY (manager_id)
REFERENCES employees(employee_id);
GO

