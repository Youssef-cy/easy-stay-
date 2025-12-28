
async function searchHotelsWithParametar(location) { 
  try {
    const url = `https://tripadvisor16.p.rapidapi.com/api/v1/hotels/searchLocation?query=${location}`;
    const options = {
      method: 'GET',
      headers: {
      'x-rapidapi-key': 'bf6742816fmsh0b900e68bf287e4p1d3e4fjsn98a21b742fae',
		'x-rapidapi-host': 'tripadvisor16.p.rapidapi.com'
      }
    };

    const response = await fetch(url, options);
    
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    
    const result = await response.json(); 
    console.log(result);
    return result;
  } catch (error) {
    console.error('API fetch failed:', error);
  }



}

// searchHotelsWithParametar('Arkansas');



async function getHotelDetails(hotelId) {
  try {
    const url = `https://tripadvisor16.p.rapidapi.com/api/v1/hotels/getHotelDetails?id=${hotelId}&checkIn=2025-12-27&checkOut=2026-12-02&adults=2&rooms=1&currency=USD`;
    const options = {
      method: 'GET',
      headers: {
        'x-rapidapi-key':  'bf6742816fmsh0b900e68bf287e4p1d3e4fjsn98a21b742fae',
        'x-rapidapi-host': 'tripadvisor16.p.rapidapi.com',
        'User-Agent': 'Mozilla/5.0 (Node.js/20)'
      }
    };

    const response = await fetch(url, options);
    if (!response.ok) {
      throw new Error(`HTTP ${response.status}: ${await response.text()}`);
    }
    
    const result = await response.json();
    console.log(result.data.photos[0]);
    
    return result;
  } catch (error) {
    console.error('getHotelDetails failed:', error);
  }
}

// Usage
getHotelDetails('60713');




