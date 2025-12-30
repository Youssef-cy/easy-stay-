import express from "express";
import cors from "cors";
import { runQuery } from "./db.js";

const app = express();
app.use(cors({ origin: "http://127.0.0.1:5501" }));
app.use(express.json());

// Endpoint لإضافة اسم
app.post("/add-test", async (req, res) => {
  const { email, password } = req.body;
  console.log("Received:", email, password);

  try {
    const result = await runQuery(
      `INSERT INTO users (user_id, email, password) 
       VALUES (user_sq.NEXTVAL, :email, :password)`,
      [email, password]
    );
    console.log("Query executed successfully:", result.rowsAffected);

    res.json({ success: true });
  } catch (err) {
    console.error("DB error:", err);
    res.status(500).json({ success: false, error: err.message });
  }
});

app.listen(3000, () => {
  console.log("Server running on port 3000");
});
