CREATE TABLE SandersonBooks (
    primaryKey bigint autoincrement PRIMARY KEY,
    timestamp TIMESTAMP default CURRENT_TIMESTAMP,
    title VARCHAR,
    author VARCHAR default 'Brandon Sanderson',
    coauthor VARCHAR,
    narrator VARCHAR,
    series VARCHAR,
    bookInSerie INT,
    lenght string,
    releaseDate DATE
);

INSERT INTO SandersonBooksv2 (title, narrator, series, bookInSerie, lenght, releaseDate)
VALUES ('Cytonic', 'Sophie Aldred', 'The Skyward Series', 3, '14:28:00', '2021-11-23'),
('Sunreach','Suzy Jackson','Skyward Flight',1,'5:21:00','2021-09-28'),
('ReDawn','Suzy Jackson','Skyward Flight',2,'6:57:00','2021-10-26'),
('Evershore','Suzy Jackson','Skyward Flight',3,'5:00:00','2021-12-28'),
('The Final Empire','Michael Kramer','Mistborn',1,'24:59:00','2011-03-18'),
('Skyward','Sophie Aldred','The Skyward Series',1,'15:14:00','2018-11-06'),
('The Way of Kings','Michael Kramer','Stormlight Archive',1,'45:29:00','2011-05-11');

UPDATE SandersonBooks
SET coauthor = 'Janci Patterson',
timestamp = CURRENT_TIMESTAMP
WHERE title = 'Evershore';

// Add column
ALTER TABLE SandersonBooks ADD column "language" VARCHAR;
ALTER TABLE SandersonBooks ADD column conarrator VARCHAR;
// Drop column
ALTER TABLE SandersonBooks DROP column "language";
ALTER TABLE SandersonBooks DROP column conarrator;

// add values for column conarrator
UPDATE
	SandersonBooks
SET
	conarrator = 'Kate Reading',
	timestamp = CURRENT_TIMESTAMP
WHERE
    title = 'The Way of Kings';

//    add values for column "language"
UPDATE
	SandersonBooks
SET
    "language"= 'en';


ALTER TABLE SandersonBooks
ADD "Cosmere universe" BOOLEAN,
ADD "Cytoverse universe" BOOLEAN;

UPDATE
    SandersonBooks
SET
    "Cosmere universe" = TRUE,
    "Cytoverse universe" = FALSE

WHERE
    series in ('Stormlight Archive','Mistborn');


UPDATE
    SandersonBooks
SET
    "Cosmere universe" = FALSE,
    "Cytoverse universe" = TRUE

WHERE
    series in ('The Skyward Series', 'Skyward Flight');
