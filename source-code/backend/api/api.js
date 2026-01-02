fetch('http://localhost:3000/api')  // Replace with your API endpoint
  .then(response => {
    if (!response.ok) throw new Error('API error');
    return response.json();
  })
  .then(data => {
    console.log(data);  // Handle your API response data
    // Update UI, e.g., document.getElementById('result').innerHTML = JSON.stringify(data);
  })
  .catch(error => console.error('Fetch error:', error));
