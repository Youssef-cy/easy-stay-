const loginForm = document.getElementById("loginForm");
const nameInputs = document.querySelectorAll(".name");
const firstNameInput = nameInputs[0];
const lastNameInput = nameInputs[1];
const phoneInput = document.getElementById("phone");
const emailInput = document.getElementById("email");
const passwordInput = document.getElementById("password");
const countryInput = document.getElementById("country");
const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
const phonePattern = /^\d{10,15}$/;

//validation
loginForm.addEventListener("submit", async (e) => {
  e.preventDefault();

  const firstName = firstNameInput.value.trim();
  const lastName = lastNameInput.value.trim();
  const phone = phoneInput.value.trim();
  const email = emailInput.value.trim();
  const password = passwordInput.value.trim();
  const country = countryInput.value;
  
  if (!firstName || !lastName) return alert("❌ Please enter first and last name");
  if (!phonePattern.test(phone)) return alert("❌ Phone must be 10–15 digits");
  if (!emailPattern.test(email)) return alert("❌ Invalid email address");
  if (!passwordPattern.test(password)) {
    return alert("❌ Password must be 8+ chars, 1 uppercase, 1 number, 1 special char");
  }
  if (!country) return alert("❌ Please select a country");


  //api call
  const payload = { firstName, lastName, phone, email, password, country };

  try {
    const res = await fetch("http://localhost:3000/signup", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload),
    });

    const data = await res.json();
    if (data.success) {
      alert("✅ Signup successful");
      loginForm.reset();
            window.location.href = 'view.html'

    } else {
      alert("❌ Server error: " + (data.error || "Unknown error"));
    }
  } catch (err) {
    console.error(err);
    alert("❌ Cannot connect to server");
  }
});
