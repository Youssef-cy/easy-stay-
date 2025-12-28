import { runQuery } from "../backend/db.js";

export async function insertData(email, password) {
    const result = await await runQuery(
        `INSERT INTO users VALUES (:1, :2)`,
        [email, password]
    );


    console.log("Users:", result);
    console.log(runQuery("select * from users"))
}

insertData()  