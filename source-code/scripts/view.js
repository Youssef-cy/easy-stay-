// ===== HERO SLIDER =====
const hero = document.querySelector(".hero");

const images = [
  "/images/main1.jpeg",
  "/images/main2.jpeg",
  "/images/main3.jpeg"
];

let i = 0;
hero.style.backgroundImage = `url(${images[i]})`;
hero.style.backgroundSize = "cover";
hero.style.backgroundPosition = "center";

setInterval(() => {
  i = (i + 1) % images.length;
  hero.style.backgroundImage = `url(${images[i]})`;
}, 5000);

// ===== API =====
let currentResults = [];

async function getData() {
  const res = await fetch("http://localhost:2000/hotels");
  const data = await res.json();
  return data.data;
}

async function searchByName(name) {
  if (!name) return await getData();

  const res = await fetch(
    `http://localhost:2000/hotels/search?name=${encodeURIComponent(name)}`
  );
  const data = await res.json();
  return data.data;
}

async function performSearch() {
  const searchTerm = document.getElementById("searchInput").value.trim();

  try {
    const results = await searchByName(searchTerm);
    currentResults = results;
    displayHotels(results);
  } catch (err) {
    console.error("Server error", err);
  }
}


// ===== DISPLAY =====
function displayHotels(hotels) {
  const container = document.getElementById("results");
  container.innerHTML = "";

  hotels.forEach(hotel => {
    const card = document.createElement("div");
    card.className = "card";

    card.innerHTML = `
      <img src="${hotel.mainImage || `https://picsum.photos/320/200?random=${hotel.id}`}">
      <div class="card-body">
        <h3>${hotel.name}</h3>
        <p>${hotel.city || ""} ${hotel.country || ""}</p>
        <p>⭐ ${hotel.rating || "N/A"}</p>
        <p>${hotel.pricePerNight || "N/A"} ${hotel.currency || "$"} / night</p>
       <div class="card-buttons">
  <button class="btn-primary">Check Deals</button>
  <button class="btn-secondary">View Details</button>
</div>

      </div>
    `;

    container.appendChild(card);
  });
}

// ===== EVENTS =====
function debounce(fn, delay) {
  let t;
  return (...args) => {
    clearTimeout(t);
    t = setTimeout(() => fn(...args), delay);
  };
}

document.addEventListener("DOMContentLoaded", () => {
  const input = document.getElementById("searchInput");

  input.addEventListener("input", debounce(performSearch, 300));
  input.addEventListener("keypress", e => {
    if (e.key === "Enter") performSearch();
  });

  performSearch(); // load all hotels
});
