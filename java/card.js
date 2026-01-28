// navbar scroll effect
window.addEventListener("scroll", function () {
  const nav = document.getElementById("navbar");
  if (window.scrollY > 50) {
    nav.classList.add("scrolled");
  } else {
    nav.classList.remove("scrolled");
  }
});

// email validation
function validateEmail() {
  const email = document.getElementById("email").value;
  const msg = document.getElementById("msg");
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  if (email === "") {
    msg.textContent = "Please enter your email";
    msg.style.color = "red";
  } else if (!regex.test(email)) {
    msg.textContent = "Invalid email format";
    msg.style.color = "red";
  } else {
    msg.textContent = "Subscribed successfully 🎉";
    msg.style.color = "green";
  }
}

// gallery scroll buttons
document.addEventListener("DOMContentLoaded", function () {

  const gallery = document.getElementById("gallery");
  const leftBtn = document.getElementById("leftBtn");
  const rightBtn = document.getElementById("rightBtn");

  const scrollAmount = 450; // على قد كارت تقريبًا

  rightBtn.addEventListener("click", () => {
    gallery.scrollLeft += scrollAmount;
  });

  leftBtn.addEventListener("click", () => {
    gallery.scrollLeft -= scrollAmount;
  });

});
