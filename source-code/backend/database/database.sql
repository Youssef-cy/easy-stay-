select * from users;
CREATE TABLE users (
    user_id      NUMBER PRIMARY KEY,
    first_name   VARCHAR2(50),
    last_name    VARCHAR2(50),
    phone_number VARCHAR2(20),
    location     VARCHAR2(100),
    email        VARCHAR2(100) UNIQUE,
    password     VARCHAR2(200)
);

drop sequence user_seq;
CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1 nocycle;

INSERT INTO users 
(user_id, first_name, last_name, phone_number, location, email, password)
VALUES 
(user_seq.NEXTVAL, 'Ahmed', 'Ali', '0101', 'Cairo', 'ahmed@mail.com', 'Test@123');

INSERT INTO users 
(user_id, first_name, last_name, phone_number, location, email, password)
VALUES 
(user_seq.NEXTVAL, 'Mohamed', 'Hassan', '0102', 'Giza', 'mohamed@mail.com', 'Pass@456');

INSERT INTO users 
(user_id, first_name, last_name, phone_number, location, email, password)
VALUES 
(user_seq.NEXTVAL, 'Sara', 'Mahmoud', '0103', 'Alex', 'sara@mail.com', 'Sara@789');

INSERT INTO users 
(user_id, first_name, last_name, phone_number, location, email, password)
VALUES 
(user_seq.NEXTVAL, 'Omar', 'Youssef', '0104', 'Cairo', 'omar@mail.com', 'Omar@321');

INSERT INTO users 
(user_id, first_name, last_name, phone_number, location, email, password)
VALUES 
(user_seq.NEXTVAL, 'Mona', 'Ibrahim', '0105', 'Tanta', 'mona@mail.com', 'Mona@654');

INSERT INTO users 
(user_id, first_name, last_name, phone_number, location, email, password)
VALUES 
(user_seq.NEXTVAL, 'Khaled', 'Sayed', '0106', 'Mansoura', 'khaled@mail.com', 'Khaled@987');

INSERT INTO users 
(user_id, first_name, last_name, phone_number, location, email, password)
VALUES 
(user_seq.NEXTVAL, 'Nour', 'Adel', '0107', 'Cairo', 'nour@mail.com', 'Nour@159');

INSERT INTO users 
(user_id, first_name, last_name, phone_number, location, email, password)
VALUES 
(user_seq.NEXTVAL, 'Hala', 'Fathy', '0108', 'Giza', 'hala@mail.com', 'Hala@753');

INSERT INTO users 
(user_id, first_name, last_name, phone_number, location, email, password)
VALUES 
(user_seq.NEXTVAL, 'Yassin', 'Mostafa', '0109', 'Aswan', 'yassin@mail.com', 'Yassin@852');

INSERT INTO users 
(user_id, first_name, last_name, phone_number, location, email, password)
VALUES 
(user_seq.NEXTVAL, 'Laila', 'Samir', '0110', 'Luxor', 'laila@mail.com', 'Laila@456');

-----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

select * from hotel;
CREATE TABLE hotel (
    hotel_id NUMBER PRIMARY KEY,
    hotel_name VARCHAR2(100),
    location VARCHAR2(100),
    owner VARCHAR2(100)
);
CREATE SEQUENCE hotel_seq START WITH 1 INCREMENT BY 1 nocycle;

INSERT INTO hotel VALUES (hotel_seq.NEXTVAL,'Sunrise Hotel','Cairo','Hassan');
INSERT INTO hotel VALUES (hotel_seq.NEXTVAL,'Sea View','Alex','Omar');
INSERT INTO hotel VALUES (hotel_seq.NEXTVAL,'Royal Stay','Giza','Adel');
INSERT INTO hotel VALUES (hotel_seq.NEXTVAL,'Blue Nile','Aswan','Mahmoud');
INSERT INTO hotel VALUES (hotel_seq.NEXTVAL,'Golden Inn','Luxor','Khaled');
INSERT INTO hotel VALUES (hotel_seq.NEXTVAL,'Sky Hotel','Cairo','Youssef');
INSERT INTO hotel VALUES (hotel_seq.NEXTVAL,'Palm Resort','Hurghada','Ali');
INSERT INTO hotel VALUES (hotel_seq.NEXTVAL,'Dream Hotel','Sharm','Mostafa');
INSERT INTO hotel VALUES (hotel_seq.NEXTVAL,'City Lodge','Tanta','Fathy');
INSERT INTO hotel VALUES (hotel_seq.NEXTVAL,'Moon Light','Mansoura','Samir');
--------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

CREATE TABLE room (
    room_id NUMBER PRIMARY KEY,
    hotel_id NUMBER,
    capacity NUMBER,
    facilities VARCHAR2(200),
    CONSTRAINT fk_room_hotel
        FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);

CREATE SEQUENCE room_seq START WITH 1 INCREMENT BY 1 nocycle;

INSERT INTO room VALUES (room_seq.NEXTVAL,1,2,'AC,TV');
INSERT INTO room VALUES (room_seq.NEXTVAL,2,3,'AC,Sea View');
INSERT INTO room VALUES (room_seq.NEXTVAL,3,2,'WiFi');
INSERT INTO room VALUES (room_seq.NEXTVAL,4,4,'AC,TV,WiFi');
INSERT INTO room VALUES (room_seq.NEXTVAL,5,1,'TV');
INSERT INTO room VALUES (room_seq.NEXTVAL,6,2,'AC');
INSERT INTO room VALUES (room_seq.NEXTVAL,7,3,'AC,Pool');
INSERT INTO room VALUES (room_seq.NEXTVAL,8,2,'WiFi');
INSERT INTO room VALUES (room_seq.NEXTVAL,9,1,'AC');
INSERT INTO room VALUES (room_seq.NEXTVAL,10,4,'AC,TV');
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------


CREATE TABLE service (
    service_id NUMBER PRIMARY KEY,
    guest_list VARCHAR2(200),
    check_in DATE,
    check_out DATE,
    balance_amount NUMBER(10,2),
    user_id NUMBER,
    room_id NUMBER,
    hotel_id NUMBER,
    CONSTRAINT fk_service_user
        FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_service_room
        FOREIGN KEY (room_id) REFERENCES room(room_id),
    CONSTRAINT fk_service_hotel
        FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);

CREATE SEQUENCE service_seq START WITH 1 INCREMENT BY 1 nocycle;

INSERT INTO service VALUES (service_seq.NEXTVAL,'Ahmed Ali',DATE '2025-01-01',DATE '2025-01-05',1500,1,1,1);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Mohamed Hassan',DATE '2025-01-02',DATE '2025-01-06',2000,2,2,2);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Sara Mahmoud',DATE '2025-01-03',DATE '2025-01-04',1800,3,3,3);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Omar Youssef',DATE '2025-01-04',DATE '2025-01-07',2200,4,4,4);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Mona Ibrahim',DATE '2025-01-05',DATE '2025-01-08',900,5,5,5);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Khaled Sayed',DATE '2025-01-06',DATE '2025-01-09',1600,6,6,6);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Nour Adel',DATE '2025-01-07',DATE '2025-01-10',2500,7,7,7);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Hala Fathy',DATE '2025-01-08',DATE '2025-01-11',3000,8,8,8);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Yassin Mostafa',DATE '2025-01-09',DATE '2025-01-12',1200,9,9,9);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Laila Samir',DATE '2025-01-10',DATE '2025-01-13',2800,10,10,10);

INSERT INTO service VALUES (service_seq.NEXTVAL,'Ahmed Ali',DATE '2025-02-01',DATE '2025-02-05',1500,1,2,2);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Mohamed Hassan',DATE '2025-02-02',DATE '2025-02-06',2000,2,3,3);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Sara Mahmoud',DATE '2025-02-03',DATE '2025-02-07',1800,3,4,4);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Omar Youssef',DATE '2025-02-04',DATE '2025-02-08',2200,4,5,5);
INSERT INTO service VALUES (service_seq.NEXTVAL,'Mona Ibrahim',DATE '2025-02-05',DATE '2025-02-09',900,5,6,6);

---------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------


CREATE TABLE transaction (
    transaction_id NUMBER PRIMARY KEY,
    amount NUMBER(10,2)
);

CREATE SEQUENCE transaction_seq START WITH 1 INCREMENT BY 1 nocycle;

INSERT INTO transaction VALUES (transaction_seq.NEXTVAL,1500);
INSERT INTO transaction VALUES (transaction_seq.NEXTVAL,2000);
INSERT INTO transaction VALUES (transaction_seq.NEXTVAL,1800);
INSERT INTO transaction VALUES (transaction_seq.NEXTVAL,2200);
INSERT INTO transaction VALUES (transaction_seq.NEXTVAL,900);
INSERT INTO transaction VALUES (transaction_seq.NEXTVAL,1600);
INSERT INTO transaction VALUES (transaction_seq.NEXTVAL,2500);
INSERT INTO transaction VALUES (transaction_seq.NEXTVAL,3000);
INSERT INTO transaction VALUES (transaction_seq.NEXTVAL,1200);
INSERT INTO transaction VALUES (transaction_seq.NEXTVAL,2800);
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

CREATE TABLE bill (
    bill_id NUMBER PRIMARY KEY,
    service_id NUMBER,
    transaction_id NUMBER,
    CONSTRAINT fk_bill_service
        FOREIGN KEY (service_id) REFERENCES service(service_id),
    CONSTRAINT fk_bill_transaction
        FOREIGN KEY (transaction_id) REFERENCES transaction(transaction_id)
);

CREATE SEQUENCE bill_seq START WITH 1 INCREMENT BY 1 nocycle;

INSERT INTO bill VALUES (bill_seq.NEXTVAL,1,1);
INSERT INTO bill VALUES (bill_seq.NEXTVAL,2,2);
INSERT INTO bill VALUES (bill_seq.NEXTVAL,3,3);
INSERT INTO bill VALUES (bill_seq.NEXTVAL,4,4);
INSERT INTO bill VALUES (bill_seq.NEXTVAL,5,5);
INSERT INTO bill VALUES (bill_seq.NEXTVAL,6,6);
INSERT INTO bill VALUES (bill_seq.NEXTVAL,7,7);
INSERT INTO bill VALUES (bill_seq.NEXTVAL,8,8);
INSERT INTO bill VALUES (bill_seq.NEXTVAL,9,9);
INSERT INTO bill VALUES (bill_seq.NEXTVAL,10,10);

-------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
--DROP TABLE bill CASCADE CONSTRAINTS;
--DROP TABLE transaction CASCADE CONSTRAINTS;
--DROP TABLE service CASCADE CONSTRAINTS;
--DROP TABLE room CASCADE CONSTRAINTS;
--DROP TABLE hotel CASCADE CONSTRAINTS;
--DROP TABLE users CASCADE CONSTRAINTS;


--query
-- Total revenue 1  ?????? ?????? ???? ???? ???????
SELECT SUM(amount) AS total_revenue
FROM transaction;

-------------------------------------------------------------------------
--Number of bookings per hotel 2   ??? ???????? ?? ?? ????
SELECT h.hotel_name, COUNT(s.service_id) AS total_bookings
FROM hotel h
JOIN service s ON h.hotel_id = s.hotel_id
GROUP BY h.hotel_name;


-------------------------------------------------------------------------
--Booking details with the user and the hotel 3 ?????? ????? ?? ??? ???????? ???? ??????


SELECT u.first_name || ' ' || u.last_name AS user_name,
       h.hotel_name,
       s.check_in,
       s.check_out,
       s.balance_amount
FROM service s
JOIN users u ON s.user_id = u.user_id
JOIN hotel h ON s.hotel_id = h.hotel_id;

----------------------------------------------------------------
--All rooms, even those not booked 4  ?? ????? ??? ???? ???????
SELECT r.room_id, h.hotel_name, s.service_id
FROM room r
LEFT JOIN service s ON r.room_id = s.room_id
JOIN hotel h ON r.hotel_id = h.hotel_id;

----------------------------------------------------------------
--Users who made reservations 5 ?????????? ???? ????? ??????
SELECT *
FROM users
WHERE user_id IN (
    SELECT user_id FROM service
);
----------------------------------------------------------------
--Invoice and payment details 6 ?????? ???????? ??????
SELECT u.first_name,
       h.hotel_name,
       t.amount,
       s.check_in,
       s.check_out
FROM bill b
JOIN transaction t ON b.transaction_id = t.transaction_id
JOIN service s ON b.service_id = s.service_id
JOIN users u ON s.user_id = u.user_id
JOIN hotel h ON s.hotel_id = h.hotel_id;
---------------------------------------------------------------------------
-- user more resrvestion 7   ??????? ???? ??? ???? ??????
SELECT u.first_name, COUNT(s.service_id) AS booking_count
FROM users u
JOIN service s ON u.user_id = s.user_id
GROUP BY u.first_name
ORDER BY booking_count DESC
FETCH FIRST 1 ROW ONLY;
---------------------------------------------------------------------------
--more expnsive resrvation 8 ???? ??? ?? ???????
SELECT *
FROM service
WHERE balance_amount = (
    SELECT MAX(balance_amount) FROM service
);
---------------------------------------------------------------------------
--Users who have not made any reservations 9 ?????????? ???? ?? ????? ????
SELECT *
FROM users
WHERE user_id NOT IN (
    SELECT user_id FROM service
);

---------------------------------------------------------------------------
-- number of reservation for each user 10 ??? ???????? ??? ?????? (??? ???? ???)
SELECT u.first_name, COUNT(s.service_id) AS booking_count
FROM users u
LEFT JOIN service s ON u.user_id = s.user_id
GROUP BY u.first_name;
