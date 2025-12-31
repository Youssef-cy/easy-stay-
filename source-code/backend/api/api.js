async function get_data (){
const url = 'https://tripadvisor16.p.rapidapi.com/api/v1/restaurant/searchRestaurants?locationId=304554';
const options = {
	method: 'GET',
	headers: {
		'x-rapidapi-key': 'bf6742816fmsh0b900e68bf287e4p1d3e4fjsn98a21b742fae',
		'x-rapidapi-host': 'tripadvisor16.p.rapidapi.com'
	}
};

try {
	const response = await fetch(url, options);
	const result = await response.json();
	console.log(result);
} catch (error) {
	console.error(error);
}}