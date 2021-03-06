/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/**
 * Created by isida on 16.07.2019.
 */
var ScrollHint = function () {
    function ScrollHint() {
        _classCallCheck(this, ScrollHint);
    }

    _createClass(ScrollHint, null, [{
        key: 'show',
        value: function show(hintSettings) {
            var hint$ = $(hintSettings.hintElem);
            var cssProps = hintSettings.cssProps;
            if (hint$.hasClass(cssProps.hideHintClass) === true) hint$.removeClass(cssProps.hideHintClass);
            hint$.animate({
                top: '' + cssProps.hintOffset
            }, 1000, function () {
                console.log(hintSettings);
                $(this).fadeOut(cssProps.fadeinTime, function () {
                    $(this).removeAttr('style').addClass(cssProps.hideHintClass);
                });
            });
        }
    }]);

    return ScrollHint;
}();

/* harmony default export */ __webpack_exports__["a"] = (ScrollHint);

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(2);
__webpack_require__(9);
__webpack_require__(10);
module.exports = __webpack_require__(11);


/***/ }),
/* 2 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__components_plugins_customPlugins_js__ = __webpack_require__(3);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__components_classes_HamburgerMenu_class_js__ = __webpack_require__(4);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__components_classes_Gallery_class_js__ = __webpack_require__(5);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__components_classes_YandexMap_class_js__ = __webpack_require__(6);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__components_classes_ModalWindows_class_js__ = __webpack_require__(7);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__components_classes_Order_class_js__ = __webpack_require__(8);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__components_classes_ScrollHint_class_js__ = __webpack_require__(0);


//import {Slider} from './components/classes/Slider.class.js';





(function ($, undefined) {
    $(function () {
        Object(__WEBPACK_IMPORTED_MODULE_0__components_plugins_customPlugins_js__["a" /* default */])();
        var pathInfo = window.location.pathname.substr(1);
        new __WEBPACK_IMPORTED_MODULE_1__components_classes_HamburgerMenu_class_js__["a" /* HamburgerMenu */]({
            mobile: {
                container: "mobile-menu",
                content: {
                    container: "ul[role=menubar]",
                    animateHeight: "220px",
                    'open-menu': 'fa-bars',
                    'close-menu': 'fa-times'
                },
                btn: "mobile-menu__toggle"
            }
        }).run();

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
        new __WEBPACK_IMPORTED_MODULE_2__components_classes_Gallery_class_js__["a" /* Gallery */]({
            "galleryContainer": "article__container__image",
            "thumbnailContainer": "gallery-image-wrapper",
            "fullSizeContainer": "gallery-image-full_size",
            "thumbnail": "gallery-image"
        }).run();
        switch (pathInfo) {
            case "":
                $('.main_slider').slick({
                    //dots:true,
                    arrows: true,
                    infinite: false,
                    slidesToShow: 4,
                    slidesToScroll: 1,
                    responsive: [{
                        breakpoint: 992,
                        settings: {
                            arrows: true,
                            slidesToShow: 3,
                            slidesToScroll: 1,
                            infinite: false
                        }
                    }, {
                        breakpoint: 768,
                        settings: {
                            arrows: true,
                            slidesToShow: 2,
                            slidesToScroll: 1,
                            infinite: false
                        }
                    }, {
                        breakpoint: 600,
                        settings: {
                            arrows: true,
                            slidesToShow: 1,
                            slidesToScroll: 1,
                            infinite: false
                        }
                    }]
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
                new __WEBPACK_IMPORTED_MODULE_3__components_classes_YandexMap_class_js__["a" /* YandexMap */]('contacts__map').load();
                break;
        }
        if (pathInfo === 'men/t-shirts' || pathInfo === 'women/t-shirts' || pathInfo === 'children/t-shirts') {
            new __WEBPACK_IMPORTED_MODULE_4__components_classes_ModalWindows_class_js__["a" /* ModalWindows */]({
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
                                        color: "#000"
                                    },
                                    selectedItem: 'selected-size'
                                }
                            }
                        },
                        orderCheckout: {
                            container: 'order__checkout'
                            /*checkoutInfo:'checkout__info',*/
                        },
                        orderConfirm: {
                            container: 'order__confirm'
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

            }).initWindows().run();
            new __WEBPACK_IMPORTED_MODULE_5__components_classes_Order_class_js__["a" /* Order */]({
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

            }).validate().send();
            /*(new ScrollHint({
                hintElem:'#scroll-down-hint',
                hintDisplayProps:{
                    'maxWinSize':'411',
                }
            })).run();*/
        }
    });
})(jQuery);

/***/ }),
/* 3 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/**
 * Created by isida on 19.06.2019.
 */

/* harmony default export */ __webpack_exports__["a"] = (function () {
    (function ($) {

        $.fn.replaceClass = function (search, replace) {

            // This is the easiest way to have default options.
            return this.each(function (_, item) {
                if ($(item).hasClass(search)) {
                    $(item).removeClass(search).addClass(replace);
                }
            });
        };
    })(jQuery);
});

/***/ }),
/* 4 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return HamburgerMenu; });
var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/**
 * Created by isida on 19.06.2019.
 */
var HamburgerMenu = function () {
    function HamburgerMenu(options) {
        _classCallCheck(this, HamburgerMenu);

        this._container = '.' + options.mobile.container;
        this._content = options.mobile.content;
        this._toggleMenuBtn = '.' + options.mobile.btn;
    }

    _createClass(HamburgerMenu, [{
        key: 'run',
        value: function run() {
            $(this._container).on('click.HamburgerMenu', this._toggleMenuBtn, $.proxy(this._toggleMenu, this));
            $(window).on('resize.HamburgerMenu', $.proxy(this._closeMenu, this, $(this._toggleMenuBtn).find('i')));
        }
    }, {
        key: '_toggleMenu',
        value: function _toggleMenu() {
            this._openMenu.call(this, event);
            this._closeMenu.call(this, event);
        }
    }, {
        key: '_openMenu',
        value: function _openMenu(event) {
            var target$ = $(event.target);
            var self = this;
            $(this._content.container).animate({
                height: self._content.animateHeight
            }, 300, function () {
                $(this).data('menu-open', true);
                target$.replaceClass(self._content['open-menu'], self._content['close-menu']);
            });
        }
    }, {
        key: '_closeMenu',
        value: function _closeMenu() {
            var target$ = arguments.length === 1 ? $(event.target) : arguments.length <= 0 ? undefined : arguments[0];
            var menuContainer = $(this._content.container);
            var self = this;
            if (menuContainer.data('menu-open') === undefined) return -1;
            $(this._content.container).animate({
                height: 0
            }, 300, function () {
                $(this).removeData('menu-open');
                $(this).removeAttr('style');
                target$.replaceClass(self._content['close-menu'], self._content['open-menu']);
            });
        }
    }]);

    return HamburgerMenu;
}();



/***/ }),
/* 5 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return Gallery; });
var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/**
 * Created by isida on 11.05.2019.
 */
var Gallery = function () {
    function Gallery(elements) {
        _classCallCheck(this, Gallery);

        this._galleryContainer$ = $('.' + elements.galleryContainer);
        this._fullSizeContainer = '.' + elements.fullSizeContainer;
        this._thumbnailContainer = elements.thumbnailContainer;
        this._thumbnail = '.' + elements.thumbnail;
        this._setDataAttribute();
    }

    _createClass(Gallery, [{
        key: 'run',
        value: function run() {
            $('.' + this._thumbnailContainer).on('click.gallery', $.proxy(this._thumbnailHandler, this));
        }
    }, {
        key: '_thumbnailHandler',
        value: function _thumbnailHandler(event) {
            var target = event.target;
            var replaceSrc = target.tagName === "IMG" ? target.getAttribute('src') : $(target).find('img').attr('src');
            if (!replaceSrc) return false;
            var parentTarget = target.closest(this._thumbnail);
            if (parentTarget === null || $(parentTarget).data('full-size') === true) return false;
            var currentFullSizeElement$ = this._getFullSizeElement();
            $(this._fullSizeContainer).animate({ opacity: 0.0 }, 200, function () {
                $(this).css("visibility", "hidden");
                $(this).find('img').attr('src', replaceSrc);
                currentFullSizeElement$.data('full-size', false);
                $(parentTarget).data('full-size', true);
                $(this).css("visibility", "visible");
            });
            $(this._fullSizeContainer).animate({ opacity: 1.0 }, 200);
        }
    }, {
        key: '_setDataAttribute',
        value: function _setDataAttribute() {
            var currentFullWidthImgSrc = $(this._fullSizeContainer).find('img').attr('src');
            $(this._thumbnail).each(function (_, item) {
                var thumbnailImg$ = $(item).find('img');
                $(item).data('full-size', false);
                if (thumbnailImg$.attr('src') === currentFullWidthImgSrc) $(item).data('full-size', true);
            });
        }
    }, {
        key: '_getFullSizeElement',
        value: function _getFullSizeElement() {
            return $(this._thumbnail).filter(function () {
                return $(this).data("full-size") === true;
            });
        }
    }]);

    return Gallery;
}();



/***/ }),
/* 6 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return YandexMap; });
var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/**
 * Created by Dragon on 19.05.2019.
 */
var YandexMap = function () {
    function YandexMap(mapContainer) {
        _classCallCheck(this, YandexMap);

        this._mapContainer = mapContainer;
    }

    _createClass(YandexMap, [{
        key: 'load',
        value: function load() {
            ymaps.ready(init);
            function init() {
                var map = new ymaps.Map('contacts__map', {
                    center: [53.849663840704956, 27.66238955487824],
                    zoom: 18,
                    controls: ['routeButtonControl', 'zoomControl', 'fullscreenControl']
                });
                var MyIconContentLayout = ymaps.templateLayoutFactory.createClass('<div style="color: #FFFFFF; font-weight: bold;">$[properties.iconContent]</div>'),
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
    }]);

    return YandexMap;
}();



/***/ }),
/* 7 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return ModalWindows; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__ScrollHint_class_js__ = __webpack_require__(0);
var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/**
 * Created by Dragon on 19.05.2019.
 */


var ModalWindows = function () {
    function ModalWindows(settings) {
        _classCallCheck(this, ModalWindows);

        this._bodyWrapper = settings.bodyWrapper;
        this._containerCallingMW = '.' + settings.callingMW.container;
        this._cardOpenedMW$ = null;
        this._itemNameSelector = settings.callingMW.itemNameSelector;
        this._modalWindowsOptions = settings.modalWindowsOptions;
        this._modalClothesSizeWindow = this._modalWindowsOptions.modalClothesSizeWindow;
        this._modalProductDescription = this._modalWindowsOptions.modalProductDescription;
        this._modalProductOrder = this._modalWindowsOptions.modalProductOrder;
    }

    _createClass(ModalWindows, [{
        key: 'initWindows',
        value: function initWindows() {
            $(this._containerCallingMW).on('click.ModalWindows-open', 'p,button', $.proxy(this._openHandler, this));
            $('.' + this._modalWindowsOptions.closeButton).on('click.ModalWindow-close', $.proxy(this._closeHandler, this));
            $(document.body).on('click.ModalWindows-close', '.' + this._bodyWrapper, $.proxy(this._closeHandler, this));
            $(window).on({
                'keydown.ModalWindows-close': $.proxy(this._keyDownCloseHandler, this),
                'resize.ModalWindows': $.proxy(this._resizeHandler, this)
            });
            return this;
        }
    }, {
        key: 'run',
        value: function run() {

            $('.' + this._modalClothesSizeWindow.orderCheckout.container).on('click.ModalWindow-checkout', $.proxy(this._checkoutBtnHandler, this));
            $('.' + this._modalClothesSizeWindow.orderConfirm.container + ',.' + this._modalProductDescription.container).on('click.ModalWindow-confirm', $.proxy(this._confirmBtnHandler, this));
            $('.' + this._modalProductOrder.ajaxSendData.orderSize).on('click.ModalWindow-order-size', { style: this._modalProductOrder.ajaxSendData.selectedItem }, ModalWindows._orderSelectSizeHandler);
            $('.' + this._modalProductOrder.ajaxSendData.button).on('ajaxResult.ModalWindow', $.proxy(this._orderBtnHandler, this));
        }
    }, {
        key: '_openHandler',
        value: function _openHandler(event) {
            try {
                this._openMW.call(this, event);
            } catch (e) {
                console.log(e.message);
            }
        }
    }, {
        key: '_closeHandler',
        value: function _closeHandler() {
            this._toggleBodyWrapper.call(this);
            this._closeMW.call(this);
        }
    }, {
        key: '_keyDownCloseHandler',
        value: function _keyDownCloseHandler(event) {
            if (event.key === 'Escape' && $('.' + this._bodyWrapper).length) this._closeHandler();
        }
    }, {
        key: '_resizeHandler',
        value: function _resizeHandler() {
            ModalWindows._centerMW(this._getCurrentOpenMW());
        }
    }, {
        key: '_checkoutBtnHandler',
        value: function _checkoutBtnHandler() {
            try {
                this._checkoutBtn.call(this, event);
            } catch (e) {
                console.log(e.message);
            }
        }
    }, {
        key: '_confirmBtnHandler',
        value: function _confirmBtnHandler() {
            try {
                this._confirmBtn.call(this, event);
            } catch (e) {
                console.log(e.message);
            }
        }
    }, {
        key: '_orderBtnHandler',
        value: function _orderBtnHandler(event) {
            try {
                this._orderBtn.call(this, event);
            } catch (e) {
                console.log(e.message);
            }
        }
    }, {
        key: '_openMW',
        value: function _openMW(event) {
            var target = event.target;
            console.log(target.closest(this._containerCallingMW));
            if (target.closest(this._containerCallingMW) === null) return false;
            this._cardOpenedMW$ = this._getCurrentProductCard(target);
            this._setSelectedProductData(this._getItemColor(target));
            var openMW$ = $('.' + $(target).closest("[data-modal-open]").data('modal-open'));
            if (!openMW$.length) throw new Error('No modal window found');
            this._toggleBodyWrapper.call(this);
            if (openMW$.hasClass('d-none') === false) throw new Error('Modal window is already open. Check that windows closing works properly.');
            openMW$.removeClass('d-none').fadeOut(0, function () {
                ModalWindows._centerMW($(this)).fadeIn("normal");
                setTimeout(function () {
                    __WEBPACK_IMPORTED_MODULE_0__ScrollHint_class_js__["a" /* default */].show({
                        hintElem: '#scroll-down-hint',
                        cssProps: {
                            'fadeinTime': 'normal',
                            'hintOffset': '0px',
                            'hideHintClass': 'invisible'
                        }
                    });
                }, 0);
            });
        }
    }, {
        key: '_closeMW',
        value: function _closeMW() {
            var _this = this;

            var modalWindowsCollection = this._modalWindowsOptions.classes;
            modalWindowsCollection.forEach(function (className) {
                var resetFunctionName = '_reset' + className.substr(6).charAt(0).toUpperCase() + className.substr(6).substr(1);
                var modalWindow$ = $('.' + className);
                if (modalWindow$.hasClass('d-none') === false) {
                    modalWindow$.fadeOut("900", function () {
                        ModalWindows._removeStyleAttrMW(modalWindow$).addClass('d-none');
                    });
                }
                if (_this[resetFunctionName] === undefined) throw new Error('Function ' + resetFunctionName + ' does not exists. Check class methods');
                _this[resetFunctionName]();
            });
        }
    }, {
        key: '_toggleBodyWrapper',
        value: function _toggleBodyWrapper() {
            var wraper = $('.' + this._bodyWrapper);
            if (wraper.length) {
                wraper.remove();
            } else {
                var div = document.createElement('div');
                div.className = this._bodyWrapper;
                $(div).wrap($(document.body).children());
                document.body.prepend(div);
            }
        }
    }, {
        key: '_getCurrentOpenMW',
        value: function _getCurrentOpenMW() {
            var currentOpenMW = this._modalWindowsOptions.classes.find(function (className) {
                var modalWindow$ = $('.' + className);
                if (modalWindow$.hasClass('d-none') === false) {
                    return true;
                }
            });
            return $('.' + currentOpenMW);
        }
    }, {
        key: '_checkoutBtn',
        value: function _checkoutBtn(event) {
            var button = event.target;
            if (button.tagName !== 'BUTTON') return false;
            if ($(button).data('button-order') === undefined) throw new Error('Data button-order attribute is not set');
            /*let checkOutInfo$ = this._getCheckoutInfo();
             if (checkOutInfo$.hasClass('d-none') === false) throw new Error('This notification should have been hidden before ' +
             'the previous closing of the window.Check the window reset to default settings.');
             checkOutInfo$.removeClass('d-none');*/
            var sizeTable = this._modalClothesSizeWindow.sizeTable;
            var clickUserHint = sizeTable.sizeHint;
            var clothesSizeCollection$ = this._getClotheSizeCollection();
            //let self = this;
            clothesSizeCollection$.on({
                'mouseover.ModalWindow-select-size': function mouseoverModalWindowSelectSize() {
                    $(this).not('.' + clickUserHint.style.selectedItem).css(clickUserHint.style.over);
                },
                'mouseout.ModalWindow-select-size': function mouseoutModalWindowSelectSize() {
                    $(this).css(clickUserHint.style.out);
                },
                'click.ModalWindow-select-size': function clickModalWindowSelectSize(event) {
                    try {
                        ModalWindows._selectedSizeHandler(event, button, clickUserHint.style.selectedItem);
                    } catch (e) {
                        console.log(e.message);
                    }
                }
            }).css(clickUserHint.style.bgColor);
        }
    }, {
        key: '_confirmBtn',
        value: function _confirmBtn(event) {
            var button = event.target;
            if (button.tagName !== 'BUTTON') return false;
            if ($(button).data('open-modal') === undefined) throw new Error('Data open-modal attribute is not set');
            if ($(button).data('open-modal').includes('withoutSetSize') === false) {
                var orderModal$ = $('.' + $(button).data('open-modal'));
                orderModal$.data('order-size', this._getSelectedSize());
            }
            $('.' + this._modalWindowsOptions.closeButton).trigger('click.ModalWindow-close');
            this._cardOpenedMW$.find("[data-modal-open='modal-product_order']>button").trigger('click.ModalWindows-open');
        }
    }, {
        key: '_orderBtn',
        value: function _orderBtn(event) {
            var target = event.target;
            if (target.tagName !== 'BUTTON') return false;
            /*let confirmMW$ = $(`.${$(target).data('open-modal')}`);
            if(!confirmMW$.length) throw new Error('Data open-modal attribute is not set');*/
            this._getCurrentOpenMW().find('.' + this._modalWindowsOptions.closeButton).trigger('click.ModalWindow-close');
            var triggerBtn$ = $("[data-modal-open='modal-confirm']", this._cardOpenedMW$);
            if (!triggerBtn$.length) throw new Error('Data open-modal attribute is not set');
            triggerBtn$.trigger('click.ModalWindows-open');
        }
    }, {
        key: '_resetClothes_size',
        value: function _resetClothes_size() {
            this._getClotheSizeCollection().removeAttr('style').off('mouseover.ModalWindow-select-size mouseout.ModalWindow-select-size click.ModalWindow-select-size');
            var search$ = $('.' + this._modalWindowsOptions.classes[0]).find('button').parent();
            var replace$ = search$.next();
            $('.active').removeAttr('class');
            ModalWindows.replaceMWNavButtons(search$, replace$);
        }
    }, {
        key: '_resetProduct_description',
        value: function _resetProduct_description() {}
    }, {
        key: '_resetProduct_order',
        value: function _resetProduct_order() {
            var inputCollection$ = $('input', $('.' + this._modalProductOrder.container));
            inputCollection$.each(function (_, item) {
                $(item).attr('type') === 'tel' ? $(item).val('+375') : $(item).val('');
            });
            $('.' + this._modalProductOrder.ajaxSendData.orderPrice + ' li').text('0 руб.');
            $('.' + this._modalProductOrder.ajaxSendData.button).addClass('disable');
        }
    }, {
        key: '_resetConfirm',
        value: function _resetConfirm() {}
    }, {
        key: '_getCurrentProductCard',
        value: function _getCurrentProductCard(target) {
            return $(target).closest('' + this._containerCallingMW);
        }
    }, {
        key: '_getItemColor',
        value: function _getItemColor(target) {
            var fullItemName = this._getCurrentProductCard(target).find(this._itemNameSelector).text();
            var matches = fullItemName.match(/\((.*?)\)/);
            return matches[1];
        }
    }, {
        key: '_setSelectedProductData',
        value: function _setSelectedProductData(color) {
            this._modalProductOrder.productColorElement.text(color);
            var productOrderMWContainer$ = $('.' + this._modalProductOrder.container);
            var selectedSize = productOrderMWContainer$.data('order-size');
            if (selectedSize !== undefined) {
                var orderSizeCollectionArr = $('.' + this._modalProductOrder.ajaxSendData.orderSize).find('li').toArray();
                orderSizeCollectionArr.find(function (li) {
                    if (li.textContent === selectedSize) return true;
                }).classList.add("active", this._modalProductOrder.ajaxSendData.selectedItem);
            }
            productOrderMWContainer$.removeData('order-size');
        }
    }, {
        key: '_getClotheSizeCollection',
        value: function _getClotheSizeCollection() {
            return $(this._modalClothesSizeWindow.sizeTable.sizeHint.selector, '.' + this._modalClothesSizeWindow.sizeTable.context);
        }
    }, {
        key: '_getSelectedSize',
        value: function _getSelectedSize() {
            var selectedItem = $('.' + this._modalClothesSizeWindow.sizeTable.sizeHint.style.selectedItem);
            if (selectedItem.data('size') === undefined) throw new Error('Data size attribute is not set');
            return selectedItem.data('size');
        }

        /*_getCheckoutInfo() {
         return $(`.${this._modalClothesSizeWindow.orderCheckout.checkoutInfo}`);
         }*/

    }], [{
        key: '_centerMW',
        value: function _centerMW(modalWindow$) {
            var mwSize = {
                width: modalWindow$.width(),
                height: modalWindow$.height()
            };
            var windowSize = {
                width: $(window).width(),
                height: $(window).height()
            };
            modalWindow$.css({
                top: (windowSize.height + 60 - mwSize.height) / 2 + 'px',
                left: (windowSize.width - mwSize.width) / 2 + 'px'
            });
            return modalWindow$;
        }
    }, {
        key: '_removeStyleAttrMW',
        value: function _removeStyleAttrMW(modalWindow$) {
            return modalWindow$.removeAttr('style');
        }
    }, {
        key: '_selectedSizeHandler',
        value: function _selectedSizeHandler() {
            for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
                args[_key] = arguments[_key];
            }

            var event = args[0],
                button = args[1],
                selectedSizeClass = args[2];

            var target$ = $(event.target);
            if ($(target$).parent('.table__header').length) return false;
            if (target$.hasClass('active') === false) {
                $('.active.' + selectedSizeClass).removeAttr('class');
            }
            target$.addClass('active ' + selectedSizeClass);
            /*if(originalObject._getCheckoutInfo().hasClass('d-none')===false)
             originalObject._getCheckoutInfo().addClass('d-none');*/
            var confirmContainer$ = $('.' + $(button).data('button-order'));
            if (!confirmContainer$.length) throw new Error('Button order does not exists.Check your html code');
            ModalWindows.replaceMWNavButtons($(button).parent(), confirmContainer$);
        }
    }, {
        key: '_orderSelectSizeHandler',
        value: function _orderSelectSizeHandler(event) {
            var target$ = $(event.target);
            if (!target$.closest('ul.grid').length || target$.get(0).tagName === 'UL') return false;
            if (target$.hasClass('active') === false) {
                $('.active.' + event.data.style).removeAttr('class');
            }
            target$.addClass('active ' + event.data.style);
        }
    }, {
        key: 'replaceMWNavButtons',
        value: function replaceMWNavButtons(search$, replace$) {
            var className = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 'd-none';

            search$.addClass(className);
            replace$.removeClass(className);
        }
    }]);

    return ModalWindows;
}();



/***/ }),
/* 8 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return Order; });
var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/**
 * Created by isida on 29.05.2019.
 */
var Order = function () {
    function Order(settings) {
        _classCallCheck(this, Order);

        this._orderContainerClassName = $("." + settings.validate.container);
        this._validateInputCollection$ = $("" + settings.validate.elements.inputs, this._orderContainerClassName);
        this._validateSizeOrderContainer$ = $("" + settings.validate.elements.li, this._orderContainerClassName);
        //this._ajaxData = settings.ajax;
        this._price$ = settings.t_shirt.price;
        this._sendAjaxBtn$ = settings.order.send;
        this._errorHint$ = settings.order.errorHint.container;
        this._errorHintClassName = "" + settings.order.errorHint.className;
        /*this._orderObj = {
            t_shirt: {
                name: settings.t_shirt.name,
                color: settings.t_shirt.color,
                size: "",
                qty: 0,
                totalPrice: 0
            },
            customer: {
                name: "",
                phone: "",
                email: ""
            }
        };*/
        this._orderObj = {
            t_shirt_name: settings.t_shirt.name,
            t_shirt_color: settings.t_shirt.color,
            t_shirt_size: "",
            t_shirt_qty: 0,
            t_shirt_totalPrice: 0,
            customer_name: "",
            customer_phone: "",
            customer_email: ""
        };
        this._inputNumberPrevValue = '';
    }

    _createClass(Order, [{
        key: "validate",
        value: function validate() {
            var _this = this;

            try {
                var self = this;
                this._validateSizeOrderContainer$.on('click.Order', 'li', function () {
                    setTimeout(function () {
                        self.isValid();
                        self._orderObj.t_shirt_size = self._getOrderSize().text();
                        self._hasErrorHint(self._validateSizeOrderContainer$);
                    }, 0);
                });
                this._validateInputCollection$.on('focus.Order', function (event) {
                    var inputLabel$ = $(event.target).closest("." + self._errorHint$);
                    self._hasErrorHint(inputLabel$);
                });
                this._validateInputCollection$.each(function (_, item) {
                    var typeAttr = item.getAttribute('type');
                    var inputHandler = "_" + typeAttr + "Validate";
                    switch (typeAttr) {
                        case "number":
                            $(item).on({
                                'input.Order': function inputOrder() {
                                    self[inputHandler](event);
                                },
                                'blur.Order': function blurOrder() {
                                    self.isValid();
                                }
                            });
                            break;
                        case "text":
                            $(item).on('blur.Order', $.proxy(_this[inputHandler], _this));
                            break;
                        case "tel":
                            $(item).on('blur.Order', $.proxy(_this[inputHandler], _this));
                            break;
                        case "email":
                            $(item).on('blur.Order', $.proxy(_this[inputHandler], _this));
                            break;
                        default:
                            throw new Error("Input with type " + typeAttr + " does not not process ");

                    }
                    if (_this[inputHandler] === undefined) throw new Error("Input validate handler " + inputHandler + " does not exists.");
                });
            } catch (e) {
                console.log(e.message);
            }
            return this;
        }
    }, {
        key: "send",
        value: function send() {
            this._sendAjaxBtn$.on('click.Order-send-ajax', $.proxy(this._ajaxSend, this));
        }
    }, {
        key: "_numberValidate",
        value: function _numberValidate(event) {
            var target$ = $(event.target);
            if (Order._regexpValidate(target$, /[1-9]*/) !== null) this._inputNumberPrevValue = Order._regexpValidate(target$, /[1-9]*/)[0];
            target$.val(this._inputNumberPrevValue);
            this._setTotalPrice(this._inputNumberPrevValue);
            this._orderObj.t_shirt_qty = parseInt(this._inputNumberPrevValue);
            this._orderObj.t_shirt_totalPrice = parseFloat(this._price$.text());
            this.isValid();
        }
    }, {
        key: "_setTotalPrice",
        value: function _setTotalPrice(productCount) {
            var _this2 = this;

            this._price$.text(function () {
                return (productCount * parseFloat(_this2._price$.data('start-price'))).toFixed(2) + " \u0440\u0443\u0431.";
            });
        }
    }, {
        key: "_textValidate",
        value: function _textValidate(event) {
            this._orderObj.customer_name = $(event.target).val();
            this.isValid();
        }
    }, {
        key: "_telValidate",
        value: function _telValidate(event) {

            if (Order._regexpValidate($(event.target), /^\+375\d{9}$/) === null) {
                $(event.target).val('+375');
                this._orderObj.customer_phone = "";
                return false;
            }
            this._orderObj.customer_phone = $(event.target).val();
            this.isValid();
        }
    }, {
        key: "_emailValidate",
        value: function _emailValidate(event) {

            if (Order._regexpValidate($(event.target), /.+@.+\..+/i) === null) {
                $(event.target).val('');
                this._orderObj.customer_email = "";
                return false;
            }
            this._orderObj.customer_email = $(event.target).val();
            this.isValid();
        }
    }, {
        key: "_getOrderSize",
        value: function _getOrderSize() {
            return this._validateSizeOrderContainer$.find('li').filter(function (_, item) {
                return $(item).hasClass('active');
            });
        }
    }, {
        key: "isValid",
        value: function isValid() {
            var valid = true;
            this._validateInputCollection$.each(function (_, item) {
                if ($(item).val() === '' || $(item).val() === '+375') {
                    valid = false;
                    return false;
                }
            });
            if (!this._getOrderSize().length) valid = false;
            valid === true ? this._sendAjaxBtn$.removeClass('disable') : this._sendAjaxBtn$.addClass('disable');
        }
    }, {
        key: "_getInvalidCollection",
        value: function _getInvalidCollection() {
            var _this3 = this;

            var invalidFields$ = this._validateInputCollection$.filter(function (_, item) {
                return $(item).val() === '' || $(item).val() === '+375';
            });
            invalidFields$.each(function (_, item) {
                $(item).closest("." + _this3._errorHint$).addClass(_this3._errorHintClassName);
            });
            if (!this._getOrderSize().length) this._validateSizeOrderContainer$.addClass(this._errorHintClassName);
        }
    }, {
        key: "_hasErrorHint",
        value: function _hasErrorHint(label$) {
            if (label$.hasClass(this._errorHintClassName)) label$.removeClass(this._errorHintClassName);
        }
    }, {
        key: "_ajaxSend",
        value: function _ajaxSend(event) {
            this.isValid();
            var target = $(event.target);
            if (target.hasClass('disable')) {
                this._getInvalidCollection();
                return false;
            }
            console.dir(JSON.stringify(this._orderObj).length);
            try {
                this._settingAjax(target);
            } catch (e) {
                console.log(e.message);
            }
        }
    }, {
        key: "_settingAjax",
        value: function _settingAjax(target) {

            $.ajax({
                type: "POST",
                url: '/order',
                data: JSON.stringify(this._orderObj),
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                    'Content-Type': 'application/json',
                    'charset': 'utf-8',
                    'Accept': 'application/json'
                },
                success: function success(response) {
                    if (response) {
                        //console.log(target);
                        $(target).trigger('ajaxResult.ModalWindow');
                        /*let confirmMW$ = $(`.${$(target).data('open-modal')}`);
                        if(!confirmMW$.length) throw new Error('Data open-modal attribute is not set');
                        confirmMW$*/
                    }
                },
                error: function error(data, textStatus, errorThrown) {
                    console.log(data.responseJSON.message);
                }
            });
        }
    }], [{
        key: "_regexpValidate",
        value: function _regexpValidate(target$, regex) {
            return target$.val().match(regex);
        }
    }]);

    return Order;
}();



/***/ }),
/* 9 */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),
/* 10 */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),
/* 11 */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ })
/******/ ]);