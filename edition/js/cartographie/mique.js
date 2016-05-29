
// create the slippy map
var map = L.map('mapid', {
  minZoom: -0.5,
  maxZoom: 3,
  center: [6500, 5000],
  zoom: -0.5,
  crs: L.CRS.Simple
});

// dimensions of the image
var w = 5000,
    h = 3815,
    url = '../images/plans/B543956101_H_FG_ES_00014det.jpg';

// calculate the edges of the image, in coordinate space
var southWest = map.unproject([0, h], map.getMaxZoom()-1);
var northEast = map.unproject([w, 0], map.getMaxZoom()-1);
var bounds = new L.LatLngBounds(southWest, northEast);

// add the image overlay, 
// so that it covers the entire map
L.imageOverlay(url, bounds).addTo(map);

// tell leaflet that the map is exactly as big as the image
map.setMaxBounds(bounds);

      function onMapClick(e) {
         popup
            .setLatLng(e.latlng)
            .setContent("You clicked the map at " + e.latlng.toString())
            .openOn(mymap);
      }


      mymap.on('click', onMapClick);