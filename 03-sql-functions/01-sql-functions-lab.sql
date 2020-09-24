SELECT `title` AS `Book Title` FROM `books` 
WHERE SUBSTRING(`title`, 1, 3) = 'The' 
ORDER BY `id`;

SELECT `id`, `title`, `cost`, 
   SUBSTRING(`title` FROM 1 FOR 20) AS `Title Summary` 
FROM `books`;

SELECT REPLACE(`title`, 'The', '***') AS 'Title' 
FROM `books` 
WHERE SUBSTRING(`title`, 1, 3) = 'The';

SELECT INSERT(`title`, LOCATE('The', `title`, 1), 3, '***') AS 'Title' 
FROM `books` 
WHERE SUBSTRING(`title`, 1, 3) = 'The';

SELECT `id`, `title`, 
LOCATE('The', `title` COLLATE utf8mb4_0900_as_cs) AS 'Index of The' 
FROM `books`;

SELECT ROUND(SUM(`cost`), -2) AS `Total Cost` FROM `books`;

SELECT CONCAT(`first_name`, ' ', `last_name`) AS `Name`, 
TIMESTAMPDIFF(YEAR, `born`, IFNULL(`died`, NOW())) AS `Days Lived` 
FROM `authors`;
