import { insertData } from "./testlink.js";


const loginForm = document.getElementById("loginForm");
const passwordInput = document.getElementById("password");
const toggleBtn = document.querySelector(".toggle-password");
const eyeIcon = document.getElementById("eyeIcon");

const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const passwordPattern =
  /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

// 👁 تبديل رؤية الباسورد
toggleBtn.addEventListener("click", () => {
  const type =
    passwordInput.getAttribute("type") === "password" ? "text" : "password";
  passwordInput.setAttribute("type", type);

  if (type === "text") {
    eyeIcon.innerHTML = `
      <path d="M1 1l22 22" stroke="#000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
      <path d="M17.94 17.94A10.94 10.94 0 0 1 12 19c-6 0-10-7-10-7a18.6 18.6 0 0 1 5.06-6.06" stroke="#000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
    `;
  } else {
    eyeIcon.innerHTML = `
      <path d="M2 12s4-7 10-7 10 7 10 7-4 7-10 7S2 12 2 12z" stroke="#000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
      <circle cx="12" cy="12" r="3" stroke="#000" stroke-width="1.5"/>
    `;
  }
});

// ✅ التحقق من البيانات وتوجيه حسب الدور
loginForm.addEventListener("submit", function (e) {
  e.preventDefault();

  const email = document.getElementById("email").value.trim();
  const password = passwordInput.value.trim();

  if (!emailPattern.test(email)) {
    alert("❌ Please enter a valid email address.");
    return;
  }

  if (!passwordPattern.test(password)) {
    alert(
      "❌ Password must be at least 8 characters and include:\n• 1 uppercase letter\n• 1 number\n• 1 special character"
    );
    return;
  }



  const remember = document.getElementById("rememberMe")?.checked;

  alert("✅ Login successful!\nRole: " + role + "\nRemember me: " + (remember ? "Yes" : "No"));
  
});

insertData("abdohosaam@gmail.com" , 'password123')

