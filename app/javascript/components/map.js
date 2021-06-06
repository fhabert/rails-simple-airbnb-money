import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
// yarn add worker-loader
import MapboxWorker from 'worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker'

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, marker) => {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([ marker.lng, marker.lat ]);
    map.fitBounds(bounds, { padding: 70, maxZoom: 9, duration: 4000 });
  };
  if (mapElement) { 
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    mapboxgl.workerClass = MapboxWorker;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/navigation-night-v1'
    });
    const marker = JSON.parse(mapElement.dataset.marker);
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '50px';
    element.style.height = '70px';
      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
      fitMapToMarkers(map, marker);
    }
};

export { initMapbox };