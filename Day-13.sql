DROP TABLE IF EXISTS employees;
CREATE TABLE Employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO Employees (name, salary) VALUES
('Alice', 60000.00),
('Bob', 75000.00),
('Charlie', 50000.00),
('David', 50000.00),
('Eva', 95000.00),
('Frank', 80000.00),
('Grace', 80000.00),
('Hank', 90000.00),
('Hank', 75000.00);

SELECT * FROM Employees;

WITH salary_ranks
AS
(
SELECT 
    *,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as rn,
    RANK() OVER(ORDER BY salary DESC) as rans,
    DENSE_RANK() OVER(ORDER BY salary DESC) as d_ranks    
FROM employees
)
SELECT * FROM salary_ranks
WHERE rans = 3