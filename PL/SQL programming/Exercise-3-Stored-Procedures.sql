# Creation of Tables
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

#Insertion Sample Data
  
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


   Exercise 3 : Stored Procedures
  

   Scenario 1
   Process Monthly Interest
  
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';
    COMMIT;

END;
/

  
BEGIN
    ProcessMonthlyInterest;
END;
/

-- Output Verification
SELECT * FROM Accounts;



   Scenario 2
   Update Employee Bonus
  

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department VARCHAR2,
    p_bonus NUMBER

)

IS

BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus / 100)
    WHERE Department = p_department;
    COMMIT;
END;
/

BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/

-- Output Verification
SELECT * FROM Employees;



   Scenario 3
   Transfer Funds


SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from NUMBER,
    p_to NUMBER,
    p_amount NUMBER
)

IS

    v_balance NUMBER;

BEGIN
    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_from;
    IF v_balance >= p_amount THEN
        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountID = p_from;
        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountID = p_to;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Transfer Successful');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
    END IF;
END;
/
BEGIN
    TransferFunds(201,202,3000);
END;
/

-- Output Verification
SELECT * FROM Accounts;
