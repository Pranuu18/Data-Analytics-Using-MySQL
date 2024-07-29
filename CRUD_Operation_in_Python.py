# CRUD Operation in Python Using MySQL (CRUD - CREATE, READ, UPDATE AND DELETE)

# pip install mysql-connector-python - It is a command used to install the MySQL Connector/Python library in your Python environment.

import mysql.connector

# STEP:1 Connect to the MySQL DataBase

try:
    conn = mysql.connector.connect(
        host='host_name',
        user="user_name",
        password="passwrd",
        database='crud'
    )
    my_cursor = conn.cursor()
    print("Connection Established")
except:
    print("Connection Error")

## STEP:2 Create a DataBase ##

my_cursor.execute("CREATE DATABASE CRUD")
conn.commit()
print("DATABASE CREATED!!!");

## STEP:3 Create a TABLE ( id, name, email and age)

my_cursor.execute(
    """
    CREATE TABLE CUSTOMERS(
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(50) NOT NULL,
    AGE INTEGER
    )
    """)
conn.commit();
print("TABLE CREATED!!!");

# STEP:4 Insert new record into the "Customer" Table ##

my_cursor.execute(
    """
    INSERT INTO CUSTOMERS VALUES
    ( 1,'Pranava','pranava@gmail.com', 24),
    ( 2,'Pranu','pranu@gmail.com',25),
    ( 3,'chinnu','chinnu@gmail.com',26)
     """)
conn.commit();
print("Rows are inserted!!!");

# STEP:5 READ: select Data from a Table

my_cursor.execute("select * from Customers;")
result = my_cursor.fetchall()
print(result)
for x in result:
    print(x[2])

# STEP:6 UPDATE: Update Data in a Table

my_cursor.execute("UPDATE Customers set age= 27 where id = 3")
conn.commit()
print("updated !!");

# STEP:7 DELETE: DELETE Data from a Table
my_cursor.execute("DELETE from Customers where id = 3")
conn.commit()
print("Deleted!!");

# To Read the data after applying all the operations.

my_cursor.execute("SElect * from Customers");
result = my_cursor.fetchall()
print(result)
