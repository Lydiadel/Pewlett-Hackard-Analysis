SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_Date
INTO retirement_titles
FROM employees as e
INNER JOIN title as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
;

SELECT * FROM retirement_titles;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles 
FROM retirement_titles as rt
WHERE to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;
SELECT * FROM unique_titles;

-- Retrieve employees retiring title
SELECT COUNT (ce.emp_no), ut.title
FROM unique_titles as ut
LEFT JOIN current_emp as ce
ON ce.emp_no = ut.emp_no
GROUP BY title
ORDER BY COUNT(title) DESC;