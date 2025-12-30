document.addEventListener("DOMContentLoaded", () => {
  const button = document.getElementById("send");
  const message = document.getElementById("message");

  button.addEventListener("click", async () => {
    const input = document.getElementById("name").value.trim();

    if (!input) {
      message.textContent = "Please enter a name!";
      return;
    }

    try {
      const res = await fetch("http://localhost:3000/add-test", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name: input })
      });

      const data = await res.json();

      if (data.success) {
        message.textContent = `Inserted "${input}" successfully!`;
        document.getElementById("name").value = ""; 
      } else {
        message.textContent = `Failed: ${data.error || "Unknown error"}`;
      }

    } catch (err) {
      console.error("Fetch error:", err);
      message.textContent = "Error connecting to server.";
    }
  });
});
