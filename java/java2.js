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
    btn.innerHTML = "➡️Read less";
    moreText.style.display = "inline";
  }
}


const parent = document.querySelector(".parent");
const cards = document.querySelectorAll(".child-card");

let index = 0;
const visibleCards = 3;
const cardWidth = 310;

function nextSlide() {
    if (index < cards.length - visibleCards) {
        index++;
        parent.style.transform = `translateX(-${index * cardWidth}px)`;
    }
}

function prevSlide() {
    if (index > 0) {
        index--;
        parent.style.transform = `translateX(-${index * cardWidth}px)`;
    }
}


