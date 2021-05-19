SELECT * FROM GLOBAL_NAME;
SELECT SYS_CONTEXT('userenv','db_name') from dual;
SELECT ORA_DATABASE_NAME FROM DUAL;
-------------------------------------------

select * from BANK_INFO_2605;

select * from CUSTOMER_PERSONAL_INFO_2605;
select * from CUSTOMER_REFERENCE_INFO_2605;
select * from BANK_INFO_2605;
select * from ACCOUNT_INFO_2605;

----------------------------------------------------

--1) Write a query which will display the customer id, account type they hold, their account number and bank name.

SELECT CUSTOMER_ID,ACCOUNT_TYPE,ACCOUNT_NO,BANK_NAME
FROM account_info_2605 A,BANK_INFO_2605 B
WHERE A.IFSC_CODE=b.IFSC_CODE;

--------------------

--2) Write a query which will display the customer id, account type and the
--account number of HDFC customers
--who registered after 12-JAN-2012 and before 04-APR-2012.

SELECT * FROM ACCOUNT_INFO_2605;
SELECT CUSTOMER_ID,ACCOUNT_TYPE,ACCOUNT_NO
FROM ACCOUNT_INFO_2605
WHERE REGISTRATION_DATE BETWEEN '12-JAN-2012' AND '04-APR-2012';

SELECT IFSC_CODE
FROM BANK_INFO
WHERE BANK_NAME='HDFC';

---------------------------------
