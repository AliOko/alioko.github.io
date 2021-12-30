CREATE TABLE narrators (
    narratorId SERIAL PRIMARY KEY,
    narratorName VARCHAR NOT NULL,
    sandersonBookId INT,
    FOREIGN KEY(sandersonBookId) REFERENCES sandersonbooks(primaryKey)
);