import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = 'pk.eyJ1IjoiZXN0aTI2IiwiYSI6ImNsaG9vMDF2cjFtMGozZHMxdmE0MnJrbzIifQ.SUs4-1vCL28RYJgPwDUFPA';
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12"
    });
    this.#addMarkersToMap();
    this.#fitMapToMarkers();

    // map.addControl(
    //   new MapboxDirections({
    //   accessToken: mapboxgl.accessToken
    //   }),
    //   'top-left'
    //   );

  }

  updateMap(event) {
    let { markers} = event.detail;
    markers = JSON.parse(markers);
    this.#refreshMap(markers);

  }

  #refreshMap(markers) {
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12"
    });
    this.#addMarkersToMap(markers);
    this.#fitMapToMarkers();


}


  #addMarkersToMap(markers) {
      this.markers = []
      if(markers) this.markersValue = markers;
      this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      // Pass the element as an argument to the new marker
      this.markers.push(new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map))
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }
}
