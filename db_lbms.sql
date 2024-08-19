
-- create database lbms;
CREATE DATABASE IF NOT EXISTS digital_library_system;

-- use lbms;
USE digital_library_system;

-- create table user for user information.
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    password_key VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    profile VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL CHECK(role IN ('Admin', 'Librarian', 'Member')),
    status VARCHAR(255) NOT NULL CHECK(status IN ('Active', 'Banned', 'Pending')),
    registration_date VARCHAR(255) NOT NULL
);

-- create table for book author information.
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(255) NOT NULL,
    author_profile VARCHAR(255) NOT NULL,
    author_Biography VARCHAR(255) NOT NULL
);

-- create table for book genre information.
CREATE TABLE genre (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(255) NOT NULL
);

-- create table for book publisher information.
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(255) NOT NULL,
    publisher_profile VARCHAR(255) NOT NULL,
    publisher_address VARCHAR(255) NOT NULL,
    publisher_email VARCHAR(255) NOT NULL,
    publisher_phone_number VARCHAR(255) NOT NULL
);

-- create table for book shelf location information.
CREATE TABLE shelf_location (
    shelf_id INT PRIMARY KEY AUTO_INCREMENT,
    shelf_location VARCHAR(255) NOT NULL
);

-- create table book for physical book and ebook information. 
CREATE TABLE physical_book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    ISBN CHAR(13) NOT NULL,
    title VARCHAR(255) NOT NULL,
    cover VARCHAR(255) NOT NULL,
    genre_id VARCHAR(255) NOT NULL REFERENCES genre(genre_id) ON DELETE CASCADE,
    author_id VARCHAR(255) NOT NULL REFERENCES author(author_id) ON DELETE CASCADE,
    publisher_id VARCHAR(255) NOT NULL REFERENCES publisher(publisher_id) ON DELETE CASCADE,
    publish_date DATE NOT NULL,
    shelf_id INT NOT NULL REFERENCES shelf_location(shelf_id) ON DELETE CASCADE,
    quantity INT NOT NULL,
    status VARCHAR(255) NOT NULL CHECK(status IN ('Available', 'Unavailable')) ,
    registration_date VARCHAR(255) NOT NULL
);

CREATE TABLE ebook (
    ISBN CHAR(13) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    cover VARCHAR(255) NOT NULL,
    genre_id VARCHAR(255) NOT NULL REFERENCES genre(genre_id) ON DELETE CASCADE,
    author_id VARCHAR(255) NOT NULL REFERENCES author(author_id) ON DELETE CASCADE,
    publisher_id VARCHAR(255) NOT NULL REFERENCES publisher(publisher_id) ON DELETE CASCADE,
    publish_date DATE NOT NULL,
    url VARCHAR(255) NOT NULL
);

-- create table for physical book borrowing information.
CREATE TABLE physical_borrow (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL REFERENCES user(user_id) ON DELETE CASCADE,
    ISBN CHAR(13) NOT NULL REFERENCES physical_book(ISBN) ON DELETE CASCADE,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE NOT NULL,
    status VARCHAR(255) NOT NULL CHECK(status IN ('Borrowed', 'Returned')),
    pay_amount VARCHAR(255),
    fine DECIMAL(10, 2) Default 0
);

-- create table for ebook borrowing information.
CREATE TABLE ebook_borrow (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL REFERENCES user(user_id) ON DELETE CASCADE,
    ISBN CHAR(13) NOT NULL REFERENCES ebook(ISBN) ON DELETE CASCADE,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(255) NOT NULL CHECK(status IN ('Borrowed', 'Returned')) 
);

-- create trigger for physical book borrowing.
DELIMITER //
CREATE TRIGGER physical_borrow_trigger
BEFORE INSERT ON physical_borrow
FOR EACH ROW
BEGIN
    DECLARE available_quantity INT;

    -- Get the current quantity of the book
    SELECT quantity INTO available_quantity FROM physical_book WHERE ISBN = NEW.ISBN;

    -- Check if the book is available
    IF available_quantity = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book is not available';
    ELSE
        -- Update the quantity of the book
        UPDATE physical_book SET quantity = quantity - 1 WHERE ISBN = NEW.ISBN;

        -- Update the status if quantity reaches 0
        IF available_quantity - 1 = 0 THEN
            UPDATE physical_book SET status = 'Unavailable' WHERE ISBN = NEW.ISBN;
        END IF;
    END IF;
END;
//


-- create trigger for physical book returning.
DELIMITER //

CREATE TRIGGER physical_return_trigger
BEFORE UPDATE ON physical_borrow
FOR EACH ROW
BEGIN
    DECLARE current_quantity INT;

    -- Only proceed if the status is being changed to 'Returned'
    IF NEW.status = 'Returned' AND OLD.status != 'Returned' THEN
        -- Update the quantity of the book
        UPDATE physical_book 
        SET quantity = quantity + 1 
        WHERE ISBN = NEW.ISBN;

        -- Get the current quantity of the book
        SELECT quantity INTO current_quantity 
        FROM physical_book 
        WHERE ISBN = NEW.ISBN
        LIMIT 1;  -- Ensure only one row is selected

        -- Update the status if quantity is greater than 0 and status is 'Unavailable'
        IF current_quantity > 0 THEN
            UPDATE physical_book 
            SET status = 'Available' 
            WHERE ISBN = NEW.ISBN
            LIMIT 1;  -- Ensure only one row is affected
        END IF;
    END IF;
END;
//



-- create trigger for fine calculation.
DELIMITER //

CREATE TRIGGER fine_trigger
BEFORE UPDATE ON physical_borrow
FOR EACH ROW
BEGIN
    DECLARE daily_rate DECIMAL(10,2);

    -- Get pay amount from physical_book table
    SELECT pay_amount INTO daily_rate
    FROM physical_borrow
    WHERE ISBN = NEW.ISBN
    LIMIT 1;  -- Ensure only one row is returned

    -- Set the new pay_amount
    SET NEW.pay_amount = daily_rate;

    -- Calculate fine if return_date is greater than due_date
    IF NEW.return_date > NEW.due_date THEN
        SET NEW.fine = DATEDIFF(NEW.return_date, NEW.due_date) * (daily_rate * 0.5);
    ELSE
        SET NEW.fine = 0;
    END IF;
END;
//


-- create trigger for ebook returning when due date is passed.
DELIMITER //

CREATE TRIGGER ebook_return_trigger
BEFORE UPDATE ON ebook_borrow
FOR EACH ROW
BEGIN
    -- Check if the due date is in the past
    IF NEW.due_date < CURDATE() THEN
        -- Set the status to 'Returned'
        SET NEW.status = 'Returned';
    END IF;
END;
//
