# Understanding SQL Fundamentals: DDL, DML, and Data Manipulation

Structured Query Language (SQL) is a powerful tool used to manage and manipulate data in relational databases.  
SQL commands are categorized into different groups, two of the most important being **DDL** and **DML**.

---

## What is DDL (Data Definition Language)

This refers to commands used to define and manage the structure of a database. These commands include creating, modifying, or deleting database objects such as tables.

**Examples of DDL Commands:**
- `CREATE` – used to create new tables and databases  
- `ALTER` – used to modify existing database structures  
- `DROP` – used to delete tables or databases  

---

## What is DML (Data Manipulation Language)

This refers to commands that deal with managing data within those structures. It allows users to insert, update, retrieve, and delete records.

**Examples of DML Commands:**
- `INSERT` – adds new records to a table  
- `UPDATE` – modifies existing data  
- `DELETE` – removes records from a table  
- `SELECT` – retrieves data  

---

## How I Used CREATE, INSERT, UPDATE, and DELETE

In the assignment, I applied several SQL commands to interact with the database.

### CREATE
I used the `CREATE` statement to define tables such as **students**, **subjects**, and **exam_results**. This involved specifying column names, data types, and constraints like primary keys.

### INSERT
I used the `INSERT` command to add records into the tables. For example, I inserted student details such as names, city, class, gender, and date of birth into the **students** table.

### UPDATE
I used `UPDATE` to modify existing records. For example, updating `student_id = 5` city from *Nakuru* to *Nairobi*.

### DELETE
The `DELETE` statement was used to remove `result_id = 9`, which was cancelled, ensuring data accuracy and consistency.

These commands helped simulate real-world database operations, where data is constantly being created, updated, and maintained.

---

## Using WHERE to Filter Data

The `WHERE` clause is used to filter records based on specific conditions. It ensures that queries return only relevant data instead of the entire dataset.

**Some Commonly Used Operators Include:**

- `=` (equals): used to match exact values  
  Example:
    
  ```sql
 delete from exam_results 
where result_id = 9;
  ```

- `>` (greater than): used for numeric comparisons  
  Example:
  
  ```sql
  select *
from exam_results
where marks > 70;
  ```

- `BETWEEN`: used to filter values within a range  
  Example:
   
  ```sql
  select *
from exam_results
where exam_date between '2024-03-15' and '2024-03-18';
  ```

- `IN`: used to match multiple values  
  Example:

  ```sql
 select *
from students
where city in ('Nairobi', 'Mombasa', 'Kisumu');
  ```

- `LIKE`: used for pattern matching  
  Example:
  
  ```sql
 select *
from students
where first_name like 'A%' or first_name like 'E%';
  ```

Using the `WHERE` clause makes queries more efficient and meaningful by narrowing down results.

---

## Using CASE WHEN to Transform Data

The `CASE WHEN` statement is used to apply conditional logic within SQL queries. It allows transformation of data into more meaningful categories.

For example, I used `CASE WHEN` to categorize students' grades:

**Question:**  
Write a query using `CASE WHEN` to label each exam result with a grade description:
- 'Distinction' if marks >= 80  
- 'Merit' if marks >= 60  
- 'Pass' if marks >= 40  
- 'Fail' if marks below 40  

```sql
SELECT *,
CASE
    WHEN marks >= 80 THEN 'Distinction'
    WHEN marks >= 60 THEN 'Merit'
    WHEN marks >= 40 THEN 'Pass'
    ELSE 'Fail'
END AS performance
FROM exam_results;
```

This approach helps in creating readable insights from raw data, making it easier to analyze and present findings.

---

## Reflection

Learning SQL has been both challenging and rewarding.

One of the main challenges was understanding how different SQL commands interact, especially when updating or filtering data. Small syntax errors, such as missing quotes or incorrect data types, often led to errors.

However, I found it very interesting how SQL allows you to manipulate and transform data efficiently. The `CASE WHEN` clause, in particular, stood out as a powerful tool for turning raw data into meaningful insights. Additionally, learning how to filter data using different operators improved my ability to write more precise and clear queries.

In the end, this experience strengthened my understanding of database operations and improved my confidence in using SQL for data analysis.
