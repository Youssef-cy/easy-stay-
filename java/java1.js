function readMore(btn) {
  var card = btn.parentElement;
  var dots = card.querySelector(".dots");
  var moreText = card.querySelector(".more");

  if (dots.style.display === "none") {
    dots.style.display = "inline";
    btn.innerHTML = "Read more➡️";
    moreText.style.display = "none";
  } else {
    dots.style.display = "none";
    btn.innerHTML = "Read less➡️";
    moreText.style.display = "inline";
  }
}