CREATE OR REPLACE FUNCTION get_user_count
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM USERS;

    RETURN v_count;
END;
/
DECLARE
    total_users NUMBER;
BEGIN
    total_users := get_user_count;
    DBMS_OUTPUT.PUT_LINE('Total users: ' || total_users);
END;
/



--------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE add_user(
    p_user_id    USERS.user_id%TYPE,
    p_name       USERS.name%TYPE,
    p_email      USERS.email%TYPE,
    p_phone      USERS.phone%TYPE
)
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM USERS
    WHERE phone = p_phone;

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Phone number already exists!');
    ELSE
        INSERT INTO USERS(user_id, name, email, phone)
        VALUES(p_user_id, p_name, p_email, p_phone);
        DBMS_OUTPUT.PUT_LINE('User added successfully.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
BEGIN
    add_user(101, 'Youssef', 'youssef@example.com', '0123456789');
END;
/


--------------------------------------------------------------------

--hager fouad 

CREATE TABLE bill (
    service_id     NUMBER,
    transaction_id NUMBER
);

INSERT INTO bill VALUES (1, 1001);
INSERT INTO bill VALUES (22,2008);
INSERT INTO bill VALUES (12,2009);
INSERT INTO bill VALUES (5,1950);
INSERT INTO bill VALUES (30,2011);



SELECT * FROM bill;

CREATE OR REPLACE FUNCTION is_service_billed(p_service_id NUMBER)
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM BILL
    WHERE service_id = p_service_id;

    IF v_count > 0 THEN
        RETURN 1;  
    ELSE
        RETURN 0; 
    END IF;
END;
/
DECLARE
    billed_status NUMBER;
BEGIN
    billed_status := is_service_billed(101);
    IF billed_status = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Service is billed.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Service is not billed.');
    END IF;
END;
/


---------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE create_bill(
    p_service_id    BILL.service_id%TYPE,
    p_transaction_id BILL.transaction_id%TYPE
)
IS
BEGIN
    INSERT INTO BILL( service_id, transaction_id )
    VALUES( p_service_id, p_transaction_id );

    DBMS_OUTPUT.PUT_LINE('Bill created successfully.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating bill: ' || SQLERRM);
END;
/
BEGIN
    create_bill( 101, 301);
END;
/
