import express from "express";
import cors from "cors";
import { runQuery } from "../config/db.js";

const app = express();

app.use(cors({ origin: "http://127.0.0.1:5501" }));
app.use(express.json());

// Signup

app.post("/signup", async (req, res) => {
  const { firstName, lastName, phone, email, password, country } = req.body;

  try {
    const check = await runQuery(
      `SELECT COUNT(*)
       FROM users
       WHERE email = :email OR phone_number = :phone`,
      [email, phone]
    );

    if (check.rows[0][0] > 0) {
      return res.status(409).json({
        success: false,
        error: "Email or phone already exists",
      });
    }

    await runQuery(
      `INSERT INTO users
       (user_id, first_name, last_name, phone_number, location, email, password)
       VALUES
       (user_seq.NEXTVAL, :firstName, :lastName, :phone, :country, :email, :password)`,
      [firstName, lastName, phone, country, email, password]
    );

    res.status(201).json({
      success: true,
      message: "Signup successful",
    });
  } catch (err) {
    console.error("Signup error:", err);
    res.status(500).json({
      success: false,
      error: "Database error",
    });
  }
});

// Signin

app.post("/signin", async (req, res) => {
  const { email, password } = req.body;

  try {
    const result = await runQuery(
      `SELECT user_id, first_name, last_name
       FROM users
       WHERE email = :email AND password = :password`,
      [email, password]
    );

    if (result.rows.length === 0) {
      return res.status(401).json({
        success: false,
        error: "Invalid email or password",
      });
    }

    const user = result.rows[0];

    res.json({
      success: true,
      message: "Login successful",
      user: {
        id: user[0],
        firstName: user[1],
        lastName: user[2],
      },
    });
  } catch (err) {
    console.error("Login error:", err);
    res.status(500).json({
      success: false,
      error: "Database error",
    });
  }
});

// Payment Endpoint

app.post("/payment", async (req, res) => {
  const { amount, paymentMethod, hotelName, nights, rooms, guests } = req.body;

  if (!amount || !paymentMethod || !hotelName || !nights || !rooms || !guests) {
    return res.status(400).json({
      success: false,
      error: "Missing required fields",
    });
  }

  try {
    await runQuery(
      `INSERT INTO transactions
       (transaction_id, amount, transaction_date, payment_method, payment_status)
       VALUES
       (transaction_seq.NEXTVAL, :amount, SYSDATE, :method, 'PAID')`,
      [amount, paymentMethod]
    );

    const transactionIdResult = await runQuery(`SELECT transaction_seq.CURRVAL FROM dual`);
    const transactionId = transactionIdResult.rows[0][0];

    await runQuery(
      `INSERT INTO bill
       (bill_id, transaction_id, bill_date, hotel_name, nights, rooms, guests)
       VALUES
       (bill_seq.NEXTVAL, :transactionId, SYSDATE, :hotelName, :nights, :rooms, :guests)`,
      [transactionId, hotelName, nights, rooms, guests]
    );

    res.status(201).json({
      success: true,
      message: "Payment processed successfully",
      data: {
        transactionId,
        amountPaid: amount,
      },
    });

  } catch (err) {
    console.error("Payment error:", err);
    res.status(500).json({
      success: false,
      error: "Payment failed",
    });
  }
});


// Server start

app.listen(3000, () => {
  console.log("✅ Server running on http://localhost:3000");
});
