/**
 * Created by Dragon on 19.05.2019.
 */
class GoogleMap {
    constructor(mapContainer) {
    this._mapContainer =mapContainer;
    }
    load(){
        function initMap() {}
        $(() => {
            initMap = function() {
                var uluru = {lat: -25.344, lng: 131.036};
                var map = new google.maps.Map(
                    document.getElementById(this._mapContainer), {zoom: 4, center: uluru});
                var marker = new google.maps.Marker({position: uluru, map: map});
            }
        });

    }
}
export{GoogleMap}