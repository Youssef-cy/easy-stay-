// api.js - Updated to load all data first, then filter

let allHotels = []; 

async function getData(location = "", minPrice = "", maxPrice = "", rating = "", amenities = "") {
  try {
    const params = new URLSearchParams({
      location,
      minPrice,
      maxPrice,
      rating,
      amenities
    });

    const response = await fetch(`http://localhost:2000/hotels?${params.toString()}`);

    if (!response.ok) throw new Error("API error");

    const resJson = await response.json();
    allHotels = resJson.data;  // Store all data [web:16]
    return allHotels;
  } catch (error) {
    console.error("error:", error);
    throw error;
  }
}

async function searchByName(searchTerm) {
  if (allHotels.length === 0) {
    await getData();  
  }
  
  const term = searchTerm.toLowerCase();
  const results = allHotels.filter(hotel => 
    hotel.name.toLowerCase().includes(term)
  );
  
  return results.length > 0 ? results : allHotels;  
}


getData().then(() => {
  console.log('All hotels loaded:', allHotels.length);
});

// Export
window.api = { getData, searchByName, allHotels };
