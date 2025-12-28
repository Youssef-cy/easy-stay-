document.querySelectorAll(".contact-box").forEach(box => {
  box.addEventListener("mouseenter", () => {
    box.style.boxShadow = "0 10px 30px rgba(0,0,0,0.2)";
  });

  box.addEventListener("mouseleave", () => {
    box.style.boxShadow = "none";
  });
});