mysql> CREATE TABLE users (
    ->     user_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     username VARCHAR(100) NOT NULL,
    ->     email VARCHAR(100) UNIQUE,
    ->     phone VARCHAR(15),
    ->     password VARCHAR(100)
    -> );
ERROR 1046 (3D000): No database selected
mysql> Terminal close -- exit!
mysql> create database MovieticketBooking;
Query OK, 1 row affected (0.01 sec)

mysql> use MovieticketBooking;
Database changed
mysql> CREATE TABLE users (
    ->     user_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     username VARCHAR(100) NOT NULL,
    ->     email VARCHAR(100) UNIQUE,
    ->     phone VARCHAR(15),
    ->     password VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE movies (
    ->     movie_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     movie_name VARCHAR(100) NOT NULL,
    ->     genre VARCHAR(50),
    ->     duration INT,
    ->     language VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> ^C
mysql> CREATE TABLE theaters (
    ->     theater_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     theater_name VARCHAR(100),
    ->     location VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE shows (
    ->     show_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     movie_id INT,
    ->     theater_id INT,
    ->     show_date DATE,
    ->     show_time TIME,
    ->     ticket_price DECIMAL(10,2),
    ->     FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
    ->     FOREIGN KEY(theater_id) REFERENCES theaters(theater_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE seats (
    ->     seat_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     theater_id INT,
    ->     seat_number VARCHAR(10),
    ->     seat_type VARCHAR(20),
    ->     FOREIGN KEY(theater_id) REFERENCES theaters(theater_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE bookings (
    ->     booking_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     user_id INT,
    ->     show_id INT,
    ->     seat_id INT,
    ->     booking_date DATETIME,
    ->     FOREIGN KEY(user_id) REFERENCES users(user_id),
    ->     FOREIGN KEY(show_id) REFERENCES shows(show_id),
    ->     FOREIGN KEY(seat_id) REFERENCES seats(seat_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE payments (
    ->     payment_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     booking_id INT,
    ->     amount DECIMAL(10,2),
    ->     payment_mode VARCHAR(30),
    ->     payment_status VARCHAR(20),
    ->     FOREIGN KEY(booking_id) REFERENCES bookings(booking_id)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO users(username,email,phone,password)
    -> VALUES
    -> ('Purnima','purnima@gmail.com','9876543210','pass123'),
    -> ('Ravi','ravi@gmail.com','9876543211','pass456'),
    -> ('Sita','sita@gmail.com','9876543212','pass789');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from users;
+---------+----------+-------------------+------------+----------+
| user_id | username | email             | phone      | password |
+---------+----------+-------------------+------------+----------+
|       1 | Purnima  | purnima@gmail.com | 9876543210 | pass123  |
|       2 | Ravi     | ravi@gmail.com    | 9876543211 | pass456  |
|       3 | Sita     | sita@gmail.com    | 9876543212 | pass789  |
+---------+----------+-------------------+------------+----------+
3 rows in set (0.00 sec)

mysql> INSERT INTO movies(movie_name,genre,duration,language)
    -> VALUES
    -> ('Pushpa 2','Action',180,'Telugu'),
    -> ('Kalki 2898 AD','Sci-Fi',175,'Telugu'),
    -> ('Devara','Action',170,'Telugu');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from movies;
+----------+---------------+--------+----------+----------+
| movie_id | movie_name    | genre  | duration | language |
+----------+---------------+--------+----------+----------+
|        1 | Pushpa 2      | Action |      180 | Telugu   |
|        2 | Kalki 2898 AD | Sci-Fi |      175 | Telugu   |
|        3 | Devara        | Action |      170 | Telugu   |
+----------+---------------+--------+----------+----------+
3 rows in set (0.00 sec)

mysql> INSERT INTO theaters(theater_name,location)
    -> VALUES
    -> ('INOX','Visakhapatnam'),
    -> ('PVR','Hyderabad'),
    -> ('Cinepolis','Vijayawada');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from theaters;
+------------+--------------+---------------+
| theater_id | theater_name | location      |
+------------+--------------+---------------+
|          1 | INOX         | Visakhapatnam |
|          2 | PVR          | Hyderabad     |
|          3 | Cinepolis    | Vijayawada    |
+------------+--------------+---------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO shows(movie_id,theater_id,show_date,show_time,ticket_price)
    -> VALUES
    -> (1,1,'2026-07-20','10:00:00',200),
    -> (2,2,'2026-07-20','14:00:00',250),
    -> (3,3,'2026-07-20','18:00:00',180);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from shows;
+---------+----------+------------+------------+-----------+--------------+
| show_id | movie_id | theater_id | show_date  | show_time | ticket_price |
+---------+----------+------------+------------+-----------+--------------+
|       1 |        1 |          1 | 2026-07-20 | 10:00:00  |       200.00 |
|       2 |        2 |          2 | 2026-07-20 | 14:00:00  |       250.00 |
|       3 |        3 |          3 | 2026-07-20 | 18:00:00  |       180.00 |
+---------+----------+------------+------------+-----------+--------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO seats(theater_id,seat_number,seat_type)
    -> VALUES
    -> (1,'A1','Gold'),
    -> (1,'A2','Gold'),
    -> (2,'B1','Silver'),
    -> (3,'C1','Platinum');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from seats;
+---------+------------+-------------+-----------+
| seat_id | theater_id | seat_number | seat_type |
+---------+------------+-------------+-----------+
|       1 |          1 | A1          | Gold      |
|       2 |          1 | A2          | Gold      |
|       3 |          2 | B1          | Silver    |
|       4 |          3 | C1          | Platinum  |
+---------+------------+-------------+-----------+
4 rows in set (0.00 sec)

mysql> INSERT INTO bookings(user_id,show_id,seat_id,booking_date)
    -> VALUES
    -> (1,1,1,NOW()),
    -> (2,2,3,NOW()),
    -> (3,3,4,NOW());
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from bookings;
+------------+---------+---------+---------+---------------------+
| booking_id | user_id | show_id | seat_id | booking_date        |
+------------+---------+---------+---------+---------------------+
|          1 |       1 |       1 |       1 | 2026-07-13 19:38:48 |
|          2 |       2 |       2 |       3 | 2026-07-13 19:38:48 |
|          3 |       3 |       3 |       4 | 2026-07-13 19:38:48 |
+------------+---------+---------+---------+---------------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO payments(booking_id,amount,payment_mode,payment_status)
    -> VALUES
    -> (1,200,'UPI','Success'),
    -> (2,250,'Credit Card','Success'),
    -> (3,180,'Cash','Pending');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from payments;
+------------+------------+--------+--------------+----------------+
| payment_id | booking_id | amount | payment_mode | payment_status |
+------------+------------+--------+--------------+----------------+
|          1 |          1 | 200.00 | UPI          | Success        |
|          2 |          2 | 250.00 | Credit Card  | Success        |
|          3 |          3 | 180.00 | Cash         | Pending        |
+------------+------------+--------+--------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT b.booking_id,
    ->        u.username,
    ->        m.movie_name,
    ->        t.theater_name,
    ->        se.seat_number,
    ->        p.amount,
    ->        p.payment_status
    -> FROM bookings b
    -> JOIN users u ON b.user_id = u.user_id
    -> JOIN shows s ON b.show_id = s.show_id
    -> JOIN movies m ON s.movie_id = m.movie_id
    -> JOIN theaters t ON s.theater_id = t.theater_id
    -> JOIN seats se ON b.seat_id = se.seat_id
    -> JOIN payments p ON b.booking_id = p.booking_id;
+------------+----------+---------------+--------------+-------------+--------+----------------+
| booking_id | username | movie_name    | theater_name | seat_number | amount | payment_status |
+------------+----------+---------------+--------------+-------------+--------+----------------+
|          1 | Purnima  | Pushpa 2      | INOX         | A1          | 200.00 | Success        |
|          2 | Ravi     | Kalki 2898 AD | PVR          | B1          | 250.00 | Success        |
|          3 | Sita     | Devara        | Cinepolis    | C1          | 180.00 | Pending        |
+------------+----------+---------------+--------------+-------------+--------+----------------+
3 rows in set (0.00 sec)

