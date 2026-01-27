let nights = 1, rooms = 1, guests = 1;
const CARD_PATTERNS = {
  visa: /^4[0-9]{12}(?:[0-9]{3})?$/,
  mastercard: /^5[1-5][0-9]{14}$|^2[2-7][0-9]{14}$/,
  amex: /^3[47][0-9]{13}$/
};

document.addEventListener('DOMContentLoaded', () => {
  const hotel = JSON.parse(sessionStorage.getItem('selectedHotel') || '{}');
  const checkIn = sessionStorage.getItem('checkInDate');
  const checkOut = sessionStorage.getItem('checkOutDate');

  if (hotel.name) {
    document.querySelector('.hotel-card h2').textContent = hotel.name;
    const img = document.querySelector('.hotel-image');
    img.src = hotel.mainImage || `https://picsum.photos/400/300?random=${hotel.id || 1}`;
    img.alt = hotel.name;
    document.querySelector('.reviews').textContent = `★ ${hotel.stars || 4.8} • ${hotel.reviewCount || 248} reviews`;
    document.querySelector('.included ul').innerHTML = (hotel.amenities || ['Breakfast', 'WiFi', 'Parking']).slice(0,6).map(a => `<li>${a}</li>`).join('');
    window.hotelBasePrice = hotel.rooms?.[0]?.pricePerNight || 250;
  }

  if (checkIn && checkOut) {
    nights = Math.ceil((new Date(checkOut) - new Date(checkIn)) / (1000 * 60 * 60 * 24));
    document.getElementById('nights').textContent = nights;
    document.getElementById('nightstext').textContent = nights;
  }
  
  updatePrices();
  
  document.querySelectorAll('input').forEach(input => {
    input.addEventListener('input', formatCardInput);
    input.addEventListener('blur', () => document.querySelectorAll('.error').forEach(el => el.remove()));
  });
});

function formatCardInput(e) {
  if (e.target.placeholder.includes('1234')) {
    let value = e.target.value.replace(/\s/g, '').replace(/(.{4})/g, '$1 ').trim();
    e.target.value = value;
  } else if (e.target.placeholder === 'MM/YY') {
    let value = e.target.value.replace(/\D/g, '').replace(/(\d{2})(\d{0,2})/, '$1/$2');
    e.target.value = value;
  }
}

function validatePayment() {
  const cardNumber = document.querySelector('input[placeholder="1234 5678 9012 3456"]').value.replace(/\s/g, '');
  const cardholder = document.querySelector('input[placeholder="Name as it appears on card"]').value.trim();
  const expiry = document.querySelector('input[placeholder="MM/YY"]').value.trim();
  const cvv = document.querySelector('input[placeholder="123"]').value.trim();
  const activeCardType = document.querySelector('.card-type.active').textContent.toLowerCase();
  
  document.querySelectorAll('.error').forEach(el => el.remove());
  
  let valid = true;
  
  if (!cardNumber || !CARD_PATTERNS[activeCardType]?.test(cardNumber)) {
    showError('Invalid card number.', '1234');
    valid = false;
  }
  if (!cardholder || !/^[a-zA-Z\s]+$/.test(cardholder)) {
    showError('Letters only.', 'Name as it appears on card');
    valid = false;
  }
  if (!expiry.match(/^(\d{2})\/(\d{2})$/)) {
    showError('MM/YY format.', 'MM/YY');
    valid = false;
  } else {
    const [, m, y] = expiry.match(/^(\d{2})\/(\d{2})$/);
    if (new Date(2000 + +y, +m - 1, 1) < new Date()) {
      showError('Expired.', 'MM/YY');
      valid = false;
    }
  }
  if (!cvv.match(/^\d{3,4}$/)) {
    showError('3-4 digits.', '123');
    valid = false;
  }
  
  return valid;
}

function showError(msg, placeholder) {
  const input = document.querySelector(`input[placeholder*="${placeholder}"]`);
  const error = document.createElement('div');
  error.className = 'error';
  error.style.cssText = 'color:#e74c3c;font-size:12px;margin-top:4px;';
  error.textContent = msg;
  input.parentNode.insertBefore(error, input.nextSibling);
}

function selectCard(card) {
  document.querySelectorAll('.card-type').forEach(c => c.classList.remove('active'));
  card.classList.add('active');
}

function changeValue(type, delta) {
  if (type === 'nights') nights = Math.max(1, nights + delta);
  if (type === 'rooms') rooms = Math.max(1, rooms + delta);
  if (type === 'guests') guests = Math.max(1, guests + delta);
  
  document.getElementById('nights').textContent = nights;
  document.getElementById('rooms').textContent = rooms;
  document.getElementById('guests').textContent = guests;
  document.getElementById('nightstext').textContent = nights;
  document.getElementById('roomstext').textContent = rooms;
  updatePrices();
}

function updatePrices() {
  const basePrice = (window.hotelBasePrice || 250) * nights * rooms;
  document.getElementById('base-price').textContent = basePrice + '$';
  document.getElementById('total').textContent = (basePrice + 35) + '$';
  document.querySelector('.confirm-btn').textContent = `Confirm Payment • $${(basePrice + 35).toLocaleString()}.00`;
}

async function confirmPayment() {
  if (!validatePayment()) return;

  const amount = (window.hotelBasePrice || 250) * nights * rooms;
  const paymentMethod = document.querySelector('.card-type.active').textContent;
  const hotel = JSON.parse(sessionStorage.getItem('selectedHotel') || '{}');

  try {
 
    window.location.href = "/screens/bill.html";

  } catch (err) {
    console.error(err);
    alert("❌ Payment error");
  }
}
