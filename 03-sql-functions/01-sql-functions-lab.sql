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
DATE_FORMAT(`born`, '%b %D, %Y') AS `Born`, 
DATE_FORMAT(`died`, '%b %D, %Y') `Died`,
TIMESTAMPDIFF(YEAR, `born`, IFNULL(`died`, NOW())) AS `Years Lived` 
FROM `authors`;

SELECT `title` FROM `books` 
WHERE `title` LIKE '%Harry Potter%';


SELECT `id`, `title` FROM `books` 
WHERE  `title` REGEXP '(?i)^.*\\sthe\\s.*$';
SELECT `id`, `title` FROM `books` 
WHERE  `title` RLIKE '(?i)^.*\\sthe\\s.*$';
SELECT `id`, `title` FROM `books` 
WHERE  REGEXP_LIKE(`title`, '(?i)^.*\\sthe\\s.*$');

SELECT LTRIM(REGEXP_REPLACE(`title`, '\\s[Tt]he|[Tt]he\\s', ' *** ')) AS 'Title' 
FROM `books` 
WHERE REGEXP_LIKE(`title`, '(?i)^.*the.*$');

SELECT CASE `id` 
	WHEN 1 THEN 'one' 
	WHEN 2 THEN 'two' 
	WHEN 3 THEN 'three'
	WHEN 4 THEN 'four'
	ELSE 'more ...' 
END AS `Case Expression`,
CONCAT_WS(' ', `first_name`, `last_name`) AS `name`
FROM `authors`; 
