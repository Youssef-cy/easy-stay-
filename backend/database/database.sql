select * from users;
-- users table yossef
create table users (
user_id number primary key,
first_name varchar2(50),
last_name varchar2(50),
phone_number number(20),
location varchar2(100),
email varchar2(100) unique,
password varchar2(200)
);

create sequence user_seq start with 1 increment by 1 nocycle;

insert into users values (user_seq.nextval,'Ahmed','Ali',0101,'Cairo','ahmed@mail.com','Test@123');
-----------------------------------------------------------------------------------------------------
insert into users values (user_seq.nextval,'Mohamed','Hassan',0102,'Giza','mohamed@mail.com','Pass@456');
----------------------------------------------------------------------------------------------------------
insert into users values (user_seq.nextval,'Sara','Mahmoud',0103 ,'Alex','sara@mail.com','Sara@789');
----------------------------------------------------------------------------------------------------
insert into users values (user_seq.nextval,'Omar','Youssef',0104,'Cairo','omar@mail.com','Omar@321');
--------------------------------------------------------------------------------------------------------
insert into users values (user_seq.nextval,'Mona','Ibrahim',0105,'Tanta','mona@mail.com','Mona@654');
-------------------------------------------------------------------------------------------------------
insert into users values (user_seq.nextval,'Khaled','Sayed',0106,'Mansoura','khaled@mail.com','Khaled@987');
-------------------------------------------------------------------------------------------------------------
insert into users values (user_seq.nextval,'Nour','Adel',0107,'Cairo','nour@mail.com','Nour@159');
--------------------------------------------------------------------------------------------------
insert into users values (user_seq.nextval,'Hala','Fathy',0108,'Giza','hala@mail.com','Hala@753');
---------------------------------------------------------------------------------------------------------
insert into users values (user_seq.nextval,'Yassin','Mostafa',0109,'Aswan','yassin@mail.com','Yassin@852');
------------------------------------------------------------------------------------------------------------
insert into users values (user_seq.nextval,'Laila','Samir',0110,'Luxor','laila@mail.com','Laila@456');


--------------------------------------------------
--------------------------------------------------

-- hotel table
create table hotel (
hotel_id number primary key,
hotel_name varchar2(100),
location varchar2(100),
owner varchar2(100)
);


create sequence hotel_seq start with 1 increment by 1 nocycle;

insert into hotel values (hotel_seq.nextval,'Sunrise Hotel','Cairo','Hassan');
---------------------------------------------------------------------------------
insert into hotel values (hotel_seq.nextval,'Sea View','Alex','Omar');
--------------------------------------------------------------------------------------
insert into hotel values (hotel_seq.nextval,'Royal Stay','Giza','Adel');
------------------------------------------------------------------------
insert into hotel values (hotel_seq.nextval,'Blue Nile','Aswan','Mahmoud');
-----------------------------------------------------------------------------------
insert into hotel values (hotel_seq.nextval,'Golden Inn','Luxor','Khaled');
----------------------------------------------------------------------------
insert into hotel values (hotel_seq.nextval,'Sky Hotel','Cairo','Youssef');
--------------------------------------------------------------------------------------------
insert into hotel values (hotel_seq.nextval,'Palm Resort','Hurghada','Ali');
-----------------------------------------------------------------------------
insert into hotel values (hotel_seq.nextval,'Dream Hotel','Sharm','Mostafa');
------------------------------------------------------------------------------
insert into hotel values (hotel_seq.nextval,'City Lodge','Tanta','Fathy');
----------------------------------------------------------------------------------
insert into hotel values (hotel_seq.nextval,'Moon Light','Mansoura','Samir');

--------------------------------------------------
--------------------------------------------------

-- room table
create table room (
room_id number primary key,
hotel_id number,
capacity number,
user_id number,
facilities varchar2(200),
room_type varchar2(100),
constraint fk_room_hotel foreign key (hotel_id) references hotel(hotel_id),
constraint fk_user_room foreign key (user_id) references users(user_id));

create sequence room_seq start with 1 increment by 1 nocycle;

INSERT INTO room
(room_id, hotel_id, capacity, user_id, facilities, room_type)
VALUES
(room_seq.NEXTVAL, 1, 2, 1, 'AC,TV', 'Single');
INSERT INTO room
(room_id, hotel_id, capacity, user_id, facilities, room_type)
VALUES
(room_seq.NEXTVAL, 2, 3, 2, 'AC,Sea View', 'Double');

INSERT INTO room
(room_id, hotel_id, capacity, user_id, facilities, room_type)
VALUES
(room_seq.NEXTVAL, 3, 2, 3, 'WiFi', 'Single');

INSERT INTO room
(room_id, hotel_id, capacity, user_id, facilities, room_type)
VALUES
(room_seq.NEXTVAL, 4, 4, 4, 'AC,TV,WiFi', 'Suite');

INSERT INTO room
(room_id, hotel_id, capacity, user_id, facilities, room_type)
VALUES
(room_seq.NEXTVAL, 5, 1, 5, 'TV', 'Single');

INSERT INTO room
(room_id, hotel_id, capacity, user_id, facilities, room_type)
VALUES
(room_seq.NEXTVAL, 6, 2, 6, 'AC', 'Double');

INSERT INTO room
(room_id, hotel_id, capacity, user_id, facilities, room_type)
VALUES
(room_seq.NEXTVAL, 7, 3, 7, 'AC,Pool', 'Suite');

INSERT INTO room
(room_id, hotel_id, capacity, user_id, facilities, room_type)
VALUES
(room_seq.NEXTVAL, 8, 2, 8, 'WiFi', 'Single');

INSERT INTO room
(room_id, hotel_id, capacity, user_id, facilities, room_type)
VALUES
(room_seq.NEXTVAL, 9, 1, 9, 'AC', 'Single');

INSERT INTO room
(room_id, hotel_id, capacity, user_id, facilities, room_type)
VALUES
(room_seq.NEXTVAL, 10, 4, 10, 'AC,TV', 'Suite');

--------------------------------------------------
--------------------------------------------------

-- reservation table (15 inserts)
create table reservation (
reservation_id number primary key,
guest_list varchar2(200),
check_in date,
check_out date,
balance_amount number(10,2),
user_id number,
room_id number,
hotel_id number
);

create sequence reservation_seq start with 1 increment by 1 nocycle;

insert into reservation values (reservation_seq.nextval,'Ahmed Ali',date '2025-01-01',date '2025-01-05',1500,1,1,1);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Mohamed Hassan',date '2025-01-02',date '2025-01-06',2000,2,2,2);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Sara Mahmoud',date '2025-01-03',date '2025-01-04',1800,3,3,3);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Omar Youssef',date '2025-01-04',date '2025-01-07',2200,4,4,4);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Mona Ibrahim',date '2025-01-05',date '2025-01-08',900,5,5,5);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Khaled Sayed',date '2025-01-06',date '2025-01-09',1600,6,6,6);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Nour Adel',date '2025-01-07',date '2025-01-10',2500,7,7,7);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Hala Fathy',date '2025-01-08',date '2025-01-11',3000,8,8,8);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Yassin Mostafa',date '2025-01-09',date '2025-01-12',1200,9,9,9);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Laila Samir',date '2025-01-10',date '2025-01-13',2800,10,10,10);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Ahmed Ali',date '2025-02-01',date '2025-02-05',1500,1,2,2);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Mohamed Hassan',date '2025-02-02',date '2025-02-06',2000,2,3,3);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Sara Mahmoud',date '2025-02-03',date '2025-02-07',1800,3,4,4);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Omar Youssef',date '2025-02-04',date '2025-02-08',2200,4,5,5);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Mona Ibrahim',date '2025-02-05',date '2025-02-09',900,5,6,6);
--------------------------------------------------
insert into reservation values (reservation_seq.nextval,'Khaled Sayed', DATE '2025-01-01',DATE '2025-01-05',0, 3, 2,2);

--------------------------------------------------
--------------------------------------------------
-- transaction table
-------------------------------------------------------------
------------------------------------------------------------------
create table transactions (
transaction_id number primary key,
amount number(10,2),
transaction_date date,
payment_method VARCHAR2(30),
 payment_status VARCHAR2(20)
);



create sequence transaction_seq start with 1 increment by 1 nocycle;

INSERT INTO transactions
(transaction_id, amount, transaction_date, payment_method, payment_status)
VALUES
(transaction_seq.NEXTVAL, 1500, DATE '2025-01-01', 'Cash', 'PAID');

INSERT INTO transactions
(transaction_id, amount, transaction_date, payment_method, payment_status)
VALUES
(transaction_seq.NEXTVAL, 2000, DATE '2025-01-02', 'Visa', 'PAID');

INSERT INTO transactions
(transaction_id, amount, transaction_date, payment_method, payment_status)
VALUES
(transaction_seq.NEXTVAL, 1800, DATE '2025-01-03', 'Wallet', 'PAID');

INSERT INTO transactions
(transaction_id, amount, transaction_date, payment_method, payment_status)
VALUES
(transaction_seq.NEXTVAL, 2200, DATE '2025-01-04', 'Cash', 'PENDING');

INSERT INTO transactions
(transaction_id, amount, transaction_date, payment_method, payment_status)
VALUES
(transaction_seq.NEXTVAL, 900, DATE '2025-01-05', 'Visa', 'PAID');

INSERT INTO transactions
(transaction_id, amount, transaction_date, payment_method, payment_status)
VALUES
(transaction_seq.NEXTVAL, 1600, DATE '2025-01-06', 'Cash', 'PAID');

INSERT INTO transactions
(transaction_id, amount, transaction_date, payment_method, payment_status)
VALUES
(transaction_seq.NEXTVAL, 2500, DATE '2025-01-07', 'Wallet', 'PAID');

INSERT INTO transactions
(transaction_id, amount, transaction_date, payment_method, payment_status)
VALUES
(transaction_seq.NEXTVAL, 3000, DATE '2025-01-08', 'Visa', 'PAID');

INSERT INTO transactions
(transaction_id, amount, transaction_date, payment_method, payment_status)
VALUES
(transaction_seq.NEXTVAL, 1200, DATE '2025-01-09', 'Cash', 'FAILED');

insert into transactions 
(transaction_id, amount, transaction_date, payment_method, payment_status)
 values 
 (transaction_seq.nextval,2800,date '2025-01-10','Visa','FAILED');
--------------------------------------------------
--bill table
create table bill (
bill_id number primary key,
reservation_id number,
transaction_id number,
bill_date date,
constraint fk_bill_res foreign key (reservation_id)
references reservation(reservation_id),
constraint fk_bill_trans foreign key (transaction_id)
references transactions(transaction_id)
);
-----------------------------------
create sequence bill_seq start with 1 increment by 1 nocycle;

INSERT INTO bill
(bill_id, reservation_id, transaction_id, bill_date)
VALUES
(bill_seq.NEXTVAL, 1, 1, DATE '2025-01-01');

INSERT INTO bill
(bill_id, reservation_id, transaction_id, bill_date)
VALUES
(bill_seq.NEXTVAL, 2, 2, DATE '2025-01-02');

INSERT INTO bill
(bill_id, reservation_id, transaction_id, bill_date)
VALUES
(bill_seq.NEXTVAL, 3, 3, DATE '2025-01-03');

INSERT INTO bill
(bill_id, reservation_id, transaction_id, bill_date)
VALUES
(bill_seq.NEXTVAL, 4, 4, DATE '2025-01-04');

INSERT INTO bill
(bill_id, reservation_id, transaction_id, bill_date)
VALUES
(bill_seq.NEXTVAL, 5, 5, DATE '2025-01-05');

INSERT INTO bill
(bill_id, reservation_id, transaction_id, bill_date)
VALUES
(bill_seq.NEXTVAL, 6, 6, DATE '2025-01-06');

INSERT INTO bill
(bill_id, reservation_id, transaction_id, bill_date)
VALUES
(bill_seq.NEXTVAL, 7, 7, DATE '2025-01-07');

INSERT INTO bill
(bill_id, reservation_id, transaction_id, bill_date)
VALUES
(bill_seq.NEXTVAL, 8, 8, DATE '2025-01-08');

INSERT INTO bill
(bill_id, reservation_id, transaction_id, bill_date)
VALUES
(bill_seq.NEXTVAL, 9, 9, DATE '2025-01-09');

INSERT INTO bill
(bill_id, reservation_id, transaction_id, bill_date)
VALUES
(bill_seq.NEXTVAL, 10, 10, DATE '2025-01-10');

--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
-- select all data
select * from users;
--------------------------------------------------
select * from hotel;
--------------------------------------------------
select * from room;
--------------------------------------------------
select * from reservation;
--------------------------------------------------
select * from transactions;
--------------------------------------------------
select * from bill;
----------------------------------------------
----------------------------------------------
----------------------------------------------
--------------------------------------------------



-- drop table bill cascade constraints;
-- drop table reservation cascade constraints;
-- drop table room cascade constraints;
-- drop table hotel cascade constraints;
-- drop table users cascade constraints;
-- drop table transactions cascade constraints;
-- --
-- --------------------------------------------------
-- -- drop sequences

-- drop sequence bill_seq;
-- drop sequence reservation_seq;
-- drop sequence room_seq;
-- drop sequence hotel_seq;
-- drop sequence user_seq;
-- drop sequence transaction_seq;

--
--------------------------------------------------
----------------------------------------------



-----------------------------------------------------
CREATE OR REPLACE PACKAGE hotel_plsql_pkg
IS
    -- Task 1 yossef: Counts total registered users/guests
    FUNCTION count_total_users
        RETURN NUMBER;

    -- Task 2: Checks reservation billing status
    FUNCTION check_reservation_billing (
        p_reservation_id IN NUMBER
    ) RETURN VARCHAR2;

    -- Task 3: Calculates nights between check-in and check-out
    FUNCTION calculate_stay_duration (
        p_check_in  IN DATE,
        p_check_out IN DATE
    ) RETURN NUMBER;

    -- Task 4: Retrieves unpaid balance for a reservation
    FUNCTION get_reservation_balance (
        p_reservation_id IN NUMBER
    ) RETURN NUMBER;

    -- Task 5: Counts currently active/check-in guests
    FUNCTION get_active_guests
        RETURN NUMBER;

    -- Task 6: Counts reservations filtered by location (hotel address)
    FUNCTION get_reservations_by_location (
        p_location IN VARCHAR2
    ) RETURN NUMBER;

    -- Task 7: Sums all revenue from bookings/payments
    FUNCTION calculate_total_revenue
        RETURN NUMBER;

    -- -- Task 8 abdo hossam: Retrieves guest name by room ID
    -- FUNCTION give_guest_by_room_id (
    --     p_id IN room.room_id%TYPE  -- Assumes 'room' table exists [web:7][page:0]
    -- ) RETURN VARCHAR2;
END hotel_plsql_pkg;
/






CREATE OR REPLACE PACKAGE BODY hotel_plsql_pkg
IS
    -- Task 1: Count Total Users yossef
    FUNCTION count_total_users
    RETURN NUMBER
    IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM users;
        RETURN v_count;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END;

    -- Task 2: Check Reservation Billing Status ahmed hossam
    FUNCTION check_reservation_billing (
        p_reservation_id IN NUMBER
    ) RETURN VARCHAR2
    IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM bill
        WHERE reservation_id = p_reservation_id;

        IF v_count > 0 THEN
            RETURN 'Billed';
        ELSE
            RETURN 'Not Billed';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error';
    END;

    -- Task 3: Calculate Stay Duration mohned
    FUNCTION calculate_stay_duration (
        p_check_in  IN DATE,
        p_check_out IN DATE
    ) RETURN NUMBER
    IS
    BEGIN
        RETURN p_check_out - p_check_in;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END;

    -- Task 4: Get Reservation Balance hager
    FUNCTION get_reservation_balance (
        p_reservation_id IN NUMBER
    ) RETURN NUMBER
    IS
        v_balance NUMBER;
    BEGIN
        SELECT balance_amount
        INTO v_balance
        FROM reservation
        WHERE reservation_id = p_reservation_id;

        RETURN v_balance;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            RETURN -1;
    END;

    -- Task 5: Get Active Guests rodina
    FUNCTION get_active_guests
    RETURN NUMBER
    IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM reservation ;
       

        RETURN v_count;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END;

    -- Task 6: Get Reservations by Location abdo hossam
    FUNCTION get_reservations_by_location (
        p_location IN VARCHAR2
    ) RETURN NUMBER
    IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM reservation r
        JOIN hotel h ON r.hotel_id = h.hotel_id
        WHERE h.location = p_location;

        RETURN v_count;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END;

    -- Task 7: Calculate Total Revenue ahmed noor
    FUNCTION calculate_total_revenue
    RETURN NUMBER
    IS
        v_total NUMBER;
    BEGIN
        SELECT SUM(amount)
        INTO v_total
        FROM transactions;

        RETURN NVL(v_total, 0);
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END;
    ----------------------------------------
--     FUNCTION give_guest_by_room_id (p_id IN room.room_id%TYPE)
--     RETURN VARCHAR2
-- IS
--     v_room_id   NUMBER;
--     v_name      VARCHAR2 (40);
-- BEGIN
--     SELECT room_id, first_name || ' ' || last_name
--       INTO v_room_id, v_name
--       FROM room r JOIN users u ON r.user_id = u.USER_ID
--      WHERE room_id = p_id;

--     RETURN v_name;
-- EXCEPTION
--     WHEN NO_DATA_FOUND THEN
--         RETURN 'No guest found for the given room ID.';
--     WHEN OTHERS THEN
--         RETURN 'An error occurred.';
-- END give_guest_by_room_id;

END hotel_plsql_pkg;
/



















--count_total_users
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Total Users = ' || hotel_plsql_pkg.count_total_users
    );
END;
/
--check_reservation_billing
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Billing Status = ' ||
        hotel_plsql_pkg.check_reservation_billing(10)
    );
END;
/
--calculate_stay_duration
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Stay Duration = ' ||
        hotel_plsql_pkg.calculate_stay_duration(
            DATE '2025-01-01',
            DATE '2025-01-05'
        ) || ' days'
    );
END;
/
--get_reservation_balance
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Reservation Balance = ' ||
        hotel_plsql_pkg.get_reservation_balance(10)
    );
END;
/
--get_active_guests
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Active Guests = ' ||
        hotel_plsql_pkg.get_active_guests
    );
END;
/
--get_reservations_by_location
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Reservations in Cairo = ' ||
        hotel_plsql_pkg.get_reservations_by_location('Cairo')
    );
END;
/
--calculate_total_revenue
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Total Revenue = ' ||
        hotel_plsql_pkg.calculate_total_revenue
    );
END;
/
--give_guest_by_room_id
BEGIN
    DBMS_OUTPUT.put_line (give_guest_by_room_id (3));
END;


BEGIN
    DBMS_OUTPUT.PUT_LINE('Total Users: ' ||
        hotel_plsql_pkg.count_total_users);

    DBMS_OUTPUT.PUT_LINE('Billing Status: ' ||
        hotel_plsql_pkg.check_reservation_billing(101));

    DBMS_OUTPUT.PUT_LINE('Stay Duration: ' ||
        hotel_plsql_pkg.calculate_stay_duration(
            DATE '2025-01-01', DATE '2025-01-05'));

    DBMS_OUTPUT.PUT_LINE('Reservation Balance: ' ||
        hotel_plsql_pkg.get_reservation_balance(10));

    DBMS_OUTPUT.PUT_LINE('Active Guests: ' ||
        hotel_plsql_pkg.get_active_guests);

    DBMS_OUTPUT.PUT_LINE('Reservations in Cairo: ' ||
        hotel_plsql_pkg.get_reservations_by_location('Cairo'));

    DBMS_OUTPUT.PUT_LINE('Total Revenue: ' ||
        hotel_plsql_pkg.calculate_total_revenue);
END;
/














CREATE OR REPLACE PACKAGE hotel_pkg
IS
    --------------------------------------------------
    -- add new user yossef yasser
    --------------------------------------------------
    PROCEDURE add_user
    (
        p_first_name IN users.first_name%TYPE,
        p_last_name  IN users.last_name%TYPE,
        p_phone      IN users.phone_number%TYPE,
        p_location   IN users.location%TYPE,
        p_email      IN users.email%TYPE,
        p_password   IN users.password%TYPE
    );

    --------------------------------------------------
    -- add new hotel mohnad
    --------------------------------------------------
    PROCEDURE add_hotel
    (
        p_name     IN hotel.hotel_name%TYPE,
        p_location IN hotel.location%TYPE,
        p_owner    IN hotel.owner%TYPE
    );

    --------------------------------------------------
    -- add new room ahmed noor
    --------------------------------------------------
    PROCEDURE add_room
    (
        p_hotel_id   IN room.hotel_id%TYPE,
        p_capacity   IN room.capacity%TYPE,
        p_facilities IN room.facilities%TYPE,
        p_room_type  IN room.room_type%TYPE
    );

    --------------------------------------------------
    -- create reservation ahemd hossam
    --------------------------------------------------
    PROCEDURE create_reservation
    (
        p_guest_list IN varchar2,
        p_check_in   IN DATE,
        p_check_out  IN DATE,
        p_balance    IN NUMBER
    );

    --------------------------------------------------
    -- search reservation by guest name  ahmed hossam and abdo
    --------------------------------------------------
    PROCEDURE search_resarvation_by_guest
    (
        p_guest_name IN reservation.guest_list%TYPE
    );

    --------------------------------------------------
    -- pay remaining balance abdulrhman hossam
    --------------------------------------------------
    PROCEDURE pay_remaining_balance
    (
        p_reservation_id IN reservation.reservation_id%TYPE,
        p_payment_amount IN NUMBER
    );

    --------------------------------------------------
    -- get users with remaining balance hager
    --------------------------------------------------
    PROCEDURE get_users_with_balance;

    --------------------------------------------------
    -- get all paid payments rodina
    --------------------------------------------------
    PROCEDURE get_paid_payments;

END hotel_pkg;
/

/
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY hotel_pkg
IS
--------------------------------------------------------
PROCEDURE add_user
(
    p_first_name IN users.first_name%TYPE,
    p_last_name  IN users.last_name%TYPE,
    p_phone      IN users.phone_number%TYPE,
    p_location   IN users.location%TYPE,
    p_email      IN users.email%TYPE,
    p_password   IN users.password%TYPE
)
IS
BEGIN
    INSERT INTO users
    VALUES (
        user_seq.NEXTVAL,
        p_first_name,
        p_last_name,
        p_phone,
        p_location,
        p_email,
        p_password
    );
END add_user;

--------------------------------------------------------
PROCEDURE add_hotel
(
    p_name     IN hotel.hotel_name%TYPE,
    p_location IN hotel.location%TYPE,
    p_owner    IN hotel.owner%TYPE
)
IS
BEGIN
    INSERT INTO hotel
    VALUES (
        hotel_seq.NEXTVAL,
        p_name,
        p_location,
        p_owner
    );
END add_hotel;

--------------------------------------------------------
PROCEDURE add_room
(
    p_hotel_id   IN room.hotel_id%TYPE,
    p_capacity   IN room.capacity%TYPE,
    p_facilities IN room.facilities%TYPE,
    p_room_type  IN room.room_type%TYPE
)
IS
BEGIN
    
    INSERT INTO room
    (
        room_id,
        hotel_id,
        capacity,
        facilities,
        room_type
    )
    VALUES
    (
        room_seq.NEXTVAL,
        p_hotel_id,
        p_capacity,
        p_facilities,
        p_room_type
    );
END add_room;

--------------------------------------------------------
PROCEDURE create_reservation
(
    p_guest_list IN VARCHAR2,
    p_check_in   IN DATE,
    p_check_out  IN DATE,
    p_balance    IN NUMBER
)
IS
BEGIN
    INSERT INTO reservation
    (
        reservation_id,
        guest_list,
        check_in,
        check_out,
        balance_amount
    )
    VALUES
    (
        reservation_seq.NEXTVAL,
        p_guest_list,
        p_check_in,
        p_check_out,
        p_balance
    );
END create_reservation;

--------------------------------------------------------
PROCEDURE search_resarvation_by_guest
(
    p_guest_name IN reservation.guest_list%TYPE
)
IS
    CURSOR c_res IS
        SELECT r.guest_list,
               r.check_in,
               r.check_out,
               h.hotel_name
        FROM reservation r
        JOIN hotel h ON r.hotel_id = h.hotel_id
        WHERE r.guest_list = p_guest_name;

    v_rec c_res%ROWTYPE;
BEGIN
    OPEN c_res;
    LOOP
        FETCH c_res INTO v_rec;
        EXIT WHEN c_res%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_rec.guest_list || ' | ' ||
            v_rec.hotel_name || ' | ' ||
            v_rec.check_in || ' -> ' ||
            v_rec.check_out
        );
    END LOOP;
    CLOSE c_res;
END search_resarvation_by_guest;

--------------------------------------------------------
PROCEDURE pay_remaining_balance
(
    p_reservation_id IN reservation.reservation_id%TYPE,
    p_payment_amount IN NUMBER
)
IS
    v_balance reservation.balance_amount%TYPE;
BEGIN
    SELECT balance_amount
    INTO v_balance
    FROM reservation
    WHERE reservation_id = p_reservation_id;

    IF p_payment_amount > v_balance THEN
        RAISE_APPLICATION_ERROR(-20001,'Amount greater than balance');
    END IF;

    UPDATE reservation
    SET balance_amount = balance_amount - p_payment_amount
    WHERE reservation_id = p_reservation_id;

    
    INSERT INTO transactions
    (
        transaction_id,
        amount,
        transaction_date,
        payment_method,
        payment_status
    )
    VALUES
    (
        transaction_seq.NEXTVAL,
        p_payment_amount,
        SYSDATE,
        'Cash',
        'PAID'
    );

    
    INSERT INTO bill
    (
        bill_id,
        reservation_id,
        transaction_id,
        bill_date
    )
    VALUES
    (
        bill_seq.NEXTVAL,
        p_reservation_id,
        transaction_seq.CURRVAL,
        SYSDATE
    );
END pay_remaining_balance;

--------------------------------------------------------
PROCEDURE get_users_with_balance
IS
    CURSOR c_users IS
        SELECT u.first_name,
               u.last_name,
               u.phone_number,
               r.balance_amount
        FROM users u
        JOIN reservation r ON u.user_id = r.user_id
        WHERE r.balance_amount > 0;

    v_user c_users%ROWTYPE;
BEGIN
    OPEN c_users;
    LOOP
        FETCH c_users INTO v_user;
        EXIT WHEN c_users%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_user.first_name || ' ' ||
            v_user.last_name || ' | ' ||
            v_user.phone_number ||
            ' | Balance: ' || v_user.balance_amount
        );
    END LOOP;
    CLOSE c_users;
END get_users_with_balance;

--------------------------------------------------------
PROCEDURE get_paid_payments
IS
    CURSOR paid_payments_cur IS
        SELECT
            u.first_name || ' ' || u.last_name AS full_name,
            t.amount,
            t.payment_status
        FROM transactions t
        JOIN bill b ON t.transaction_id = b.transaction_id
        JOIN reservation r ON b.reservation_id = r.reservation_id
        JOIN users u ON r.user_id = u.user_id
        WHERE t.payment_status = 'PAID';

    v_payment_rec paid_payments_cur%ROWTYPE;
BEGIN
    OPEN paid_payments_cur;
    LOOP
        FETCH paid_payments_cur INTO v_payment_rec;
        EXIT WHEN paid_payments_cur%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Name: ' || v_payment_rec.full_name ||
            ' | Amount: ' || v_payment_rec.amount ||
            ' | Status: ' || v_payment_rec.payment_status
        );
    END LOOP;
    CLOSE paid_payments_cur;
END get_paid_payments;

END hotel_pkg;
/


BEGIN
    hotel_pkg.add_user(
        'Abdulrhman',
        'Hossam',
        01099999999,
        'Cairo',
        'abdulrhman@mail.com',
        'Abdo@123'
    );
END;
/

SELECT * FROM users;

/

BEGIN
    hotel_pkg.add_hotel(
        'Sun Hotel',
        'Alex',
        'Hassan'
    );
END;
/
SELECT * FROM hotel;


/

BEGIN
    hotel_pkg.add_room(
        1,             
        3,              
        'AC, TV, WiFi',
        'laxury'
    );
END;
/
SELECT * FROM room;
/

BEGIN
    hotel_pkg.create_reservation(
        'Abdulrhman Hossam',
        DATE '2025-04-01',
        DATE '2025-04-05',
        2500
    );
END;
/
SELECT * FROM reservation;
/


BEGIN
    hotel_pkg.search_resarvation_by_guest(
        'Ahmed Ali'
    );
END;
/
BEGIN
    hotel_pkg.pay_remaining_balance(
        1,      
        1000    
    );
END;
/
SELECT * FROM reservation;
SELECT * FROM transactions;
SELECT * FROM bill;
/


BEGIN
    hotel_pkg.get_users_with_balance;
END;
/




BEGIN
    hotel_pkg.get_paid_payments;
END;
/










-- queries

-- Total revenue 1  ?????? ?????? ???? ???? ??????? ahmed hossam
select sum(amount) as total_revenue
from transactions;

--------------------------------------------------

-- Number of bookings per hotel 2   ??? ???????? ?? ?? ???? ahmed hossam
select h.hotel_name, count(r.reservation_id) total_bookings
from hotel h
join reservation r
on h.hotel_id = r.hotel_id
group by h.hotel_name;

----



-- Booking details with the user and the hotel 3 ?????? ????? ?? ??? ???????? ???? ?????? ahmed noor
select u.first_name || ' ' || u.last_name user_name,
       h.hotel_name,
       r.check_in,
       r.check_out,
       r.balance_amount
from reservation r
join users u on r.user_id = u.user_id
join hotel h on r.hotel_id = h.hotel_id;

--------------------------------------------------

-- All rooms, even those  booked 4  ?? ????? ??? ???? ??????? mohnad
select rm.room_id,
       h.hotel_name,
       r.reservation_id
from room rm join reservation r
on rm.room_id = r.room_id
join hotel h
on rm.hotel_id = h.hotel_id;

--------------------------------------------------

-- Users who made reservations 5 ?????????? ???? ????? ?????? mohned
select *
from users
where user_id in (
    select user_id from reservation
);

--------------------------------------------------

-- Invoice and payment details money payed and balance_amount  6 ?????? ???????? ?????? hager 
select u.first_name,
       h.hotel_name,
       t.amount,
       r.check_in,
       r.check_out,
       balance_amount
from bill b
join transactions t on b.transaction_id = t.transaction_id
join reservation r on b.reservation_id = r.reservation_id
join users u on r.user_id = u.user_id
join hotel h on r.hotel_id = h.hotel_id;

--------------------------------------------------

-- user more reservation in system 7   ??????? ???? ??? ???? ?????? yossef yasser
select u.first_name,
       count(r.reservation_id) booking_count
from users u
join reservation r
on u.user_id = r.user_id
group by u.first_name
order by booking_count desc
fetch first 1 row only;

--------------------------------------------------

-- more balnce amout reservation 8 ???? ??? ?? ??????? rodina
select *
from reservation
where balance_amount = (
    select max(balance_amount)
    from reservation
);

--------------------------------------------------

-- number of reservation for each user 10 ??? ???????? ??? ?????? rodina
select u.first_name,
       count(r.reservation_id) booking_count
from users u
left join reservation r
on u.user_id = r.user_id
group by u.first_name;



--return all users payment status FAILED 11 ??????? ???? ?????? abdo
SELECT
    u.first_name || ' ' || u.last_name AS user_name,
    u.phone_number,
    h.hotel_name,
    t.payment_status
FROM users u
JOIN reservation r
    ON u.user_id = r.user_id
JOIN bill b
    ON r.reservation_id = b.reservation_id
JOIN transactions t
    ON b.transaction_id = t.transaction_id
JOIN hotel h
    ON r.hotel_id = h.hotel_id
WHERE t.payment_status = 'FAILED';

select * from transactions;

















CREATE OR REPLACE TRIGGER trg_reservation_before_insert
BEFORE INSERT ON reservation
FOR EACH ROW
BEGIN
    IF :NEW.check_out <= :NEW.check_in THEN
        RAISE_APPLICATION_ERROR(
            -20010,
            'Check-out date must be after check-in date'
        );
    END IF;
END;
/
SHOW ERRORS;


/


CREATE OR REPLACE TRIGGER trg_reservation_after_delete
AFTER DELETE ON reservation
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Reservation deleted: ID = ' || :OLD.reservation_id
    );
END;
/
SHOW ERRORS;

/

CREATE OR REPLACE TRIGGER trg_reservation_after_update
AFTER UPDATE OF balance_amount ON reservation
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        'Reservation ' || :OLD.reservation_id ||
        ' balance updated from ' || :OLD.balance_amount ||
        ' to ' || :NEW.balance_amount
    );
END; 
/
SHOW ERRORS;