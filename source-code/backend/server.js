import express from "express";
import cors from "cors";
import { runQuery } from "./db.js"; // دالة تنفيذ الاستعلامات على Oracle

const app = express();
app.use(cors({ origin: "http://127.0.0.1:5501" }));
app.use(express.json());


app.post("/add-test", async (req, res) => {
  const { firstName, lastName, phone, email, password, country } = req.body;

  try {
  const check = await runQuery(
  `SELECT COUNT(*) FROM users WHERE email = :email OR phone_number = :phone`,
  [email, phone]
);

if (check.rows[0][0] > 0) {
  return res
    .status(409)
    .json({ success: false, error: "Email or phone already exists" });
}

await runQuery(
  `INSERT INTO users 
   (user_id, first_name, last_name, phone_number, location, email, password)
   VALUES (user_seq.NEXTVAL, :firstName, :lastName, :phone, :country, :email, :password)`,
  [firstName, lastName, phone, country, email, password]
);


    res.json({ success: true });
  } catch (err) {
    console.error("DB error:", err);
    res.status(500).json({ success: false, error: "Database error" });
  }
});

app.listen(3000, () => console.log("✅ Server running on http://localhost:3000"));
