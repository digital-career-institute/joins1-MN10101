mysql> create table gift_recipients(
    -> recipient_id INT PRIMARY KEY,
    -> recipient_name VARCHAR(50),
    -> info VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> create table gifts(
    -> gift_id INT PRIMARY KEY,
    -> gift_name VARCHAR(50),
    -> gift_category VARCHAR(50),
    -> recipient_id INT,
    -> FOREIGN KEY (recipient_id) REFERENCES gift_recipients(recipient_id)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> INSERT INTO gift_recipients VALUES(1, 'Maya Ma', 'Love Movies'),(2, 'Hadi Ha', 'Eating'),(3, 'Sven Sv', 'Going to Gym'),(4, 'Lala La', 'Dancing'),(5,
 'Jodi Jo', 'Likes Reading');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO gifts VALUES(121, 'Apple Watch', 'Smart Watch', 1),(122, 'PC', 'Electronics', 2),(123, 'T-Shirt', 'Clothing', 3),(124, 'Novel', 'Books', 4),(125, 'Action Figure', 'Toys', NULL);
Query OK, 5 rows affected (0.05 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM gift_recipients LEFT JOIN gifts ON gift_recipients.recipient_id = gifts.recipient_id;
+--------------+----------------+---------------+---------+-------------+---------------+--------------+
| recipient_id | recipient_name | info          | gift_id | gift_name   | gift_category | recipient_id |
+--------------+----------------+---------------+---------+-------------+---------------+--------------+
|            1 | Maya Ma        | Love Movies   |     121 | Apple Watch | Smart Watch   |            1 |
|            2 | Hadi Ha        | Eating        |     122 | PC          | Electronics   |            2 |
|            3 | Sven Sv        | Going to Gym  |     123 | T-Shirt     | Clothing      |            3 |
|            4 | Lala La        | Dancing       |     124 | Novel       | Books         |            4 |
|            5 | Jodi Jo        | Likes Reading |    NULL | NULL        | NULL          |         NULL |
+--------------+----------------+---------------+---------+-------------+---------------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM gift_recipients ON gifts.recipient_id = gift_recipients.recipient_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ON gifts.recipient_id = gift_recipients.recipient_id' at line 1
mysql> SELECT * FROM gifts RIGHT JOIN gift_recipients ON gifts.recipient_id = gift_recipients.recipient_id;
+---------+-------------+---------------+--------------+--------------+----------------+---------------+
| gift_id | gift_name   | gift_category | recipient_id | recipient_id | recipient_name | info          |
+---------+-------------+---------------+--------------+--------------+----------------+---------------+
|     121 | Apple Watch | Smart Watch   |            1 |            1 | Maya Ma        | Love Movies   |
|     122 | PC          | Electronics   |            2 |            2 | Hadi Ha        | Eating        |
|     123 | T-Shirt     | Clothing      |            3 |            3 | Sven Sv        | Going to Gym  |
|     124 | Novel       | Books         |            4 |            4 | Lala La        | Dancing       |
|    NULL | NULL        | NULL          |         NULL |            5 | Jodi Jo        | Likes Reading |
+---------+-------------+---------------+--------------+--------------+----------------+---------------+
5 rows in set (0.00 sec)