CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY, 
    dept_name VARCHAR(20) NOT NULL,
    phone VARCHAR(15)
);


INSERT INTO departments
(dept_name, phone)
VALUES
('Marketing', '555-1212'),
('Legal', '555-1213'),
('Finance', '555-1214');
('Sales', '555-1215');



CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY, 
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    salary INT,
    dept_id INT REFERENCES departments(dept_id)
);


INSERT INTO employees
(fname, lname, salary, dept_id)
VALUES
('Dan', 'Hyatt', 90000, 1),
('Riki', 'Webber', 75000, 2),
('Sean', 'NotSure', 85000, 3),
('Gabe', 'StillNotSure', NULL, NULL);



-- Example --
SELECT dept_name, phone
FROM departments AS d
  LEFT JOIN employees AS e
    ON e.dept_id = d.dept_id
WHERE e.dept_id IS NULL;

-- INNER JOIN --
SELECT * 
FROM employees
    JOIN departments
        on employees.dept_id = departments.dept_id;

-- LEFT JOIN --
SELECT fname, e.dept_id, d.dept_name, dept_name
FROM employees as e
    LEFT JOIN departments as d
        on e.dept_id = d.dept_id;

-- Example --
SELECT dept_name, COUNT(*) AS num_employ, SUM(salary)
FROM departments AS d
  LEFT JOIN employees AS e
    ON e.dept_id = d.dept_id
WHERE e.salary > 0
GROUP BY d.dept_id;






CREATE TABLE students (
    github VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20)
);

INSERT INTO students
(github, first_name, last_name)
VALUES
('jhacks', 'Jane', 'Hacker'),
('sdevelops', 'Sarah', 'Developer');


SELECT *
FROM students
WHERE first_name = 'Sarah';


-- Create projects table --
CREATE TABLE projects (
    title VARCHAR(20) PRIMARY KEY,
    description TEXT,
    max_grade INTEGER
);



-- Insert data into projects table --
INSERT INTO projects
(title, description, max_grade)
VALUES
('Markov', 'Tweets generated from Markov chains', 50),
('Blockly', 'Programmatic Logic Puzzle Game', 100);




SELECT title, max_grade
FROM projects
WHERE max_grade > 50;


SELECT title, max_grade
FROM projects
WHERE max_grade BETWEEN 10 AND 60;



SELECT title, max_grade
FROM projects
WHERE max_grade NOT BETWEEN 25 AND 75;







-- Create grade table --
CREATE TABLE grades (
    id VARCHAR(20) PRIMARY KEY,
    project_title TEXT,
    max_grade INTEGER
);


-- Insert data into projects table --
INSERT INTO grades
(id, student_github, project_title, grade)
VALUES
(1, 'jhacks', 'Markov', 10),
(2, 'jhacks', 'Blockly', 2),
(3, 'sdevelops', 'Markov', 50),
(4, 'sdevelops', 'Blockly', 100);







-- query --
SELECT s.first_name, s.last_name, g.project_title, g.grade
FROM students AS s
    JOIN grades AS g ON (s.github = g.student_github);
    JOIN projects AS p ON (g.project_title = p.title);




-- query --
SELECT *
FROM students AS s
    JOIN grades AS g ON (s.github = g.student_github)
    JOIN projects AS p ON (g.project_title = p.title)
WHERE github = 'jhacks';


-- query --
SELECT max_grade
FROM projects;




-- Write a query that selects only the columns that match the example table from the beginning of this step.



SELECT s.first_name, s.last_name, p.title, g.grade, p.max_grade
FROM students AS s
    JOIN grades AS g ON (s.github = g.student_github)
    JOIN projects AS p ON (g.project_title = p.title)
WHERE github = 'jhacks';


