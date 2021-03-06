import loadPlugins from './components/plugins/customPlugins.js';
import {HamburgerMenu} from './components/classes/HamburgerMenu.class.js';
//import {Slider} from './components/classes/Slider.class.js';
import {Gallery} from './components/classes/Gallery.class.js';
import {YandexMap} from './components/classes/YandexMap.class.js';
import {ModalWindows} from './components/classes/ModalWindows.class.js';
import {Order} from './components/classes/Order.class.js';
import {ScrollHint} from './components/classes/ScrollHint.class.js';
(function ($, undefined) {
    $(function () {
        loadPlugins();
        let pathInfo = window.location.pathname.substr(1);
        (new HamburgerMenu({
            mobile:{
                container:"mobile-menu",
                content:{
                    container:"ul[role=menubar]",
                    animateHeight:"220px",
                    'open-menu':'fa-bars',
                    'close-menu':'fa-times'
                },
                btn:"mobile-menu__toggle"
            }
        }).run());


        /*(new Menu(
            {
                resizeControl: {
                    "menuBarFixed__container": "menubar-fixed ul",
                    "menubarContacts__container": "menubar-contacts__container",
                    "menuBarDefaultContainer": "container",
                },
                mouseOverOutControl: {
                    "menubarCatalog__container": "menubar-catalog__wrapper",
                    "menubarCatalog_item": "menubar-catalog_item a",
                }


            }
        )).run();*/
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
                $('.main_slider').slick({
                    //dots:true,
                    arrows: true,
                    infinite: false,
                    slidesToShow: 4,
                    slidesToScroll: 1,
                    responsive:[
                        {
                            breakpoint: 992,
                            settings: {
                                arrows: true,
                                slidesToShow: 3,
                                slidesToScroll: 1,
                                infinite: false,
                            }
                        },
                        {
                            breakpoint: 768,
                            settings: {
                                arrows: true,
                                slidesToShow: 2,
                                slidesToScroll: 1,
                                infinite: false,
                            }
                        },
                        {
                            breakpoint: 600,
                            settings: {
                                arrows: true,
                                slidesToShow: 1,
                                slidesToScroll: 1,
                                infinite: false,
                            }
                        }
                    ]
                });
                /*(new Slider({
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
                }).start());*/
                break;
            case "contacts":
                (new YandexMap('contacts__map')).load();
                break;
        }
        if (pathInfo === 'men/t-shirts' || pathInfo === 'women/t-shirts' || pathInfo === 'children/t-shirts') {
            (new ModalWindows(
                {
                    "bodyWrapper": "modal-wrapper",
                    "callingMW": {
                        container: "cards__item",
                        itemNameSelector: '.cards__item-name>p'
                    },
                    modalWindowsOptions: {
                        classes: ['modal-clothes_size', 'modal-product_description', 'modal-product_order', 'modal-confirm'],
                        closeButton: 'content__close-window',
                        modalClothesSizeWindow: {
                            sizeTable: {
                                context: "content__table",
                                sizeHint: {
                                    selector: "th:first-child,td:first-child",
                                    style: {
                                        bgColor: {
                                            'background-color': "#999"
                                        },
                                        over: {
                                            color: "#fff",
                                            cursor: "pointer"
                                        },
                                        out: {
                                            color: "#000",
                                        },
                                        selectedItem: 'selected-size'
                                    }
                                }
                            },
                            orderCheckout: {
                                container: 'order__checkout',
                                /*checkoutInfo:'checkout__info',*/
                            },
                            orderConfirm: {
                                container: 'order__confirm',
                            }
                        },
                        modalProductDescription: {
                            container: "product_description__content"
                        },
                        modalProductOrder: {
                            container: "modal-product_order",
                            productColorElement: $('.order-ajax-send').find('li:nth-child(2)>span:last-child'),
                            ajaxSendData: {
                                container: "order-ajax-send",
                                orderSize: 'description__order-size',
                                orderPrice: 'description__order-price',
                                selectedItem: 'selected-size',
                                button: 'send-request'
                            }
                        }
                    }

                }
            )).initWindows().run();
            (new Order({
                validate: {
                    container: 'modal-product_order',
                    elements: {
                        inputs: 'input',
                        li: '.description__order-size'
                    }
                },
                t_shirt: {
                    name: $('li:first-child>span:last-child', '.order-ajax-send').text(),
                    color: $('li:nth-child(2)>span:last-child', '.order-ajax-send').text(),
                    price: $("[data-start-price]")
                },
                order: {
                    send: $('button.send-request'),
                    errorHint: {
                        container: 'valid-hint',
                        className: 'error-input-field'
                    }
                }

            })).validate().send();
            /*(new ScrollHint({
                hintElem:'#scroll-down-hint',
                hintDisplayProps:{
                    'maxWinSize':'411',
                }
            })).run();*/
        }
    });
})(jQuery);