CREATE TABLE SandersonBooks (
    primaryKey INT PRIMARY KEY,
    timestamp TIMESTAMP default CURRENT_TIMESTAMP,
    title VARCHAR,
    author VARCHAR,
    coauthor VARCHAR,
    narrator VARCHAR,
    series VARCHAR,
    bookInSerie INT,
    lenght TIME,
    releaseDate DATE
)
