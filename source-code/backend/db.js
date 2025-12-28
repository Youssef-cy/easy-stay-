import oracledb from 'oracledb';
let email = "alpha112534@gmail.com";
let password = 'Yy@1512009';

async function createConnection() {
  return await oracledb.getConnection({
    user: "C##web_user",
    password: "password123",
    connectString: "localhost/ORCL"
  });
}

export async function runQuery(query, binds = []) {
  let connection;
  try {
    connection = await createConnection();
    
    const result = await connection.execute(query, binds);
    await connection.commit(); 
    
    console.log(result.rows);
    return result.rows || result;
  } catch (err) {
    console.error(err);
    if (connection) {
      try {
        await connection.rollback();
      } catch (rollbackErr) {
        console.error("Rollback failed:", rollbackErr);
      }
    }
    return null;
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error(err);
      }
    }
  }
}

await runQuery(
  `INSERT INTO users VALUES (:1, :2)`, 
  [email, password]
);

runQuery("select * from users")
