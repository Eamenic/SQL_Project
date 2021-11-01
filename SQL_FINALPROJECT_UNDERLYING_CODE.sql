/* NUMBER 1, PART A, ADDING AN ACCOUNT */

INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10010, 'Checking', 1100.222);

ALTER TABLE Message
ADD DATE_time DATETIME NULL;

SELECT Accounts.Current_Balance, Daily_Balance.Balance_EOD
FROM Accounts, daily_balance
WHERE Accounts.Account_Number = daily_balance.Account_Number;

INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10010, '2020-11-22', 1100.222);

SELECT *
FROM checking_accounts;

INSERT INTO Checking_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10010, TRUE, '2020-11-1');

SELECT *
FROM type_of_owner;

INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10010, 11, 'Owner');

SELECT *
FROM Members;

INSERT INTO Members
(Member_ID, First_Name, Last_Name, SSN, Phone_Number, Email_Address)
VALUES (11, 'Daniel', 'Day-Lewis', 777733330, 9994445555, 'D.Day-Lewis@gmail.com');

SELECT *
FROM member_addresses;

INSERT INTO Member_Addresses
(Member_ID, Street_Number, Street, City, State, Country, Zip_Code)
VALUES (11, 888, 'Nerds Dr', 'Cambridge',  'Massachusetts', 'United States of America', 88574);

SELECT *
FROM Message;

INSERT INTO Message
(Message_ID, Message, DATE_time)
VALUES (20010, 'New account number 10010 has been created', '2020-12-17 12:30:05');

SELECT *
FROM members_message_int;

INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (11, 20010);

SELECT *
FROM savings_accounts;

INSERT INTO Savings_Accounts
(Account_Number, Minimum_Balance_Status, Last_Interest_Date)
VALUES (10011, TRUE, '2020-11-1');

/* PART B of 1, MAKING A TRANSFER */

SELECT *
FROM transactions;

INSERT INTO Transactions
(Transaction_ID, Transaction_Type_Code, Initiator_ID, Transaction_Amt)
VALUES (30010, 'Transfer', 10, 10.005);

SELECT *
FROM savings_accounts;

SELECT *
FROM accounts;

INSERT INTO Accounts
(Account_Number, Account_Type_Code, Current_Balance)
VALUES (10011, 'Savings', 10.005);

SELECT *
FROM accounts_transactions_int;

INSERT INTO Accounts_Transactions_Int
(Account_Number, Transaction_ID)
VALUES (10011, 30010);

SELECT *
FROM type_of_owner;

SELECT *
FROM members;

INSERT INTO Type_Of_Owner
(Account_Number, Member_ID, Member_Type)
VALUES (10011, 11, 'Owner');

UPDATE accounts
SET Current_Balance = 1090.217
WHERE Account_Number = 10010;

SELECT *
FROM accounts;

SELECT *
FROM message;

INSERT INTO Message
(Message_ID, Message, DATE_time)
VALUES (20011, 'Member_ID 11 transfered 10.005 from Checking to Savings', '2020-12-22 12:45:07');

SELECT *
FROM members_message_int;

INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (11, 20011);

SELECT *
FROM daily_balance;

UPDATE daily_balance
SET  Balance_EOD = 1090.217
WHERE Account_Number = 10010;

INSERT INTO Daily_Balance
(Account_Number, Daily_Balance_Date, Balance_EOD)
VALUES (10011, '2020-11-22', 10.005);

/* TO CORRECT AN AMOUNT ON A DEPOSIT TRANSACTION */

SELECT *
FROM transactions;

UPDATE transactions
SET Transaction_Amt = 50.000
WHERE Transaction_ID = 30007;

SELECT *
FROM accounts_transactions_int;

SELECT *
FROM accounts;

UPDATE accounts
SET Current_Balance = 650.151
WHERE Account_Number = 10005;

SELECT *
FROM message;

INSERT INTO Message
(Message_ID, Message, DATE_time)
VALUES (20012, 'Corrected incorrect deposit amount for Transaction_ID 30007 from 0.010 to 50.000', '2020-12-22 12:45:07');

SELECT *
FROM members_message_int;

SELECT *
FROM type_of_owner;

INSERT INTO Members_Message_Int
(Member_ID, Message_ID)
VALUES (6, 20012);

SELECT *
FROM daily_balance;

UPDATE daily_balance
SET Balance_EOD = 650.151
WHERE Account_Number = 10005;

/* PART D, QUESTION 1: DELETE MEMBER WHO HAS AN ACCOUNT */

SELECT *
FROM members_message_int;

DELETE FROM members_message_int
WHERE member_ID = 10;

SELECT *
FROM message;

DELETE FROM message
WHERE message_ID = 20000;

SELECT *
FROM type_of_owner;

DELETE FROM type_of_owner
WHERE Account_Number = 10009;

SELECT *
FROM members;

DELETE FROM members
WHERE Member_ID = 10;

SELECT *
FROM member_addresses;

DELETE FROM member_addresses
WHERE Member_ID = 10;

SELECT *
FROM accounts;

DELETE FROM accounts
WHERE Account_Number = 10009;

SELECT *
FROM daily_balance;

DELETE FROM daily_balance
WHERE Account_Number = 10009;

SELECT *
FROM savings_accounts;

DELETE FROM savings_accounts
WHERE Account_Number = 10009;

SELECT *
FROM checking_accounts;

DELETE FROM checking_accounts
WHERE Account_Number = 10009;

SELECT *
FROM cd_accounts;

DELETE FROM cd_accounts
WHERE Account_Number = 10009;

SELECT *
FROM loan_accounts;

DELETE FROM loan_accounts
WHERE Account_Number = 10009;

SELECT *
FROM message;

INSERT INTO Message
(Message_ID, Message, DATE_time)
VALUES (20013, 'Removed Member_ID 10 and Account_Number 10009 from database', '2020-12-23 14:45:07');

/* PART E, QUESTION 1 - TRACKING LOAN BALANCES */

SELECT *
FROM loan_accounts;

ALTER TABLE loan_accounts
ADD One_Month_Payment INT NULL;

ALTER TABLE loan_accounts
ADD Two_Month_Payment INT NULL;

ALTER TABLE loan_accounts
ADD One_Month_Principal_Amt INT NOT NULL;

ALTER TABLE loan_accounts
ADD Two_Month_Principal_Amt INT NOT NULL;

UPDATE loan_accounts
SET One_Month_Payment = Loan_Monthly_Payment
WHERE Account_Number != 10003;

UPDATE loan_accounts
SET Two_Month_Payment = Loan_Monthly_Payment
WHERE Account_Number != 10003;

UPDATE loan_accounts
SET One_Month_Principal_Amt = 119540.625
WHERE Account_Number = 10000;

UPDATE loan_accounts
SET One_Month_Principal_Amt = 28598.333
WHERE Account_Number = 10001;

UPDATE loan_accounts
SET One_Month_Principal_Amt = 197789.792
WHERE Account_Number = 10002;

UPDATE loan_accounts
SET One_Month_Principal_Amt = 1000000.000
WHERE Account_Number = 10003;

UPDATE loan_accounts
SET One_Month_Principal_Amt = 15159.5
WHERE Account_Number = 10004;

UPDATE loan_accounts
SET One_Month_Principal_Amt = 76995.556
WHERE Account_Number = 10005;

UPDATE loan_accounts
SET One_Month_Principal_Amt = 556881.628
WHERE Account_Number = 10006;

UPDATE loan_accounts
SET One_Month_Principal_Amt = 18851.56
WHERE Account_Number = 10007;

UPDATE loan_accounts
SET One_Month_Principal_Amt = 4750
WHERE Account_Number = 10008;


UPDATE loan_accounts
SET Two_Month_Principal_Amt = 119081.25
WHERE Account_Number = 10000;

UPDATE loan_accounts
SET Two_Month_Principal_Amt = 27196.666
WHERE Account_Number = 10001;

UPDATE loan_accounts
SET Two_Month_Principal_Amt = 195579.584
WHERE Account_Number = 10002;

UPDATE loan_accounts
SET Two_Month_Principal_Amt = 1000000.000
WHERE Account_Number = 10003;

UPDATE loan_accounts
SET Two_Month_Principal_Amt = 14319
WHERE Account_Number = 10004;

UPDATE loan_accounts
SET Two_Month_Principal_Amt = 73991.112
WHERE Account_Number = 10005;

UPDATE loan_accounts
SET Two_Month_Principal_Amt = 553763.256
WHERE Account_Number = 10006;

UPDATE loan_accounts
SET Two_Month_Principal_Amt = 17703.112
WHERE Account_Number = 10007;

UPDATE loan_accounts
SET Two_Month_Principal_Amt = 4500
WHERE Account_Number = 10008;

SELECT *
FROM loan_accounts;

/* END OF PART 1 */

/* BEGINNING PART 2 */

CALL Existing_Account_Details (10000);

CALL Account_Status_Check (10001);

CALL Existing_Member_Details (2);

CALL Member_Status_Check (3);

CALL Account_Type_Query (10004);

CALL Count_Owner_Type (@A);

CALL Count_Joint_Type (@B);

SELECT *
FROM daily_balance;

CALL Account_Balance_On_Date (10003, '2020-11-22');

SELECT *
FROM message;













