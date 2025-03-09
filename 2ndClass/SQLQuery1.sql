USE student


SELECT * FROM users;

SELECT name FROM users ORDER BY age;

SELECT name FROM users ORDER BY age DESC;

SELECT name FROM users ORDER BY age ASC;

-- 1. Names that contain 'l' anywhere
SELECT name FROM users WHERE name LIKE '%l%';

-- 2. Names that contain 'k' anywhere
SELECT name FROM users WHERE name LIKE '%k%';

-- 3. Names that are exactly **one** character long
SELECT name FROM users WHERE name LIKE '_';

-- 4. Names that are **two** characters long and end with 'a'
SELECT name FROM users WHERE name LIKE '____l';

SELECT COUNT(*) FROM users;





