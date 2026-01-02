const loginForm = document.getElementById("loginForm");
const emailInput = document.getElementById("email");
const passwordInput = document.getElementById("password");

const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const passwordPattern =
  /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

loginForm.addEventListener("submit", async (e) => {
  e.preventDefault();

  const email = emailInput.value.trim();
  const password = passwordInput.value.trim();

  // Validation
  if (!emailPattern.test(email)) return alert("❌ Invalid email address");
  if (!passwordPattern.test(password))
    return alert(
      "❌ Password must be at least 8 characters and contain:\n- 1 uppercase\n- 1 number\n- 1 special character"
    );

  try {
    const res = await fetch("http://localhost:3000/signin", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email, password }),
    });

    const data = await res.json();

    if (data.success) {
      alert("✅ Login successful, Welcome " + data.user.firstName);
      loginForm.reset();
      
    } else {
      alert("❌ " + (data.error || "Server error"));
    }
  } catch (err) {
    console.error(err);
    alert("❌ Cannot connect to server");
  }
});


function moveToSignUp (){
  window.location.href = "signup.html"
}