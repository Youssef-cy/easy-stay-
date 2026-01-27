// Hero slider unchanged
const hero = document.querySelector(".hero");
const images = ["/images/main1.jpeg", "/images/main2.jpeg", "/images/main3.jpeg"];
let i = 0;
hero.style.backgroundImage = `url(${images[i]})`;
hero.style.backgroundSize = "cover";
hero.style.backgroundPosition = "center";
setInterval(() => {
  i = (i + 1) % images.length;
  hero.style.backgroundImage = `url(${images[i]})`;
}, 5000);

let currentResults = [];

async function getData() {
  const res = await fetch("http://localhost:2000/hotels");
  const data = await res.json();
  return data.data;
}

async function searchByName(name) {
  if (!name) return await getData();
  const res = await fetch(`http://localhost:2000/hotels/search?name=${encodeURIComponent(name)}`);
  const data = await res.json();
  return data.data;
}

async function performSearch() {
  const searchTerm = document.getElementById("searchInput").value.trim();
  const container = document.getElementById("results");
  container.innerHTML = '<div class="loading">🔍 Searching hotels...</div>';

  try {
    const results = await searchByName(searchTerm);
    currentResults = results;
    displayHotels(results);
  } catch (err) {
    console.error("Server error", err);
    container.innerHTML = '<div class="no-results">❌ Server error. Ensure backend runs on port 2000.</div>';
  }
}

function displayHotels(hotels) {
  const container = document.getElementById('results');
  container.innerHTML = '';
  if (hotels.length === 0) {
    container.innerHTML = '<div class="no-results">No matching hotels found. Try Cairo or Nile.</div>';
    return;
  }
  hotels.forEach(hotel => {
    const card = document.createElement('div');
    card.className = 'card';
    card.dataset.id = hotel.id;  // Add hotel ID for navigation
    card.innerHTML = `
      <img src="${hotel.mainImage || `https://picsum.photos/320/200?random=${hotel.id}`}" 
           onerror="this.src='https://picsum.photos/320/200?random=${hotel.id}'" 
           alt="${hotel.name}">
      <div class="card-body">
        <h3>${hotel.name}</h3>
        <p>${hotel.city}, ${hotel.country}</p>
        <p>${hotel.rating || 'NA'}</p>
        <p>${hotel.pricePerNight || 'NA'} ${hotel.currency || ''}/night</p>
        <div class="card-buttons">
          <button class="btn-primary">Check Deals</button>
          <button class="btn-secondary">View Details</button>
        </div>
      </div>
    `;
    // Click anywhere on card to go to details
    card.addEventListener('click', () => {
      window.location.href = `details.html?id=${hotel.id}`;
    });
    container.appendChild(card);
  });
}


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
  performSearch(); // Initial load
});
