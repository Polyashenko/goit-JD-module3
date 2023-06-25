-- Додавання працівників
INSERT INTO worker (NAME, BIRTHDAY, LEVEL, SALARY)
VALUES
  ('John Doe', '1990-05-15', 'Junior', 2500),
  ('Jane Smith', '1985-09-22', 'Middle', 4000),
  ('Mike Johnson', '1995-02-10', 'Senior', 6000),
  ('Emily Davis', '1992-07-07', 'Trainee', 800),
  ('David Wilson', '1988-12-01', 'Junior', 3000),
  ('Sarah Thompson', '1991-03-18', 'Middle', 4500),
  ('Daniel Lee', '1994-10-25', 'Senior', 7000),
  ('Olivia Brown', '1987-06-12', 'Trainee', 700),
  ('Andrew Taylor', '1993-08-05', 'Junior', 3500),
  ('Sophia Clark', '1989-11-30', 'Middle', 5000);

-- Додавання клієнтів
INSERT INTO client (NAME)
VALUES
  ('ABC Corporation'),
  ('XYZ Corp.'),
  ('Acme Corporation'),
  ('Global Enterprises'),
  ('Tech Solutions');

-- Додавання проєктів
INSERT INTO project (CLIENT_ID, START_DATE, FINISH_DATE)
VALUES
  (1, '2023-01-01', '2023-02-28'),
  (2, '2023-03-15', '2023-05-31'),
  (1, '2023-06-01', '2023-07-31'),
  (3, '2023-08-01', '2023-10-15'),
  (2, '2023-09-01', '2023-12-31'),
  (4, '2023-10-15', '2024-02-28'),
  (5, '2023-11-01', '2024-01-31');

-- Додавання працівників до проєктів
INSERT INTO project_worker (PROJECT_ID, WORKER_ID)
SELECT * FROM (
  SELECT 1 AS PROJECT_ID, 1 AS WORKER_ID UNION ALL
  SELECT 1, 2 UNION ALL
  SELECT 2, 3 UNION ALL
  SELECT 2, 4 UNION ALL
  SELECT 2, 5 UNION ALL
  SELECT 3, 6 UNION ALL
  SELECT 3, 7 UNION ALL
  SELECT 4, 8 UNION ALL
  SELECT 5, 9 UNION ALL
  SELECT 5, 10
) AS temp
WHERE NOT EXISTS (
  SELECT 1 FROM project_worker WHERE PROJECT_ID = temp.PROJECT_ID AND WORKER_ID = temp.WORKER_ID
);