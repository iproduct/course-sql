SELECT * FROM `books` WHERE substring(`title`, 1, 3) = 'The';
SELECT * FROM `books` WHERE substring(`title` FROM 1 FOR 3) = 'The';

SELECT `id`, REPLACE(`title`, 'The', '***') AS `Title` FROM `books` WHERE substring(`title`, 1, 3) = 'The';
SELECT `id`, REGEXP_REPLACE(`title`, 'T.e', '***') AS `Title` FROM `books` WHERE substring(`title`, 1, 3) = 'The';
SELECT `id`, REGEXP_REPLACE(`title`, 'T.e' COLLATE utf8mb4_0900_as_cs, '***') AS `Title` FROM `books` WHERE substring(`title`, 1, 3) = 'The';

SELECT ROUND(SUM(`cost`), 2) FROM `books`;
SELECT FORMAT(SUM(`cost`), 2, 'bg_BG') FROM `books`;

SELECT id, first_name, last_name, timestampdiff(YEAR, `born`, `died`) AS `Lived Years` FROM `authors`;

SELECT `title` FROM `books` WHERE `title` LIKE '%Harry Potter%';