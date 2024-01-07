# To get your station(s) id use this script
# Remember to use your actual YOUR_API_KEY and YOUR_API_SECRET
# and also to comment the 2 next lines

echo "Forgot to read the file header, right ? :-)"
exit

curl https://api.weatherlink.com/v2/stations?api-key={YOUR_API_KEY} -H 'X-Api-Secret: YOUR_API_SECRET' -H 'Content-Type: application/json'
