--CRAETE TABLE TRANSACTIONS--
CREATE TABLE transactions (
  transactions_id NUMBER PRIMARY KEY,
  amount NUMBER(12,2) NOT NULL
);

--CREATE SEQUENCE-
CREATE SEQUENCE transactions_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCACHE
NOCYCLE;

--INSERT DATA--
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 450.75);
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 1299.99);
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 2750.50);
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 3890.00);
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 5120.25);
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 640.80);
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 7999.99);
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 2150.00);
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 9600.40);
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 3325.60);
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 15000.00);
INSERT INTO transactions VALUES (transactions_seq.NEXTVAL, 875.30);

--CREATE FUNCTION TOTAL FOR REVENUE--
CREATE OR REPLACE FUNCTION get_total_revenue
RETURN NUMBER
IS
  total_revenue NUMBER;
BEGIN
  SELECT SUM(amount)
  INTO total_revenue
  FROM transactions;

  RETURN total_revenue;
END;


BEGIN
  DBMS_OUTPUT.PUT_LINE(get_total_revenue);
END;

--CREATE PROCEDURE FOR ADD TRANSACTION--
CREATE OR REPLACE PROCEDURE add_transaction (p_amount IN NUMBER) IS
BEGIN
    INSERT INTO transactions (transactions_id, amount)
    VALUES (transactions_seq.NEXTVAL, p_amount);
    
EXCEPTION
    WHEN VALUE_ERROR THEN
     DBMS_OUTPUT.PUT_LINE('Invalid amount');
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
       
END;

BEGIN
    add_transaction(500);
END;

--QUERIES FOR MAX BOOKING_COST--
SELECT * FROM reservations
WHERE booking_cost =(SELECT MAX(booking_cost)
FROM reservations
);
    
    
    
  --QUERIE left JOIN--  
SELECT 
u.user_id,u.user_name,
COUNT (r.reservation_id)AS reservation_count
FROM users u
LEFT JOIN reservations r
ON u.user_id = r.user_id
GROUP BY 
u.user_id,
u.user_name
ORDER BY 
u.user_id;

--CREATE FUNCTION FOR COUNT --
CREATE OR REPLACE FUNCTION get_active_guests
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM reservations
    WHERE SYSDATE BETWEEN check_in_date AND check_out_date;
    RETURN v_count;
EXCEPTION
    WHEN OTHERS THEN RETURN 0;
END;

DECLARE
    v_guests NUMBER;
BEGIN
    v_guests := get_active_guests;
    DBMS_OUTPUT.PUT_LINE('Active Guests : ' || v_guests);
END;