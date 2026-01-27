import oracledb from "oracledb";

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

    const result = await connection.execute(query, binds, { autoCommit: true });
    console.log("Rows affected:", result.rowsAffected);
    return result;

  } catch (err) {
    console.error("runQuery error:", err);
    throw err;
  } finally {
    if (connection) await connection.close();
  }
}
