$(document).on("ready", function() {
  mapboxgl.accessToken =  'pk.eyJ1Ijoibmd1c3QiLCJhIjoiY2lraHBnaDM3MDI4aHUwbTZnenJ5dno2YyJ9.8iIZEsDPnm2nQ4jV_Yj92A'; 

  var map = new mapboxgl.Map({
      container: 'map',
      // style: 'mapbox://styles/mapbox/streets-v8',
      style: '/outdoors-v8.json',
      center: [ -138.13186711, 62.67909282 ],
      zoom: 6
  });

function loadData(results){
  points = {
              type: "FeatureCollection",
              features: results };
  var point = new mapboxgl.GeoJSONSource({ data: points });
  // test = JSON.stringify(points);
  // console.log(test);
  // console.log(points);
  // console.log(results);
  // console.log(results[1].geometry.coordinates[1]);
  map.addSource('point', point);
  map.addLayer({
        "id": "label",
        "type": "symbol",
        "source": "point",
        "layout": {
            "icon-image": "{maki}-12",
            "text-field": "{name}",
            "text-font": ["Open Sans Semibold", "Arial Unicode MS Bold"],
            "text-offset": [0, 0.6],
            "text-anchor": "top"
        }
    });
   map.addLayer({
    "id": "markers",
    "source": "point",
    "type": "circle",
    // "layout": {
    //         "text-field": "{name}",
    //         "text-font": ["Open Sans Semibold", "Arial Unicode MS Bold"],
    //         "text-offset": [0, 0.6],
    //         "text-anchor": "top"
    //       },
    "paint": {
        "circle-radius": 10,
        "circle-color": "#007cbf"
    }
});
};

  map.on('load', function () {
     $.getJSON('/holes.json', {
          }, function(results){ 
            loadData(results);
          //   lat = results[1].geometry.coordinates;
            lat = [lng,lat]
            map.flyTo({
                  center: lat,
                  zoom: 17,
                  speed: 0.5
                });
          });

  });  
});