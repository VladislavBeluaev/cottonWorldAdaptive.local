import {ModalWindows} from './components/classes/ModalWindows.class.js';
import {Menu} from './components/classes/Menu.class.js';
import {Slider} from './components/classes/Slider.class.js';
import {Gallery} from './components/classes/Gallery.class.js';
import {YandexMap} from './components/classes/YandexMap.class.js';
(function ($, undefined) {
    $(function () {
        let pathInfo = window.location.pathname.substr(1);
        (new Menu(
            {
                resizeControl: {
                    "menuBarFixed__container": "menubar-fixed ul",
                    "menubarContacts__container": "menubar-contacts__container",
                    "menuBarDefaultContainer": "container",
                },
                mouseOverOutControl:{
                    "menubarCatalog__container": "menubar-catalog__wrapper",
                    "menubarCatalog_item":"menubar-catalog_item a",
                }


            }
        )).run();
        (new Gallery(
            {
                "galleryContainer": "article__container__image",
                "thumbnailContainer": "gallery-image-wrapper",
                "fullSizeContainer": "gallery-image-full_size",
                "thumbnail": "gallery-image",
            }
        )).run();
        switch (pathInfo) {
            case "":
                (new Slider({
                    slider: $('.cardsSlider'),
                    duration: 500,
                    countScroll: 1,
                    navigate: {
                        buttonNext: 'next_btn',
                        buttonPrev: 'prev_btn',
                        productCartLinkClass: 'toProductCart',
                        relativeTo: '.card a>img',
                        positioningElement: '.next_btn,.prev_btn',
                        position: 'middle',
                        offset: {
                            '.card a>img': 'paddingTop'
                        }
                    }
                }).start());
                break;
            case "contacts":
                (new YandexMap('contacts__map')).load();
                break;
            case "men/t-shirts":
                (new ModalWindows(
                    {
                        "bodyWrapper": "modal-wrapper",
                        "containerCallingMW": "cards__item",
                        "modalWindowsOptions":{
                            classes:['modal-clothes-size','modal-product_description','modal-product_order'],
                            closeButton:'content__close-window'
                        }
                    }
                )).run();
                break;
        }
    });
})(jQuery);