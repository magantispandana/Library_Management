-- creating a databse named as library_database

Create database library_database;

-- now we use 'use' command to use the databse 

use library_database;

-- Creating a tables required for the data so that we can categorized the data in different tables 

CREATE TABLE tbl_publisher (
    publisher_publisherName VARCHAR(255) PRIMARY KEY,
    publisher_publisherAddress VARCHAR(255),
    publisher_publisherPhone VARCHAR(255)
);

-- table borrower -- borrower details 

CREATE TABLE tbl_borrower (
    borrower_cardno INT PRIMARY KEY AUTO_INCREMENT,
    borrower_borrowername VARCHAR(255),
    borrower_borroweraddress VARCHAR(255),
    borrower_borrowerphone VARCHAR(255)
);

-- table book -- books details 

CREATE TABLE tbl_book (
    book_bookid INT PRIMARY KEY AUTO_INCREMENT,
    book_booktitle VARCHAR(255),
    book_publishername VARCHAR(255) NOT NULL,
    FOREIGN KEY (book_publishername)
        REFERENCES tbl_publisher (publisher_publishername)
        ON DELETE CASCADE
);



-- TABLE FOR AUTHORS -- Authors details 

CREATE TABLE tbl_book_authors (
    book_authors_AuthorID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    book_authors_BookID INT NOT NULL,
    book_authors_AuthorName VARCHAR(255),
    FOREIGN KEY (book_authors_BookID)
        REFERENCES tbl_book (book_BookID)
        ON DELETE CASCADE
);

-- TABLE FOR Library_Branch -- details of library 


CREATE TABLE tbl_library_branch (
    library_branch_BranchID INT PRIMARY KEY AUTO_INCREMENT,
    library_branch_BranchName VARCHAR(255),
    library_branch_BranchAddress VARCHAR(255)
);

-- TABLE FOR BOOK_COPIES - details of copies available 

CREATE TABLE tbl_book_copies (
    book_copies_copiesID INT PRIMARY KEY AUTO_INCREMENT,
    book_copies_BookID INT NOT NULL,
    book_copies_BranchID INT NOT NULL,
    book_copies_No_Of_Copies INT,
    FOREIGN KEY (book_copies_BookID)
        REFERENCES tbl_book (book_bookID)
        ON DELETE CASCADE,
    FOREIGN KEY (book_copies_BranchID)
        REFERENCES tbl_library_branch (library_branch_BranchID)
        ON DELETE CASCADE
);

-- TABLE FOR BOOK_LOANS -- book loan details 

CREATE TABLE tbl_book_loans (
    book_loans_LoansID INT PRIMARY KEY AUTO_INCREMENT,
    book_loans_BookID INT NOT NULL,
    book_loans_BranchID INT NOT NULL,
    book_loans_CardNo INT NOT NULL,
    book_loans_DateOut VARCHAR(255),
    book_loans_DueDate VARCHAR(255),
    FOREIGN KEY (book_loans_BookID)
        REFERENCES tbl_book (book_BookID)
        ON DELETE CASCADE,
    FOREIGN KEY (book_loans_BranchID)
        REFERENCES tbl_library_branch (library_branch_BranchID)
        ON DELETE CASCADE,
    FOREIGN KEY (book_loans_CardNo)
        REFERENCES tbl_borrower (borrower_CardNo)
        ON DELETE CASCADE
);

-- after importing the data into tables  -- now checking the tables

SELECT 
    *
FROM
    tbl_book;
SELECT 
    *
FROM
    tbl_book_authors;
SELECT 
    *
FROM
    tbl_book_copies;
SELECT 
    *
FROM
    tbl_book_loans;
SELECT 
    *
FROM
    tbl_borrower;
SELECT 
    *
FROM
    tbl_library_branch;
SELECT 
    *
FROM
    tbl_publisher;
