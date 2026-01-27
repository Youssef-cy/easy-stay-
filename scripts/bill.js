document.addEventListener('DOMContentLoaded', () => {
    const receipt = JSON.parse(sessionStorage.getItem('receiptData') || '{}');
    if (!receipt) return;

    const details = document.getElementById('bookingDetails');
    details.innerHTML = `
        <div class="detail-row">
            <span class="detail-label">Hotel</span>
            <span class="detail-value">${receipt.hotelName}</span>
        </div>
        <div class="detail-row">
            <span class="detail-label">Reservation ID</span>
            <span class="detail-value">${receipt.reservationId}</span>
        </div>
        <div class="detail-row">
            <span class="detail-label">Nights</span>
            <span class="detail-value">${receipt.nights}</span>
        </div>
        <div class="detail-row">
            <span class="detail-label">Rooms</span>
            <span class="detail-value">${receipt.rooms}</span>
        </div>
        <div class="detail-row">
            <span class="detail-label">Guests</span>
            <span class="detail-value">${receipt.guests}</span>
        </div>
        <div class="detail-row">
            <span class="detail-label">Paid Amount</span>
            <span class="detail-value">$${receipt.amount}</span>
        </div>
        <div class="detail-row">
            <span class="detail-label">Payment Method</span>
            <span class="detail-value">${receipt.paymentMethod}</span>
        </div>
        <div class="detail-row">
            <span class="detail-label">Status</span>
            <span class="detail-value confirmed">Confirmed ✓</span>
        </div>
    `;

    const confettiContainer = document.getElementById('confetti');
    const colors = ['#f87171', '#f59e0b', '#10b981', '#3b82f6', '#8b5cf6', '#ec4899'];
    for (let i = 0; i < 150; i++) {
        const confetto = document.createElement('div');
        confetto.style.cssText = `
            width: ${8 + Math.random() * 8}px;
            height: ${8 + Math.random() * 8}px;
            background: ${colors[Math.floor(Math.random() * colors.length)]};
            left: ${Math.random() * 100}vw;
            top: -10px;
            animation: fall ${2 + Math.random() * 3}s linear forwards;
            animation-delay: ${Math.random() * 0.5}s;
        `;
        confettiContainer.appendChild(confetto);
    }

    const style = document.createElement('style');
    style.textContent = `
        @keyframes fall {
            0% { transform: translateY(0) rotate(0deg); opacity: 1; }
            100% { transform: translateY(100vh) rotate(720deg); opacity: 0; }
        }
    `;
    document.head.appendChild(style);

    // Buttons
    document.getElementById('printReceipt').addEventListener('click', () => window.print());
    document.getElementById('returnHome').addEventListener('click', () => {
        sessionStorage.clear();
        window.location.href = 'index.html';
    });
});