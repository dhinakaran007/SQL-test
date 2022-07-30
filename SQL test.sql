create database test;

use test;

#Question 1
SELECT customer.cust_name AS "Customer",
customer.grade AS "Grade",orders.ord_no AS "Order No."
FROM orders, salesman, customer
WHERE orders.customer_id = customer.ï»¿custemor_id
AND orders.salesman_id = salesman.salesman_id
AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL;


#Question 2
SELECT ord_no, purch_amt, ord_date, salesman_id 
FROM orders 
WHERE salesman_id IN(
SELECT salesman_id FROM salesman
WHERE commision = (SELECT MAX(commision) FROM salesman));

#Question 3
SELECT ord_no, purch_amt, ord_date, salesman_id
FROM orders
WHERE salesman_id IN (
SELECT salesman_id
FROM salesman WHERE city='nagpur');

#Question 4
SELECT ord_date, SUM(purch_amt), 
SUM(purch_amt)*.15 
FROM orders 
GROUP BY ord_date 
ORDER BY ord_date;




#Question 5
SELECT *
FROM orders
WHERE purch_amt >
    (SELECT  AVG(purch_amt) FROM orders);
    
#Question 6
SELECT DISTINCT customer_id FROM Orders ORDER BY purch_amt DESC LIMIT 4,1;



#What is Entity and Relationship?
#An entity is a table in DBMS, and it represents a real-world object.
#A relationship signifies an association among the entities. There are three types of relationships that can exist between the entities. 
#They are the binary, recursive and the ternary relationship.


#Question 8
Select customer_id , ba.account_number,
Case when ifnull(balance_amount,0) = 0 then   Transaction_amount else balance_amount end  as balance_amount
from Bank_Account_Details ba  
inner join
bank_account_transaction bat
on ba.account_number = bat.account_number
and account_type = "Credit Card";


#Question 9
SELECT bank_account_details.account_number, balance_amount, transaction_amount
FROM bank_account_details INNER JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
AND (date_format(Transaction_Date , '%Y-%m')  BETWEEN "2020-03" AND "2020-04");


#Question 10
SELECT bank_account_details.customer_id, bank_account_details.account_number, balance_amount, transaction_amount
FROM bank_account_details LEFT JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
LEFT JOIN bank_customer ON bank_account_details.customer_id = bank_customer.customer_id
AND NOT ( date_format(Transaction_Date , '%Y-%m') = "2020-03" );