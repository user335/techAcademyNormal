use master
IF EXISTS(select * from sys.databases where name='user335sLibManSys')
DROP DATABASE user335sLibManSys


CREATE DATABASE user335sLibManSys
GO
use user335sLibManSys


CREATE TABLE tbl_libraryBranch (
BranchID int PRIMARY KEY IDENTITY (1,1) NOT NULL,
BranchName varchar(100) NOT NULL,
vcAddress varchar(100) NOT NULL
);
CREATE TABLE tbl_publisher (
PublisherName varchar(100) PRIMARY KEY NOT NULL,
vcAddress varchar(100) NOT NULL,
Phone varchar(100) NOT NULL
);
CREATE TABLE tbl_books(
BookID int PRIMARY KEY IDENTITY (100,1) NOT NULL,
Title varchar(100) NOT NULL,
PublisherName varchar(100) NOT NULL 
);
CREATE TABLE tbl_bookAuthors(
BookID int NOT NULL,
AuthorName varchar(100) NOT NULL
);
CREATE TABLE tbl_bookCopies(
BookID int NOT NULL,
BranchID int NOT NULL,
NumberOfCopies int NOT NULL
);
CREATE TABLE tbl_bookLoans(
BookID int NOT NULL,
BranchID int NOT NULL,
CardNo int NOT NULL,
DateOut varchar(50) NOT NULL,
DateDue varchar(50) NOT NULL
);
CREATE TABLE tbl_borrower(
CardNo int PRIMARY KEY IDENTITY (200, 1) NOT NULL,
Name varchar(50) NOT NULL,
vcAddress varchar(100) NOT NULL,
Phone varchar(15) NOT NULL
);




ALTER TABLE tbl_books 
	ADD CONSTRAINT fk_books_PublisherName FOREIGN KEY (PublisherName) 
	REFERENCES tbl_publisher (PublisherName) ON DELETE CASCADE ON UPDATE CASCADE
	;
GO

ALTER TABLE tbl_bookAuthors 
	ADD CONSTRAINT fk_bookAuthors_BookID FOREIGN KEY (BookID) 
	REFERENCES tbl_books (BookID) ON DELETE CASCADE ON UPDATE CASCADE
	;
GO

ALTER TABLE tbl_bookCopies ADD 
	CONSTRAINT fk_bookCopies_BookID FOREIGN KEY (BookID) 
	REFERENCES tbl_books (BookID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_bookCopies_BranchID FOREIGN KEY (BranchID) 
	REFERENCES tbl_libraryBranch (BranchID) ON DELETE CASCADE ON UPDATE CASCADE
	;
GO

ALTER TABLE tbl_bookLoans ADD 
	CONSTRAINT fk_bookLoans_BookID FOREIGN KEY (BookID) 
	REFERENCES tbl_books (BookID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_bookLoans_BranchID FOREIGN KEY (BranchID) 
	REFERENCES tbl_libraryBranch (BranchID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_borrower_cardNo FOREIGN KEY (CardNo) 
	REFERENCES tbl_borrower (CardNo) ON DELETE CASCADE ON UPDATE CASCADE
	;
GO

INSERT INTO tbl_libraryBranch
(BranchName, vcAddress)
VALUES
('Central','16932 E Central Park Ave.'),
('Sharpstown','2858 Sharps Way'),
('Dullsville','5 Dulls Rd.'),
('Anticentral','94178 Away Way')
;

INSERT INTO tbl_publisher
(PublisherName, vcAddress, Phone)
VALUES
('Penguin Random House', '1745 Broadway', '1-800-733-3000'),
('Harper Collins', '195 Broadway', '(212) 207-7000'),
('Simon & Schuster', '1230 6th Ave', '(212) 698-7000'),
('Hachette Book Group', '1290 6th Ave', '(212) 364-1100')
;

INSERT INTO tbl_books
(Title, PublisherName)
VALUES
('The Lost Tribe','Hachette Book Group'),
('Don Quixote','Penguin Random House'),
('1984','Penguin Random House'),
('Ulysses','Penguin Random House'),
('When Breath Becomes Air','Penguin Random House'),
('The Woman in Cabin 10','Harper Collins'),
('The Couple Next Door','Harper Collins'),
('Small Great Things','Harper Collins'),
('Dark Matter','Harper Collins'),
('A Gentleman in Moscow','Harper Collins'),
('Lilac Girls','Simon & Schuster'),
('It Ends with Us','Simon & Schuster'),
('The Nest','Simon & Schuster'),
('The Sun Is Also a Star','Simon & Schuster'),
('Salt to the Sea','Simon & Schuster'),
('Homegoing','Simon & Schuster'),
('All the Ugly and Wonderful Things','Hachette Book Group'),
('Commonwealth','Hachette Book Group'),
('The Power','Hachette Book Group'),
('Heartless','Hachette Book Group'),
('The Gunslinger','Hachette Book Group'),
('Carrie','Hachette Book Group')
;

INSERT INTO tbl_bookAuthors
(BookID, AuthorName)
VALUES
(100, 'Edward Marriott'),
(101, 'Miguel de Cervantes'),
(102, 'George Orwell'),
(103, 'James Joyce'),
(104, 'Paul Kalanithi'),
(105, 'Ruth Ware'),
(106, 'Shari Lapena'),
(107, 'Jodi Picoult'),
(108, 'Blake Crouch'),
(109, 'Amor Towles'),
(110, 'Martha Hall Kelly'),
(111, 'Colleen Hoover'),
(112, 'Cynthia Sweeny'),
(113, 'Nicola Yoon'),
(114, 'Ruta Sepetys'),
(115, 'Yaa Gyasi'),
(116, 'Bryn Greenwood'),
(117, 'Ann Patchett'),
(118, 'Naomi Alderman'),
(119, 'Marissa Meyer'),
(120, 'Steven King'),
(121, 'Steven King')
;

INSERT INTO tbl_bookCopies
(BookID, BranchID, NumberOfCopies)
VALUES
(100, 1, 4),
(100, 2, 3),
(100, 3, 2),
(101, 1, 2),
(101, 2, 3),
(102, 3, 2),
(102, 4, 4),
(103, 2, 2),
(103, 3, 5),
(104, 4, 3),
(104, 2, 6),
(104, 1, 2),
(105, 2, 3),
(105, 3, 4),
(105, 4, 2),
(106, 3, 2),
(106, 4, 4),
(107, 2, 5),
(107, 4, 6),
(108, 1, 3),
(108, 3, 2),
(108, 4, 4),
(109, 1, 2),
(109, 2, 2),
(110, 2, 4),
(110, 3, 2),
(111, 2, 2),
(111, 4, 3),
(112, 1, 2),
(112, 2, 2),
(112, 3, 2),
(112, 4, 2),
(113, 2, 2),
(113, 4, 2),
(114, 1, 2),
(114, 3, 2),
(115, 1, 2),
(115, 2, 5),
(115, 4, 3),
(116, 1, 6),
(116, 3, 3),
(117, 1, 2),
(117, 2, 4),
(117, 3, 2),
(118, 2, 2),
(118, 4, 4),
(119, 1, 3),
(119, 2, 5),
(119, 4, 2),
(120, 1, 2),
(120, 3, 6),
(121, 1, 2),
(121, 2, 3),
(121, 3, 2),
(121, 4, 4)
;
INSERT INTO tbl_borrower
(Name, vcAddress, Phone)
VALUES 
('Phil Gracy', '182 N Frontage Road', '998-644-1714'),
('Janet Spencer', '8583 E Main St', '233-858-4716'),
('Rebecca Romaine', '532 N Blue Road', '234-346-1114'),
('Stacy Bonnet', '122 S Mexico Ave', '346-258-1216'),
('Phoebe Lawrence', '355 N California Drive', '544-338-5716'),
('Jill Hynes', '277 W Stagecoach Road', '664-356-1716'),
('Phillis Smith', '5532 N Hindenberg Road', '428-228-1216'),
('Sarah Blanche', '12334 E Bright St', '532-811-1346'),
('Judy Svensson', '4444 W Ikea Way', '255-473-4623'),
('Steve McBean', '9938 W Camry Dr #1', '523-475-1233'),
('Bill Putz', '9938 W Camry Dr #2', '523-475-1234')
;

INSERT INTO tbl_bookLoans 
(BookID,BranchID,CardNo,DateOut,DateDue)
VALUES
(100, 1, 201, '10/01/2018', '10/15/2018'),
(100, 2, 206, '10/01/2018', '10/15/2018'),
(100, 3, 207, '10/01/2018', '10/15/2018'),
(100, 4, 200, '10/01/2018', '10/15/2018'),
(101, 1, 201, '10/01/2018', '10/15/2018'),
(101, 2, 202, '10/01/2018', '10/15/2018'),
(102, 3, 201, '10/01/2018', '10/15/2018'),
(102, 4, 203, '10/01/2018', '10/15/2018'),
(103, 2, 202, '10/01/2018', '10/15/2018'),
(103, 3, 206, '10/01/2018', '10/15/2018'),
(104, 4, 201, '10/01/2018', '10/15/2018'),
(104, 2, 202, '10/01/2018', '10/15/2018'),
(104, 1, 205, '10/01/2018', '10/15/2018'),
(105, 2, 204, '10/01/2018', '10/15/2018'),
(105, 4, 208, '10/01/2018', '10/15/2018'),
(106, 3, 203, '10/01/2018', '10/15/2018'),
(106, 4, 204, '10/02/2018', '10/16/2018'),
(107, 2, 205, '10/02/2018', '10/16/2018'),
(107, 4, 206, '10/02/2018', '10/16/2018'),
(108, 1, 201, '10/02/2018', '10/16/2018'),
(108, 3, 205, '10/02/2018', '10/16/2018'),
(109, 1, 202, '10/02/2018', '10/16/2018'),
(109, 2, 206, '10/02/2018', '10/16/2018'),
(110, 2, 205, '10/02/2018', '10/16/2018'),
(110, 3, 207, '10/02/2018', '10/16/2018'),
(111, 2, 200, '10/02/2018', '10/16/2018'),
(111, 4, 206, '10/02/2018', '10/16/2018'),
(112, 1, 202, '10/03/2018', '10/17/2018'),
(112, 3, 204, '10/03/2018', '10/17/2018'),
(112, 4, 206, '10/03/2018', '10/17/2018'),
(113, 2, 201, '10/03/2018', '10/17/2018'),
(113, 4, 206, '10/03/2018', '10/17/2018'),
(114, 1, 202, '10/03/2018', '10/17/2018'),
(114, 3, 203, '10/03/2018', '10/17/2018'),
(115, 2, 205, '10/03/2018', '10/17/2018'),
(115, 4, 200, '10/03/2018', '10/17/2018'),
(116, 1, 202, '10/04/2018', '10/18/2018'),
(116, 3, 203, '10/04/2018', '10/18/2018'),
(117, 1, 201, '10/04/2018', '10/18/2018'),
(117, 2, 206, '10/04/2018', '10/18/2018'),
(117, 3, 207, '10/04/2018', '10/18/2018'),
(118, 2, 202, '10/04/2018', '10/18/2018'),
(118, 4, 207, '10/04/2018', '10/18/2018'),
(119, 1, 201, '10/04/2018', '10/18/2018'),
(119, 2, 200, '10/04/2018', '10/18/2018'),
(120, 1, 203, '10/04/2018', '10/18/2018'),
(120, 3, 208, '10/05/2018', '10/19/2018'),
(121, 2, 204, '10/05/2018', '10/19/2018'),
(121, 3, 200, '10/05/2018', '10/19/2018'),
(121, 4, 203, '10/05/2018', '10/19/2018')
;

GO
CREATE PROC proc1 
AS
BEGIN
	SELECT tbl_bookCopies.NumberOfCopies, tbl_books.Title, 
	tbl_libraryBranch.BranchName, tbl_libraryBranch.vcAddress
	FROM tbl_libraryBranch 
	INNER JOIN tbl_bookCopies ON tbl_bookCopies.BranchID = tbl_libraryBranch.BranchID
	INNER JOIN tbl_books ON tbl_books.BookID = tbl_bookCopies.BookID
	WHERE BranchName = 'Sharpstown' AND Title = 'The Lost Tribe'
END
GO

CREATE PROC proc2
AS
BEGIN
	SELECT 
	tbl_bookCopies.NumberOfCopies,
	tbl_libraryBranch.BranchName, tbl_books.Title
	FROM tbl_libraryBranch 
	INNER JOIN tbl_bookCopies ON tbl_bookCopies.BranchID = tbl_libraryBranch.BranchID
	INNER JOIN tbl_books ON tbl_books.BookID = tbl_bookCopies.BookID
	WHERE Title = 'The Lost Tribe';
END

GO
CREATE PROC proc3
AS
BEGIN
	SELECT 
	tbl_borrower.Name, tbl_borrower.CardNo
	FROM tbl_borrower 
	LEFT JOIN tbl_bookLoans ON tbl_bookLoans.CardNo = tbl_borrower.CardNo
	WHERE tbl_borrower.CardNo NOT IN
		(SELECT CardNo FROM tbl_bookLoans)
END



GO
CREATE PROC proc4
AS
BEGIN
	SELECT tbl_books.Title AS 'Book Title',
	tbl_borrower.Name AS 'Borrower''s Name', tbl_borrower.vcAddress AS 'Borrower''s Address', 
	tbl_bookLoans.DateDue,
	tbl_bookLoans.DateOut, tbl_libraryBranch.BranchName, tbl_libraryBranch.vcAddress AS 'Branch Address'
	FROM tbl_libraryBranch 
	INNER JOIN tbl_bookLoans ON tbl_bookLoans.BranchID = tbl_libraryBranch.BranchID
	INNER JOIN tbl_borrower ON tbl_borrower.CardNo = tbl_bookLoans.CardNo
	INNER JOIN tbl_books ON tbl_books.BookID = tbl_bookLoans.BookID
	WHERE tbl_libraryBranch.BranchID = 2 AND DateDue = '10/15/2018';
END;
GO
CREATE PROC proc5
AS
BEGIN
	SELECT 
		tbl_libraryBranch.BranchName, 
		COUNT(tbl_bookLoans.BranchID) 'Total Number of Books Loaned Out', tbl_libraryBranch.BranchID
	FROM tbl_libraryBranch
	INNER JOIN tbl_bookLoans ON tbl_bookLoans.BranchID = tbl_libraryBranch.BranchID
	GROUP BY tbl_libraryBranch.BranchName, tbl_libraryBranch.BranchID
END

GO
CREATE PROC proc6
AS
BEGIN
	SELECT
	tbl_borrower.Name, tbl_borrower.vcAddress AS 'Address', 
	COUNT(tbl_bookLoans.CardNo) 'Total Number of Books Borrowed', tbl_borrower.CardNo
	FROM tbl_borrower
	INNER JOIN tbl_bookLoans ON tbl_bookLoans.CardNo = tbl_borrower.CardNo
	GROUP BY tbl_bookLoans.CardNo, tbl_borrower.Name, tbl_borrower.vcAddress, tbl_borrower.CardNo
	HAVING COUNT (tbl_borrower.CardNo) > 4;
END
GO
CREATE PROC proc7
AS
BEGIN

	SELECT
	tbl_bookAuthors.AuthorName, tbl_books.Title,
	tbl_libraryBranch.BranchName, tbl_bookCopies.NumberOfCopies
	FROM
	tbl_libraryBranch
	INNER JOIN tbl_bookCopies ON tbl_bookCopies.BranchID = tbl_libraryBranch.BranchID
	INNER JOIN tbl_books ON tbl_books.BookID = tbl_bookCopies.BookID
	INNER JOIN tbl_bookAuthors ON tbl_bookAuthors.BookID = tbl_books.BookID
	WHERE tbl_bookAuthors.AuthorName = 'Steven King' AND tbl_libraryBranch.BranchName = 'Central'

END
GO
proc1;
GO
proc2;
GO
proc3;
GO
proc4;
GO
proc5;
GO
proc6;
GO
proc7;
GO



















