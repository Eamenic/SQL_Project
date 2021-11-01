CREATE TABLE Interest_Rate (
Account_Type_Code VARCHAR (50) NOT NULL,
Current_Interest_Rate NUMERIC (5,3),
CONSTRAINT Account_Type_Code_PK PRIMARY KEY (Account_Type_Code)
);

CREATE TABLE Accounts (
Account_Number INT NOT NULL AUTO_INCREMENT,
Account_Type_Code VARCHAR (50) NOT NULL,
Current_Balance NUMERIC(10,3),
CONSTRAINT Account_Number_PK PRIMARY KEY (Account_Number),
CONSTRAINT Account_Type_Code_FK FOREIGN KEY (Account_Type_Code)
REFERENCES Interest_Rate (Account_Type_Code)
ON UPDATE NO ACTION
ON DELETE NO ACTION
);
ALTER TABLE Accounts AUTO_INCREMENT = 10000;

INSERT INTO Interest_Rate
(Account_Type_Code, Current_Interest_Rate)
VALUES ('Checking', 0.001);
INSERT INTO Interest_Rate
(Account_Type_Code, Current_Interest_Rate)
VALUES ('Savings', 0.025);

INSERT INTO Interest_Rate
(Account_Type_Code, Current_Interest_Rate)
VALUES ('Loan', 0.000);
INSERT INTO Interest_Rate
(Account_Type_Code, Current_Interest_Rate)
VALUES ('CD', 0.000)
;

INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10000, 'Loan', 100.101);
INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10001, 'Loan', -1.01);
INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10002, 'CD', 300.121);
INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10003, 'Savings', 400.131);
INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10004, 'Checking', 500.141);
INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10005, 'Loan', 600.151);
INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10006, 'Loan', 700.161);
INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10007, 'Savings', 800.171);
INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10008, 'Savings', 900.181);
INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10009, 'Checking', 1000.191);

CREATE TABLE Transactions (
Transaction_ID INT NOT NULL AUTO_INCREMENT,
Transaction_Type_Code VARCHAR (50) NOT NULL,
Initiator_ID INT NOT NULL,
Transaction_Amt NUMERIC (10,3),
CONSTRAINT Transaction_ID_PK PRIMARY KEY (Transaction_ID)
);
ALTER TABLE Transactions AUTO_INCREMENT = 30000;

CREATE TABLE Accounts_Transactions_Int (
Account_Number INT NOT NULL,
Transaction_ID INT NOT NULL,
CONSTRAINT Account_Number_FK FOREIGN KEY (Account_Number)
REFERENCES Accounts (Account_Number)
ON UPDATE NO ACTION
ON DELETE NO ACTION,
CONSTRAINT Transaction_ID_FK FOREIGN KEY (Transaction_ID)
REFERENCES Transactions (Transaction_ID)
ON UPDATE NO ACTION
ON DELETE NO ACTION
);

INSERT INTO Transactions
(Transaction_ID, Transaction_Type_Code, Initiator_ID, Transaction_Amt)
VALUES (30000, 'Deposit', 1, 0.01);
INSERT INTO Transactions
(Transaction_ID, Transaction_Type_Code, Initiator_ID, Transaction_Amt)
VALUES (30001, 'Deposit', 2, 0.01);
INSERT INTO Transactions
(Transaction_ID, Transaction_Type_Code, Initiator_ID, Transaction_Amt)
VALUES (30002, 'Withdraw', 3, 0.01);
INSERT INTO Transactions
(Transaction_ID, Transaction_Type_Code, Initiator_ID, Transaction_Amt)
VALUES (30003, 'Transfer', 4, 0.01);
INSERT INTO Transactions
(Transaction_ID, Transaction_Type_Code, Initiator_ID, Transaction_Amt)
VALUES (30004, 'Deposit', 1, 0.01);
INSERT INTO Transactions
(Transaction_ID, Transaction_Type_Code, Initiator_ID, Transaction_Amt)
VALUES (30005, 'Pmtreceived', 6, 0.01);
INSERT INTO Transactions
(Transaction_ID, Transaction_Type_Code, Initiator_ID, Transaction_Amt)
VALUES (30006, 'Withdraw', 7, 0.01);
INSERT INTO Transactions
(Transaction_ID, Transaction_Type_Code, Initiator_ID, Transaction_Amt)
VALUES (30007, 'Deposit', 7, 0.01);
INSERT INTO Transactions
(Transaction_ID, Transaction_Type_Code, Initiator_ID, Transaction_Amt)
VALUES (30008, 'Pmtreceived', 8, 0.01);
INSERT INTO Transactions
(Transaction_ID, Transaction_Type_Code, Initiator_ID, Transaction_Amt)
VALUES (30009, 'Transfer', 1, 0.01);

INSERT INTO Accounts_Transactions_Int
(Account_Number, Transaction_ID)
VALUES (10007, 30000);
INSERT INTO Accounts_Transactions_Int
(Account_Number, Transaction_ID)
VALUES (10008, 30001);
INSERT INTO Accounts_Transactions_Int
(Account_Number, Transaction_ID)
VALUES (10008, 30002);
INSERT INTO Accounts_Transactions_Int
(Account_Number, Transaction_ID)
VALUES (10000, 30003);
INSERT INTO Accounts_Transactions_Int
(Account_Number, Transaction_ID)
VALUES (10007, 30004);
INSERT INTO Accounts_Transactions_Int
(Account_Number, Transaction_ID)
VALUES (10001, 30005);
INSERT INTO Accounts_Transactions_Int
(Account_Number, Transaction_ID)
VALUES (10005, 30006);
INSERT INTO Accounts_Transactions_Int
(Account_Number, Transaction_ID)
VALUES (10005, 30007);
INSERT INTO Accounts_Transactions_Int
(Account_Number, Transaction_ID)
VALUES (10005, 30008);
INSERT INTO Accounts_Transactions_Int
(Account_Number, Transaction_ID)
VALUES (10007, 30009);

CREATE TABLE Members (
Member_ID INT NOT NULL AUTO_INCREMENT,
First_Name VARCHAR (50) NOT NULL,
Last_Name VARCHAR (50) NOT NULL,
SSN NUMERIC (9) NOT NULL,
Phone_Number NUMERIC (10),
Email_Address VARCHAR (50) NOT NULL,
CONSTRAINT Member_ID_PK PRIMARY KEY (Member_ID)
);

INSERT INTO Members
(Member_ID, First_Name, Last_Name, SSN, Phone_Number, Email_Address)
VALUES (1, 'Abbey', 'Kilo', 111122220, 1112223333, 'A.Kilo@gmail.com');
INSERT INTO Members
(Member_ID, First_Name, Last_Name, SSN, Phone_Number, Email_Address)
VALUES (2, 'Bob', 'Lema', 111133330, 1113332222, 'B.Lema@gmail.com');
INSERT INTO Members
(Member_ID, First_Name, Last_Name, SSN, Phone_Number, Email_Address)
VALUES (3, 'Carole', 'Mike', 111144440, 1114442222, 'C.Mike@gmail.com');
INSERT INTO Members
(Member_ID, First_Name, Last_Name, SSN, Phone_Number, Email_Address)
VALUES (4, 'Dean', 'November', 111155550, 1115552222, 'D.November@gmail.com');
INSERT INTO Members
(Member_ID, First_Name, Last_Name, SSN, Phone_Number, Email_Address)
VALUES (5, 'Eve', 'Oscar', 111166660, 1116663333, 'E.Oscar@gmail.com');
INSERT INTO Members
(Member_ID, First_Name, Last_Name, SSN, Phone_Number, Email_Address)
VALUES (6, 'Finn', 'Papa', 111177770, 2223334545, 'F.Papa@gmail.com');
INSERT INTO Members
(Member_ID, First_Name, Last_Name, SSN, Phone_Number, Email_Address)
VALUES (7, 'Gwen', 'Dolan', 222211110, 2221110000, 'G.Dolan@gmail.com');
INSERT INTO Members
(Member_ID, First_Name, Last_Name, SSN, Phone_Number, Email_Address)
VALUES (8, 'Henry', 'Romeo', 222233330, 2224440000, 'H.Romeo@gmail.com');
INSERT INTO Members
(Member_ID, First_Name, Last_Name, SSN, Phone_Number, Email_Address)
VALUES (9, 'Indica', 'Sierra', 333344440, 3335550000, 'I.Sierra@gmail.com');
INSERT INTO Members
(Member_ID, First_Name, Last_Name, SSN, Phone_Number, Email_Address)
VALUES (10, 'Josh', 'Tango', 333355558, 3335557777, 'J.Tango@gmail.com');

CREATE TABLE Type_Of_Owner (
Account_Number INT NOT NULL,
Member_ID INT NOT NULL,
Member_Type VARCHAR (50) NOT NULL,
CONSTRAINT Account_Number_FK1 FOREIGN KEY (Account_Number)
REFERENCES Accounts (Account_Number)
ON UPDATE NO ACTION
ON DELETE NO ACTION,
CONSTRAINT Member_ID_FK FOREIGN KEY (Member_ID)
REFERENCES Members (Member_ID)
ON UPDATE NO ACTION
ON DELETE NO ACTION
);
ALTER TABLE Type_Of_Owner AUTO_INCREMENT = 10000;

INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10000, 1, 'Owner');
INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10001, 2, 'Owner');
INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10002, 3, 'Owner');
INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10003, 4, 'Owner');
INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10004, 5, 'Owner');
INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10005, 6, 'Joint');
INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10006, 7, 'Joint');
INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10007, 8, 'Joint');
INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10008, 9, 'Joint');
INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10009, 10, 'Joint');

CREATE TABLE Message (
Message_ID INT NOT NULL AUTO_INCREMENT,
Message VARCHAR (150) NULL,
CONSTRAINT Message_ID_PK PRIMARY KEY (Message_ID)
);
ALTER TABLE Message AUTO_INCREMENT = 20000;

CREATE TABLE Members_Message_Int (
Member_ID INT NOT NULL,
Message_ID INT NOT NULL,
CONSTRAINT Member_ID_FK2 FOREIGN KEY (Member_ID)
REFERENCES Members (Member_ID)
ON UPDATE NO ACTION
ON DELETE NO ACTION,
CONSTRAINT Message_ID_FK FOREIGN KEY (Message_ID)
REFERENCES Message (Message_ID)
ON UPDATE NO ACTION
ON DELETE NO ACTION
);

INSERT INTO Message
(Message_ID, Message)
VALUES (20000, 'Oh Hi Mark');
INSERT INTO Message
(Message_ID, Message)
VALUES (20001, 'Check you account for fraudulent activity');
INSERT INTO Message
(Message_ID, Message)
VALUES (20002, 'All your bases are below to…');
INSERT INTO Message
(Message_ID, Message)
VALUES (20003, 'Loan payments have defaulted');
INSERT INTO Message
(Message_ID, Message)
VALUES (20004, '!');
INSERT INTO Message
(Message_ID, Message)
VALUES (20005, '');
INSERT INTO Message
(Message_ID, Message)
VALUES (20006, 'Open the blast doors');
INSERT INTO Message
(Message_ID, Message)
VALUES (20007, 'Space… the final frontier');
INSERT INTO Message
(Message_ID, Message)
VALUES (20008, 'These are the voyages of the U.S.S. Enterprise');
INSERT INTO Message
(Message_ID, Message)
VALUES (20009, 'I also like Star Trek and Star Wars');

INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (1, 20009);
INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (1, 20008);
INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (2, 20007);
INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (2, 20006);
INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (4, 20005);
INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (5, 20004);
INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (7, 20003);
INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (7, 20002);
INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (9, 20001);
INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (10, 20000);

CREATE TABLE Member_Addresses (
Member_ID INT NOT NULL AUTO_INCREMENT,
Street_Number INT NOT NULL,
Street VARCHAR (75) NOT NULL,
City VARCHAR (50) NOT NULL,
State VARCHAR (50) NOT NULL,
Zip_Code INT NOT NULL,
CONSTRAINT Member_ID_PK3 PRIMARY KEY (Member_ID)
);
ALTER TABLE Member_Addresses
ADD Country VARCHAR (50)
AFTER State;

INSERT INTO Member_Addresses
(Member_ID, Street_Number, Street, City, State, Country, Zip_Code)
VALUES (1, 111, 'Avalon Ave', 'Dover',  'Delaware', 'United States of America', 12345);
INSERT INTO Member_Addresses
(Member_ID, Street_Number, Street, City, State, Country, Zip_Code)
VALUES (2, 222, 'Mass Ave', 'Boston', 'Massachusetts', 'United States of America', 11223);
INSERT INTO Member_Addresses
(Member_ID, Street_Number, Street, City, State, Country, Zip_Code)
VALUES (3, 333, 'Commonwealth Ave', 'Boise', 'Idaho', 'United States of America', 23567);
INSERT INTO Member_Addresses
(Member_ID, Street_Number, Street, City, State, Country, Zip_Code)
VALUES (4, 444, 'State Street', 'Marietta', 'Ohio', 'United States of America', 78483);
INSERT INTO Member_Addresses
(Member_ID, Street_Number, Street, City, State, Country, Zip_Code)
VALUES (5, 555, 'Left Boul','Juno', 'Alaska', 'United States of America', 73334);
INSERT INTO Member_Addresses
(Member_ID, Street_Number, Street, City, State, Country, Zip_Code)
VALUES (6, 666, 'Right Lane', 'Honolulu', 'Hawaii', 'United States of America', 85564);
INSERT INTO Member_Addresses
(Member_ID, Street_Number, Street, City, State, Country, Zip_Code)
VALUES (7, 777, 'Old Country Rd', 'Scranton', 'Pennslyvannia', 'United States of America', 44567);
INSERT INTO Member_Addresses
(Member_ID, Street_Number, Street, City, State, Country, Zip_Code)
VALUES (8, 888, 'New Country Rd', 'Loving', 'Vermont', 'United States of America', 66456);
INSERT INTO Member_Addresses
(Member_ID, Street_Number, Street, City, State, Country, Zip_Code)
VALUES (9, 999, 'Right Ave', 'Albany', 'New York', 'United States of America', 77890);
INSERT INTO Member_Addresses
(Member_ID, Street_Number, Street, City, State, Country, Zip_Code)
VALUES (10, 223, 'Martin Luther King Rd', 'Austin', 'Texas', 'United States of America', 21145);

CREATE VIEW Hmm101 AS
SELECT Members.First_Name, Member_Addresses.City
FROM Members, Member_Addresses
WHERE Members.Member_ID = Member_Addresses.Member_ID;

CREATE TABLE Daily_Balance (
Account_Number INT NOT NULL AUTO_INCREMENT,
Daily_Balance_Date DATE NOT NULL,
Balance_EOD NUMERIC (10,3) NOT NULL,
CONSTRAINT Account_Number_PK2 PRIMARY KEY (Account_Number)
);
ALTER TABLE Daily_Balance AUTO_INCREMENT = 10000;

INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10000, '2020-11-22', 100.101);
INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10001, '2020-11-22', -1.01);
INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10002, '2020-11-22', 300.121);
INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10003, '2020-11-22', 400.131);
INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10004, '2020-11-22', 500.141);
INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10005, '2020-11-22', 600.151);
INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10006, '2020-11-22', 700.161);
INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10007, '2020-11-22', 800.171);
INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10008, '2020-11-22', 900.181);
INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10009, '2020-11-22', 1000.191);

CREATE VIEW Hmm102 AS
SELECT Accounts.Current_Balance, Daily_Balance.Daily_Balance_Date
FROM Accounts, Daily_Balance
WHERE Accounts.Account_Number = Daily_Balance.Account_Number;

CREATE TABLE Checking_Accounts (
Account_Number INT NOT NULL AUTO_INCREMENT,
Minimum_Balance_Status BOOLEAN NOT NULL,
Last_Interest_Date DATE NOT NULL,
CONSTRAINT Account_Number_PK3 PRIMARY KEY (Account_Number)
);
ALTER TABLE Checking_Accounts AUTO_INCREMENT = 10000;

INSERT INTO Checking_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10000, TRUE, '2020-11-1');
INSERT INTO Checking_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10001, TRUE, '2020-11-1');
INSERT INTO Checking_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10002, TRUE, '2020-11-1');
INSERT INTO Checking_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10003, TRUE, '2020-11-1');
INSERT INTO Checking_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10004, TRUE, '2020-11-1');
INSERT INTO Checking_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10005, TRUE, '2020-11-1');
INSERT INTO Checking_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10006, TRUE, '2020-11-1');
INSERT INTO Checking_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10007, TRUE, '2020-11-1');
INSERT INTO Checking_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10008, TRUE, '2020-11-1');
INSERT INTO Checking_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10009, TRUE, '2020-11-1');

CREATE VIEW Hmm1001 AS
SELECT Accounts.Current_Balance, Checking_Accounts.Minimum_Balance_Status
FROM Accounts, Checking_Accounts
WHERE Accounts.Account_Number = Checking_Accounts.Account_Number;

CREATE TABLE CD_Accounts (
Account_Number INT NOT NULL AUTO_INCREMENT,
CD_Term INT NOT NULL,
Last_Interest_Date DATE NOT NULL,
CONSTRAINT Account_Number_PK4 PRIMARY KEY (Account_Number)
);
ALTER TABLE CD_Accounts AUTO_INCREMENT = 10000;

INSERT INTO CD_Accounts
(Account_Number, CD_Term, Last_Interest_Date)
VALUES (10000, 6, '2020-11-1');
INSERT INTO CD_Accounts
(Account_Number, CD_Term, Last_Interest_Date)
VALUES (10001, 6, '2020-11-1');
INSERT INTO CD_Accounts
(Account_Number, CD_Term, Last_Interest_Date)
VALUES (10002, 6, '2020-11-1');
INSERT INTO CD_Accounts
(Account_Number, CD_Term, Last_Interest_Date)
VALUES (10003, 12, '2020-11-1');
INSERT INTO CD_Accounts
(Account_Number, CD_Term, Last_Interest_Date)
VALUES (10004, 24, '2020-11-1');
INSERT INTO CD_Accounts
(Account_Number, CD_Term, Last_Interest_Date)
VALUES (10005, 60, '2020-11-1');
INSERT INTO CD_Accounts
(Account_Number, CD_Term, Last_Interest_Date)
VALUES (10006, 60, '2020-11-1');
INSERT INTO CD_Accounts
(Account_Number, CD_Term, Last_Interest_Date)
VALUES (10007, 24, '2020-11-1');
INSERT INTO CD_Accounts
(Account_Number, CD_Term, Last_Interest_Date)
VALUES (10008, 12, '2020-11-1');
INSERT INTO CD_Accounts
(Account_Number, CD_Term, Last_Interest_Date)
VALUES (10009, 60, '2020-11-1');

CREATE VIEW Ugh1 AS
SELECT CD_Accounts.CD_Term, Accounts.Account_Number
FROM Accounts, CD_Accounts
WHERE Accounts.Account_Number = CD_Accounts.Account_Number;

CREATE TABLE Savings_Accounts (
Account_Number INT NOT NULL AUTO_INCREMENT,
Minimum_Balance_Status BOOLEAN NOT NULL,
Last_Interest_Date DATE NOT NULL,
CONSTRAINT Account_Number_PK5 PRIMARY KEY (Account_Number)
);
ALTER TABLE Savings_Accounts AUTO_INCREMENT = 10000;

INSERT INTO Savings_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10000, TRUE, '2020-11-1');
INSERT INTO Savings_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10001, TRUE, '2020-11-1');
INSERT INTO Savings_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10002, FALSE, '2020-11-1');
INSERT INTO Savings_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10003, TRUE, '2020-11-1');
INSERT INTO Savings_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10004, TRUE, '2020-11-1');
INSERT INTO Savings_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10005, TRUE, '2020-11-1');
INSERT INTO Savings_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10006, TRUE, '2020-11-1');
INSERT INTO Savings_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10007, TRUE, '2020-11-1');
INSERT INTO Savings_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10008, TRUE, '2020-11-1');
INSERT INTO Savings_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10009, TRUE, '2020-11-1');

CREATE VIEW Ugh2 AS
SELECT Accounts.Current_Balance, Savings_Accounts.Minimum_Balance_Status
FROM Accounts, Savings_Accounts
WHERE Accounts.Account_Number = Savings_Accounts.Account_Number;

CREATE TABLE Loan_Accounts (
Account_Number INT NOT NULL AUTO_INCREMENT,
Loan_Status VARCHAR (50) NOT NULL,
Loan_Type VARCHAR (50) NOT NULL, 
Loan_Term INT NOT NULL,
Loan_Principal NUMERIC (10,3),
Loan_Unpaid_Interest NUMERIC (10,3),
Loan_Annual_Rate NUMERIC (10,3),
Loan_Monthly_Payment NUMERIC (10,3),
Payment_Recieved_Last_Month BOOLEAN NOT NULL,
Next_Payment_Due_Date DATE NULL,
Next_Payment_Due_Amount NUMERIC (10,3),
Termination_Date DATE NOT NULL,
CONSTRAINT Account_Number_PK7 PRIMARY KEY (Account_Number)
);

INSERT INTO Loan_Accounts
(Account_Number, Loan_Status, Loan_Type, Loan_Term, Loan_Principal, Loan_Unpaid_Interest, Loan_Annual_Rate, Loan_Monthly_Payment, 
Payment_Recieved_Last_Month, Next_Payment_Due_Date, Next_Payment_Due_Amount, Termination_Date)
VALUES (10000, 'Good', 'Home', 360, 120000.000, 600, 0.05, 459.375, TRUE, '2020-12-01', 459.458, '2020-12-01');
INSERT INTO Loan_Accounts
(Account_Number, Loan_Status, Loan_Type, Loan_Term, Loan_Principal, Loan_Unpaid_Interest, Loan_Annual_Rate, Loan_Monthly_Payment, 
Payment_Recieved_Last_Month, Next_Payment_Due_Date, Next_Payment_Due_Amount, Termination_Date)
VALUES (10001, 'Good', 'Auto', 36, 30000.000, 150, 0.16, 1401.667, TRUE, '2020-12-01', 1402.333, '2020-12-01');
INSERT INTO Loan_Accounts
(Account_Number, Loan_Status, Loan_Type, Loan_Term, Loan_Principal, Loan_Unpaid_Interest, Loan_Annual_Rate, Loan_Monthly_Payment, 
Payment_Recieved_Last_Month, Next_Payment_Due_Date, Next_Payment_Due_Amount, Termination_Date)
VALUES (10002, 'Good', 'Small Business', 120, 200000.000, 1000, 0.03, 2210.208, TRUE, '2020-12-01', 2210.458, '2020-12-01');
INSERT INTO Loan_Accounts
(Account_Number, Loan_Status, Loan_Type, Loan_Term, Loan_Principal, Loan_Unpaid_Interest, Loan_Annual_Rate, Loan_Monthly_Payment, 
Payment_Recieved_Last_Month, Next_Payment_Due_Date, Next_Payment_Due_Amount, Termination_Date)
VALUES (10003, 'Good', 'Large Business', 360, 1000000.000, 5000, 0.001, 3479.170, FALSE, '2020-12-01', 3479.184, '2020-12-01');
INSERT INTO Loan_Accounts
(Account_Number, Loan_Status, Loan_Type, Loan_Term, Loan_Principal, Loan_Unpaid_Interest, Loan_Annual_Rate, Loan_Monthly_Payment, 
Payment_Recieved_Last_Month, Next_Payment_Due_Date, Next_Payment_Due_Amount, Termination_Date)
VALUES (10004, 'Good', 'Auto', 36, 16000.000, 80, 0.23, 840.500, TRUE, '2020-12-01', 840.500, '2020-12-01');
INSERT INTO Loan_Accounts
(Account_Number, Loan_Status, Loan_Type, Loan_Term, Loan_Principal, Loan_Unpaid_Interest, Loan_Annual_Rate, Loan_Monthly_Payment, 
Payment_Recieved_Last_Month, Next_Payment_Due_Date, Next_Payment_Due_Amount, Termination_Date)
VALUES (10005, 'Good', 'Auto', 36, 80000.000, 400, 0.04, 3004.444, TRUE, '2020-12-01', 3004.444, '2020-12-01');
INSERT INTO Loan_Accounts
(Account_Number, Loan_Status, Loan_Type, Loan_Term, Loan_Principal, Loan_Unpaid_Interest, Loan_Annual_Rate, Loan_Monthly_Payment, 
Payment_Recieved_Last_Month, Next_Payment_Due_Date, Next_Payment_Due_Amount, Termination_Date)
VALUES (10006, 'Good', 'Home', 240, 560000.000, 2800, 0.034, 3118.372, TRUE, '2020-12-01', 3118.372, '2020-12-01');
INSERT INTO Loan_Accounts
(Account_Number, Loan_Status, Loan_Type, Loan_Term, Loan_Principal, Loan_Unpaid_Interest, Loan_Annual_Rate, Loan_Monthly_Payment, 
Payment_Recieved_Last_Month, Next_Payment_Due_Date, Next_Payment_Due_Amount, Termination_Date)
VALUES (10007, 'Good', 'Personal', 24, 20000.000, 100, 0.05, 1148.438, TRUE, '2020-12-01', 1148.438, '2020-12-01');
INSERT INTO Loan_Accounts
(Account_Number, Loan_Status, Loan_Type, Loan_Term, Loan_Principal, Loan_Unpaid_Interest, Loan_Annual_Rate, Loan_Monthly_Payment, 
Payment_Recieved_Last_Month, Next_Payment_Due_Date, Next_Payment_Due_Amount, Termination_Date)
VALUES (10008, 'Good', 'Personal', 36, 5000.000, 25, 0.2, 250.000, TRUE, '2020-12-01', 250.000, '2020-12-01');
INSERT INTO Loan_Accounts
(Account_Number, Loan_Status, Loan_Type, Loan_Term, Loan_Principal, Loan_Unpaid_Interest, Loan_Annual_Rate, Loan_Monthly_Payment, 
Payment_Recieved_Last_Month, Next_Payment_Due_Date, Next_Payment_Due_Amount, Termination_Date)
VALUES (10009, 'Good', 'Small Business', 120, 325000.000, 1625, 0.031, 3598.566, TRUE, '2020-12-01', 3598.986, '2020-12-01');

CREATE VIEW Ugh44 AS
SELECT Loan_Accounts.Loan_Principal, Accounts.Account_Number
FROM Accounts, Loan_Accounts
WHERE Accounts.Account_Number = Loan_Accounts.Account_Number;

SELECT *
FROM Ugh44;

DROP TABLE trans;
DROP TABLE work;
DROP TABLE customer_artist_int;
DROP TABLE artist;
DROP TABLE customer;

SELECT *
FROM accounts;

SELECT *
FROM members;

SELECT *
FROM type_of_owner;

SELECT *
FROM interest_rate;

SELECT *
FROM Accounts_Transactions_Int;

SELECT *
FROM Member_Addresses;
