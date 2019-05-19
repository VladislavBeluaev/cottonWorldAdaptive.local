/**
 * Created by Dragon on 19.05.2019.
 */
class YandexMap {
    constructor(mapContainer) {
        this._mapContainer = mapContainer;
    }

    load() {
        ymaps.ready(init);
        function init() {
            let map = new ymaps.Map('contacts__map', {
                center: [53.849663840704956, 27.66238955487824],
                zoom: 18,
                controls: ['routeButtonControl', 'zoomControl', 'fullscreenControl']
            });
            let MyIconContentLayout = ymaps.templateLayoutFactory.createClass(
                '<div style="color: #FFFFFF; font-weight: bold;">$[properties.iconContent]</div>'
                ),
                myPlacemark = new ymaps.Placemark(map.getCenter(), {
                    hintContent: 'UZBOLKA.BY',
                    balloonContent: 'Это красивая метка'
                }, {
                    // Опции.
                    // Необходимо указать данный тип макета.
                    iconLayout: 'default#image',
                    // Своё изображение иконки метки.
                    iconImageHref: 'images/markerYandex.PNG',
                    // Размеры метки.
                    iconImageSize: [36, 62],
                    // Смещение левого верхнего угла иконки относительно
                    // её "ножки" (точки привязки).
                    iconImageOffset: [-10, -50]
                });

            map.geoObjects.add(myPlacemark);

            /*let myPlacemark = new ymaps.Placemark([53.849698731852826, 27.662174978157054], {}, {
             preset: 'islands#redIcon'
             });
             /!*let myPlacemark = new ymaps.GeoObject({
             geometry: {
             type: "Point",
             coordinates: [53.849698731852826, 27.662174978157054]
             }
             });*!/
             map.geoObjects.add(myPlacemark);*/
        }
    }
}
export {YandexMap}