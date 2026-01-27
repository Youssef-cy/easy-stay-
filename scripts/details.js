// Updated details.js with preserved existing code structure
document.addEventListener('DOMContentLoaded', async () => {
  const urlParams = new URLSearchParams(window.location.search);
  const hotelId = urlParams.get('id');
  if (!hotelId) {
    document.querySelector('.container').innerHTML = `
      <div style="padding: 40px; text-align: center;">
        <h2>Hotel ID required.</h2>
        <a href="view.html">Back to search</a>
      </h2></div>
    `;
    return;
  }

  try {
    const response = await fetch(`http://localhost:2000/hotels/${hotelId}`);
    const result = await response.json();
    if (!result.success) throw new Error(result.error);
    const hotel = result.data;
    populateDetails(hotel);
  } catch (error) {
    console.error('Error fetching hotel:', error);
    document.querySelector('.container').innerHTML = `
      <div style="padding: 40px; text-align: center;">
        <h2>Error loading hotel details.</h2>
        <a href="view.html">Back to search</a>
      </h2></div>
    `;
  }

  // Date picker logic - fixed IDs
  const checkIn = document.getElementById('checkIn');
  const checkOut = document.getElementById('checkOut');
  if (checkIn && checkOut) {
    checkIn.addEventListener('change', () => {
      checkOut.min = checkIn.value;
      if (checkOut.value < checkIn.value) checkOut.value = checkIn.value;
    });
    checkOut.addEventListener('change', () => {
      if (checkIn.value && checkOut.value < checkIn.value) checkIn.value = checkOut.value;
    });
  }
});

function populateDetails(hotel) {
  // Header
  document.querySelector('.hotel-name').textContent = hotel.name;
  const info = document.querySelector('.info');
  info.innerHTML = `
    <span class="stars">${'★'.repeat(hotel.stars || 5)}</span>
    <span class="reviews">${hotel.rating ? `${hotel.rating} (${hotel.reviewCount || 0} reviews)` : 'No reviews'}</span>
  `;

  // Gallery images
  const bigImg = document.querySelector('.big-img img');
  bigImg.src = hotel.mainImage || `https://picsum.photos/800/500?random=${hotel.id}`;
  bigImg.alt = `${hotel.name} - Main image`;
  const smallImgs = document.querySelectorAll('.small-img img');
  const galleryImgs = hotel.images || [];
  smallImgs.forEach((img, i) => {
    const imgIndex = i + 1;
    img.src = galleryImgs[imgIndex - 1] || `https://picsum.photos/200/150?random=${hotel.id}-${imgIndex}`;
    img.alt = `${hotel.name} gallery ${imgIndex}`;
    const badge = img.parentElement.querySelector('.badge');
    if (badge) badge.textContent = imgIndex;
  });

  // Hotel info section
  const pricesSection = document.querySelector('.prices');
  pricesSection.insertAdjacentHTML('beforeend', `
    <div class="hotel-info">
      <h3>About ${hotel.name}</h3>
      <p><strong>Location:</strong> ${hotel.city}, ${hotel.country}${hotel.distanceFromCenterKm ? ` - ${hotel.distanceFromCenterKm}km from center` : ''}</p>
      <p><strong>Description:</strong> ${hotel.description || 'Luxury accommodation with excellent amenities.'}</p>
      <p><strong>Amenities:</strong> ${hotel.amenities ? hotel.amenities.join(', ') : 'WiFi, Pool, Restaurant'}</p>
      <p><strong>Rooms available:</strong> ${hotel.rooms ? hotel.rooms.length : 0}</p>
      <p><strong>Check-in:</strong> ${hotel.checkInFrom || '14:00'} <strong>Check-out:</strong> ${hotel.checkOutUntil || '12:00'}</p>
    </div>
  `);

  // Deals from rooms
  const dealsContainer = document.getElementById('deals');
  const rooms = hotel.rooms || [];
  if (rooms.length === 0) {
    dealsContainer.innerHTML = '<p>No deals available for selected dates.</p>';
    return;
  }

  // Generate 3 sample deals based on rooms
  const dealsHtml = rooms.slice(0, 3).map((room, index) => {
    const features = room.features || ['Free WiFi', 'Free cancellation'];
    return `
      <div class="deal">
        <div class="site">Booking.com</div>
        <ul>${features.slice(0, 2).map(f => `<li>${f}</li>`).join('')}</ul>
        <div class="price">${room.pricePerNight || 300}${hotel.currency || 'USD'}</div>
        <button class="deal-btn" onclick="bookRoom(${room.id || index}, ${JSON.stringify(hotel).replace(/"/g, '&quot;')})">View Deal</button>
      </div>
    `;
  }).join('');
  dealsContainer.innerHTML = dealsHtml;
}

// Updated bookRoom function to pass full hotel details to payment page
function bookRoom(roomId, hotel) {
  const checkIn = document.getElementById('checkIn')?.value;
  const checkOut = document.getElementById('checkOut')?.value;
  if (!checkIn || !checkOut) {
    alert('Please select check-in and check-out dates');
    return;
  }

  // Pass full hotel details via sessionStorage for persistence across tabs/sessions
  sessionStorage.setItem('selectedHotel', JSON.stringify(hotel));
  sessionStorage.setItem('selectedRoomId', roomId);
  sessionStorage.setItem('checkInDate', checkIn);
  sessionStorage.setItem('checkOutDate', checkOut);

  // Redirect to payment page
  window.location.href = `/screens/payment.html?room=${roomId}&checkin=${checkIn}&checkout=${checkOut}`;
}
