var map = L.map('photo').setView(new L.LatLng(0,0), 0);

L.tileLayer.zoomify('../images/plans/Mique/', {
  width: 12904, 
  height: 8738,
  tolerance: 0.8,
}).addTo(map);