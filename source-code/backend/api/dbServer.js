import express from "express";
import cors from "cors";
import { runQuery } from "../config/db.js";

const app = express();


app.use(cors({ origin: "http://127.0.0.1:5501" }));
app.use(express.json());





//signup
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

  // Authenticate
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




//print server start succsse
app.listen(3000, () => {
  console.log("✅ Server running on http://localhost:3000");
});
