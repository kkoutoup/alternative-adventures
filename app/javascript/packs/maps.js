import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const initMapbox = () => {

  if (mapElement) {
    mapboxgl.accessToken = process.env.MAPBOX_API_KEY;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/kkoutoup/ckdn6k7b91y2y1in4hjh1ghro'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(map);
    })
    if (markers.length === 0) {
      map.setZoom(1);
    } else if (markers.length === 1) {
      map.setZoom(14);
      map.setCenter([markers[0].lng, markers[0].lat]);
    } else {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach((marker) => {
        bounds.extend([marker.lng, marker.lat]);
      });
      map.fitBounds(bounds, { duration:200, padding: 50 })
    }
  }
}

export { initMapbox };