// Using leaflet.js to pan and zoom a big image.
// See also: http://kempe.net/blog/2014/06/14/leaflet-pan-zoom-image.html

// create the slippy map
var map = L.map('mapid', {
  minZoom: -0.6,
  maxZoom: 2,
  center: [3000, 1900],
  zoom: 1,
  crs: L.CRS.Simple
});

// dimensions of the image
var w = 6000,
    h = 3909,
    url = '../images/plans/belpreyBD.jpg';

// calculate the edges of the image, in coordinate space
var southWest = map.unproject([0, h], map.getMaxZoom()-0.3);
var northEast = map.unproject([w, 0], map.getMaxZoom()-0.3);
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