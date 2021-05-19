--1) Write a query which will display the customer id, account type they hold, their account number and bank name.

SELECT CUSTOMER_ID,ACCOUNT_TYPE,ACCOUNT_NO,BANK_NAME
FROM ACCOUNT_INFO_2605 A,BANK_INFO_2605 B
WHERE A.IFSC_CODE = B.ifsc_code;

----------

--2) Write a query which will display the customer id, account type and the account number of HDFC customers who registered after 12-JAN-2012 and before 04-APR-2012.

SELECT CUSTOMER_ID,ACCOUNT_TYPE,ACCOUNT_NO 
FROM ACCOUNT_INFO_2605
WHERE REGISTRATION_DATE BETWEEN '12-JAN-2012' AND '04-APR-2012'
AND IFSC_CODE = (SELECT IFSC_CODE_2605 FROM BANK_INFO_2605 WHERE BANK_NAME ='HDFC');

-----------

--3) Write a query which will display the customer id, customer name, account no, account type and bank name where the customers hold the account.

SELECT C.CUSTOMER_ID,C.CUSTOMER_NAME,A.ACCOUNT_NO,A.ACCOUNT_TYPE,B.BANK_NAME
FROM customer_personal_info_2605 C,account_info_2605 A,bank_info_2605 B
WHERE A.CUSTOMER_ID = C.CUSTOMER_ID
AND A.IFSC_CODE = B.IFSC_CODE;

-----------------------

--4) Write a query which will display the customer id, customer name, gender, marital status along with the unique reference string and sort the records based on customer id in descending order. 
-- Hint:  Generate unique reference string as mentioned below 
-- Use ""UNIQUE_REF_STRING"" as alias name for displaying the unique reference string."

SELECT CUSTOMER_ID,CUSTOMER_NAME,GENDER,MARITAL_STATUS,
CUSTOMER_ID||'_'||CUSTOMER_NAME||'_'||GENDER||'_'||MARITAL_STATUS AS UNIQUE__REF_STIRNG
FROM customer_personal_info_2605 ORDER BY CUSTOMER_ID DESC;

-----------


--5) Write a query which will display the account number, customer id, registration date, initial deposit amount of the customer
 --whose initial deposit amount is within the range of Rs.15000 to Rs.25000.
 
 SELECT ACCOUNT_NO,CUSTOMER_ID,REGISTRATION_DATE,initial_deposit
FROM ACCOUNT_INFO_2605 
WHERE initial_deposit BETWEEN '15000' AND '25000';

--------
--6) Write a query which will display customer id, customer name, date of birth, guardian name of the customers whose name starts with 'J'.

SELECT CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,GUARDIAN_NAME
FROM customer_personal_info_2605
WHERE CUSTOMER_NAME LIKE 'J%';

----------------

--7) Write a query which will display customer id, account number and passcode. 
--Hint:  To generate passcode, join the last three digits of customer id and last four digit of account number.
 

SELECT CUSTOMER_ID,ACCOUNT_NO,
CONCAT (SUBSTR(CUSTOMER_ID,3), SUBSTR(ACCOUNT_NO,13)) AS PASSCODE
FROM ACCOUNT_INFO_2605;

-------------

--8) Write a query which will display the customer id, customer name, date of birth, Marital Status, Gender, Guardian name, 
--contact no and email id of the customers whose gender is male 'M' and marital status is MARRIED.


SELECT CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,GUARDIAN_NAME,CONTACT_NO,MAIL_ID
FROM customer_personal_info_2605
WHERE GENDER='M' AND MARITAL_STATUS='MARRIED';

-------------

--9) Write a query which will display the customer id, customer name, guardian name, reference account holders name of the customers 
--who are referenced / referred by their 'FRIEND'.

SELECT A.CUSTOMER_ID,A.CUSTOMER_NAME,A.GUARDIAN_NAME,B.REFERENCE_ACC_NAME
FROM customer_personal_info_2605 A,customer_reference_info_2605 B
WHERE A.CUSTOMER_ID=b.customer_id AND B.RELATION='FRIEND';

-------------

--10) Write a query to display the customer id, account number and interest amount in the below format with INTEREST_AMT as alias name
-- Sort the result based on the INTEREST_AMT in ascending order.Hint: Need to prefix $ to interest amount and round the result without decimals.
 
  SELECT CUSTOMER_ID,ACCOUNT_NO,CONCAT('$',(INITIAL_DEPOSIT*INTEREST)/100) AS INTERESTED_AMT
 FROM  account_info_2605 ORDER BY INTERESTED_AMT;
 
 ---------------
 
--11) Write a query which will display the customer id, customer name, account no, account type, activation date,
-- bank name whose account will be activated on '10-APR-2012'

SELECT A.CUSTOMER_ID,CUSTOMER_NAME,ACCOUNT_TYPE,ACTIVATION_DATE,BANK_NAME
FROM customer_personal_info_2605 A,account_info_2605 B,bank_info_2605 C
WHERE a.customer_id=b.customer_id
AND b.ifsc_code=c.ifsc_code
AND  ACTIVATION_DATE='10-APR-2012';

---------------

--12) Write a query which will display account number, customer id, customer name, bank name, branch name, ifsc code,citizenship,
--interest and initial deposit amount of all the customers.

 SELECT ACCOUNT_NO,A.CUSTOMER_ID,CUSTOMER_NAME,BANK_NAME,BRANCH_NAME,B.IFSC_CODE,CITIZENSHIP,INTEREST,INITIAL_DEPOSIT
FROM customer_personal_info_2605 A,account_info_2605 B,bank_info_2605 C
WHERE a.customer_id = b.customer_id
AND b.ifsc_code = c.ifsc_code;

-------------

--13) Write a query which will display customer id, customer name, date of birth, guardian name, contact number,
 --mail id and reference account holder's name of the customers who has submitted the passport as an identification document.

SELECT A.CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,GUARDIAN_NAME,CONTACT_NO,MAIL_ID,REFERENCE_ACC_NAME
FROM customer_personal_info_2605 A,customer_reference_info_2605 B
WHERE a.customer_id = b.customer_id
AND IDENTIFICATION_DOC_TYPE='PASSPORT';

----------------

--14) Write a query to display the customer id, customer name, account number, account type, initial deposit,interest who have deposited maximum amount in the bank.


SELECT A.CUSTOMER_ID,CUSTOMER_NAME,ACCOUNT_NO,ACCOUNT_TYPE,(INITIAL_DEPOSIT),INTEREST
FROM customer_personal_info_2605 A,account_info_2605 B
WHERE INITIAL_DEPOSIT=(SELECT MAX(INITIAL_DEPOSIT) FROM account_info_2605)
AND a.customer_id=b.customer_id;

----------------

--15) Write a query to display the customer id, customer name, account number, account type, interest, bank name and initial deposit amount of the customers who are getting maximum interest rate.

SELECT A.CUSTOMER_ID,CUSTOMER_NAME,ACCOUNT_NO,ACCOUNT_TYPE,INTEREST,BANK_NAME,INITIAL_DEPOSIT
FROM customer_personal_info_2605 A,account_info_2605 B,bank_info_2605 C
WHERE INTEREST =(SELECT MAX(INTEREST) FROM account_info_2605)
AND A.CUSTOMER_ID=b.customer_id 
AND b.ifsc_code = c.ifsc_code;

-------------

--16) Write a query to display the customer id, customer name, account no, bank name, contact no and mail id of the customers who are from BANGALORE.

SELECT A.CUSTOMER_ID,CUSTOMER_NAME,ACCOUNT_NO,BANK_NAME,CONTACT_NO,MAIL_ID
FROM customer_personal_info_2605 A,account_info_2605 B,bank_info_2605 C 
WHERE ADDRESS LIKE '%BANGAL%'
AND a.customer_id =b.customer_id
AND b.ifsc_code =c.ifsc_code;

----------------

--17) Write a query which will display customer id, bank name, branch name, ifsc code, registration date,activation date of the customers whose activation date is in the month of march (March 1'st to March 31'st).

SELECT CUSTOMER_ID,BANK_NAME,BRANCH_NAME,A.IFSC_CODE,REGISTRATION_DATE,ACTIVATION_DATE
FROM bank_info_2605 A,account_info_2605 B
WHERE ACTIVATION_DATE LIKE'%03%'
AND a.ifsc_code=b.ifsc_code;

SELECT CUSTOMER_ID,BANK_NAME,BRANCH_NAME,A.IFSC_CODE,REGISTRATION_DATE,ACTIVATION_DATE
FROM BANK_INFO_2 A,ACCOUNT_INFO_2 B WHERE A.IFSC_CODE=B.IFSC_CODE 
AND ACTIVATION_DATE 
BETWEEN '01-03-2012' AND'31-03-2012';

-----------------
/*18) Write a query which will calculate the interest amount and display it along with customer id, customer name, 
account number, account type, interest, and initial deposit amount.<BR>Hint :Formula for interest amount, 
calculate: ((interest/100) * initial deposit amt) with column name 'interest_amt' (alias)*/

SELECT A.CUSTOMER_ID,CUSTOMER_NAME,ACCOUNT_NO,ACCOUNT_TYPE,INITIAL_DEPOSIT, ((interest/100) *INITIAL_DEPOSIT) AS INTEREST_AMT
FROM customer_personal_info_2605 A,account_info_2605 B
WHERE A.CUSTOMER_ID =b.customer_id;

-------------

--19) Write a query to display the customer id, customer name, date of birth, guardian name, contact number, 
--mail id, reference name who has been referenced by 'RAGHUL'.

SELECT A.CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,GUARDIAN_NAME,CONTACT_NO,MAIL_ID,REFERENCE_ACC_NAME
FROM customer_personal_info_2605 A,customer_reference_info_2605 B
WHERE REFERENCE_ACC_NAME='RAGHUL' AND a.customer_id=b.customer_id;

------------

/*20) Write a query which will display the customer id, customer name and contact number with ISD code of 
all customers in below mentioned format.  Sort the result based on the customer id in descending order. 
Format for contact number is :  
""+91-3digits-3digits-4digits""
 Example: +91-924-234-2312
 Use ""CONTACT_ISD"" as alias name."*/
 
 
SELECT CUSTOMER_ID,CUSTOMER_NAME,
('+91'||'_'||SUBSTR(CONTACT_NO,1,3)||'_'||SUBSTR(CONTACT_NO,4,3)||'_'||SUBSTR(CONTACT_NO,7,4)) AS CONTACT_ISD
FROM customer_personal_info_2605 ORDER BY CUSTOMER_ID DESC;

--------------

/*21) Write a query which will display account number, account type, customer id, customer name, date of birth, guardian name, 
contact no, mail id , gender, reference account holders name, reference account holders account number, registration date, 
activation date, number of days between the registration date and activation date with alias name "NoofdaysforActivation", 
bank name, branch name and initial deposit for all the customers.*/

SELECT C.ACCOUNT_NO,ACCOUNT_TYPE,A.CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,GUARDIAN_NAME,CONTACT_NO,MAIL_ID,GENDER,
REFERENCE_ACC_NAME,REFERENCE_ACC_NO,REGISTRATION_DATE,ACTIVATION_DATE,
(ACTIVATION_DATE-REGISTRATION_DATE)AS NO_OF_DAYS_FOR_ACTIVATION
FROM customer_personal_info_2605 A,customer_reference_info_2605 B,account_info_2605 C,bank_info_2605 D
WHERE a.customer_id=b.customer_id AND b.customer_id= c.customer_id AND c.ifsc_code=d.ifsc_code;

---------------

/*22) Write a query which will display customer id, customer name,  guardian name, identification doc type,
 reference account holders name, account type, ifsc code, bank name and current balance for the customers 
who has only the savings account. 
<br/>Hint:  Formula for calculating current balance is add the intital deposit amount and interest
 and display without any decimals. Use ""CURRENT_BALANCE"" as alias name."*/
 
 SELECT A.CUSTOMER_ID,CUSTOMER_NAME,GUARDIAN_NAME,IDENTIFICATION_DOC_TYPE,REFERENCE_ACC_NAME,ACCOUNT_TYPE,C.IFSC_CODE,BANK_NAME
,(INITIAL_DEPOSIT*(INTEREST/100)) AS CURRENT_BALANCE
FROM customer_personal_info_2605 A,customer_reference_info_2605 B,account_info_2605 C,Bank_info_2605 D
WHERE a.customer_id=b.customer_id AND b.customer_id=c.customer_id AND c.ifsc_code =d.ifsc_code;

--------------

/*23) Write a query which will display the customer id, customer name, account number, account type, interest, initial deposit;check the initial deposit, if initial deposit is 20000 then display ""high"",
if initial deposit is 16000 display 'moderate', if initial deposit is 10000 display 'average', if initial deposit is 5000 display 'low', if initial deposit is 0 display
 'very low' otherwise display 'invalid' and sort by interest in descending order.
Hint: Name the column as ""Deposit_Status"" (alias). 
Strictly follow the lower case for strings in this query."*/

SELECT CUSTOMER_NAME,A.CUSTOMER_ID,ACCOUNT_NO,ACCOUNT_TYPE,INTEREST,INITIAL_DEPOSIT,
CASE 
WHEN INITIAL_DEPOSIT=20000 THEN 'HIGH'
WHEN INITIAL_DEPOSIT=16000 THEN 'MODERATE'
WHEN INITIAL_DEPOSIT=10000 THEN 'AVERAGE'
WHEN INITIAL_DEPOSIT=5000 THEN 'LOW'
WHEN INITIAL_DEPOSIT=0 THEN 'VERY LOW'
END AS DEPOSIT_STATUS
FROM customer_personal_info_2605 A,account_info_2605 B
WHERE a.customer_id =b.customer_id ORDER BY INTEREST DESC;

------------------

/*24) Write a query which will display customer id, customer name,  account number, account type, bank name, ifsc code, initial deposit amount
 and new interest amount for the customers whose name starts with ""J"". 
<br/> Hint:  Formula for calculating ""new interest amount"" is 
if customers account type is savings then add 10 % on current interest amount to interest amount else display the current interest amount.
 Round the new interest amount to 2 decimals.<br/> Use ""NEW_INTEREST"" as alias name for displaying the new interest amount.

<br/>Example, Assume Jack has savings account and his current interest amount is 10.00, then the new interest amount is 11.00 i.e (10 + (10 * 10/100)). 
"*/

SELECT A.CUSTOMER_ID,CUSTOMER_NAME,ACCOUNT_NO,ACCOUNT_TYPE,BANK_NAME,
B.IFSC_CODE,INITIAL_DEPOSIT,
CASE
WHEN ACCOUNT_TYPE='SAVINGS' 
THEN ROUND(INTEREST+(INTEREST * 10/100 ))/100*INITIAL_DEPOSIT
ELSE ROUND(INTEREST/100*INITIAL_DEPOSIT)
END AS NEW_INTEREST
FROM CUSTOMER_PERSONAL_INFO_2605 A,ACCOUNT_INFO_2605 B,BANK_INFO_2605 C
WHERE  A.CUSTOMER_ID=B.CUSTOMER_ID AND B.IFSC_CODE=C.IFSC_CODE AND CUSTOMER_NAME LIKE 'J%';

-----------------------

/*25) Write query to display the customer id, customer name, account no, initial deposit, tax percentage as calculated below.
<BR>Hint: <BR>If initial deposit = 0 then tax is '0%'<BR>If initial deposit &lt;= 10000 then tax is '3%' 
<BR>If initial deposit &gt; 10000 and initial deposit &lt; 20000 then tax is '5%' <BR>If initial deposit &gt;= 20000 and
 initial deposit&lt;=30000 then tax is '7%' <BR>If initial deposit &gt; 30000 then tax is '10%' <BR>Use the alias name 'taxPercentage'*/
 
 SELECT A.customer_id, customer_name, account_no, initial_deposit,
CASE 
WHEN INITIAL_DEPOSIT=0 THEN '0%'
WHEN INITIAL_DEPOSIT=10000 THEN '3%'
WHEN INITIAL_DEPOSIT=16000 THEN '5%'
WHEN INITIAL_DEPOSIT=30000 THEN '10%'
END AS TAX_PERCENTAGE
FROM customer_personal_info_2605 A,account_info_2605 B
WHERE A.CUSTOMER_ID=b.customer_id;

------------------------------

 
 
 
 
 