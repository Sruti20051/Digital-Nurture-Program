# Creating Required Tables
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Age NUMBER,
    Balance NUMBER,
    IsVIP VARCHAR2(5)
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER,
    DueDate DATE
);

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(100),
    Department VARCHAR2(50),
    Salary NUMBER
);


#Insertion of Sample Data
INSERT INTO Customers VALUES (1,'Rahul',65,15000,'FALSE');
INSERT INTO Customers VALUES (2,'Priya',45,8000,'FALSE');
INSERT INTO Customers VALUES (3,'Amit',70,25000,'FALSE');

INSERT INTO Loans VALUES (101,1,8.5,SYSDATE+20);
INSERT INTO Loans VALUES (102,2,9.0,SYSDATE+50);
INSERT INTO Loans VALUES (103,3,7.5,SYSDATE+15);

INSERT INTO Accounts VALUES (201,1,'Savings',10000);
INSERT INTO Accounts VALUES (202,2,'Savings',20000);
INSERT INTO Accounts VALUES (203,3,'Current',15000);

INSERT INTO Employees VALUES (301,'John','IT',50000);
INSERT INTO Employees VALUES (302,'Mary','IT',60000);
INSERT INTO Employees VALUES (303,'David','HR',45000);

COMMIT;

   Exercise 1 : Control Structures
 Scenario 1
   Apply a 1% discount to loan interest rates for customers
   above 60 years of age.
BEGIN
    FOR c IN (
        SELECT CustomerID
        FROM Customers
        WHERE Age > 60
    )
    LOOP
        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE CustomerID = c.CustomerID;
    END LOOP;
    COMMIT;
END;
/

-- Output Verification
SELECT * FROM Loans;

   Scenario 2
   Promote customers with balance greater than 10000
   to VIP.

BEGIN
    FOR c IN (
        SELECT CustomerID
        FROM Customers
        WHERE Balance > 10000
    )
    LOOP
        UPDATE Customers
        SET IsVIP = 'TRUE'
        WHERE CustomerID = c.CustomerID;
    END LOOP;
    COMMIT;
END;
/

-- Output Verification
SELECT * FROM Customers;

   Scenario 3
   Print reminder messages for loans due within
   the next 30 days.


SET SERVEROUTPUT ON;

BEGIN
    FOR loan IN (
        SELECT c.Name,
               l.DueDate
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID
        WHERE l.DueDate
              BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: '
            || loan.Name
            || ' - Loan Due on '
            || loan.DueDate
        );
    END LOOP;
END;
/

-- Expected Output
-- Reminder: Rahul - Loan Due on ...
-- Reminder: Amit - Loan Due on ...
