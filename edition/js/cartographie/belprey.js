var map = L.map('photo').setView(new L.LatLng(0,0), 0);

L.tileLayer.zoomify('../images/plans/belprey/', { 
  width: 14688, 
  height: 10080,
  tolerance: 0.8,
}).addTo(map);