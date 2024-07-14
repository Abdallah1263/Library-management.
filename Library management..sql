CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100),
    BirthYear INT
);
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(150),
    AuthorID INT,
    Genre VARCHAR(50),
    Price DECIMAL(10, 2),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    BorrowerName VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    BorrowerID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)

	INSERT INTO Authors (AuthorID, Name, BirthYear) VALUES
(1, 'George Orwell', 1903),
(2, 'Jane Austen', 1775),
(3, 'J.K. Rowling', 1965);


INSERT INTO Books (BookID, Title, AuthorID, Genre, Price) VALUES
(1, '1984', 1, 'Dystopian', 15.99),
(2, 'Pride and Prejudice', 2, 'Romance', 9.99),
(3, 'Harry Potter and the Sorcerer\s Stone', 3, 'Fantasy', 12.99);

INSERT INTO Borrowers (BorrowerID, BorrowerName, Email) VALUES
(1, 'Ali Ahmed', 'ali@example.com'),
(2, 'Sara Mohamed', 'sara@example.com');


INSERT INTO Loans (LoanID, BookID, BorrowerID, LoanDate, ReturnDate) VALUES
(1, 1, 1, '2024-01-10', NULL),
(2, 2, 2, '2024-01-12', '2024-01-19');



--Query to extract data from borrowed books:
SELECT 
    Title, 
    BorrowerName, 
    LoanDate, 
   ReturnDate
FROM 
    Loans
JOIN 
    Books ON Loans.BookID = Books.BookID
JOIN 
    Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID;

	------------------------------------------------------
	--Query to calculate the number of books per author:
	SELECT 
    a.Name AS AuthorName, 
    COUNT(b.BookID) AS NumberOfBooks
FROM 
    Authors a
LEFT JOIN 
    Books b ON a.AuthorID = b.AuthorID
GROUP BY 
    a.Name;
	-------------------------------------
--	Query to search for books in a specific genre:SELECT
	
	SELECT 
    Title, 
    Price 
FROM 
    Books
WHERE 
    Genre = 'Fantasy';
	---------------------------
--	Query to delete borrowers who do not have an email:

   DELETE FROM 
    Borrowers 
WHERE 
    Email IS NULL;

	----------------------------------
	--Loan data analysis:
	SELECT 
    b.Title, 
    COUNT(l.LoanID) AS TotalLoans
FROM 
    Loans l
JOIN 
    Books b ON l.BookID = b.BookID
GROUP BY 
    b.Title
ORDER BY 
    TotalLoans DESC;
	-----------------------------------
	T

