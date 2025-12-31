function selectCard(element) {
    const cards = document.querySelectorAll('.card');
    cards.forEach(card => card.classList.remove('active'));
    element.classList.add('active');
}

function confirmPayment() {
    alert("Payment confirmed successfully!");
}
