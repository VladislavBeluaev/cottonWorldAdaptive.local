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
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

__webpack_require__(1);
module.exports = __webpack_require__(7);


/***/ }),
/* 1 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__components_classes_Menu_class_js__ = __webpack_require__(3);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__components_classes_Slider_class_js__ = __webpack_require__(4);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__components_classes_Gallery_class_js__ = __webpack_require__(5);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__components_classes_YandexMap_class_js__ = __webpack_require__(6);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__components_classes_ModalWindows_class_js__ = __webpack_require__(2);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__components_classes_Order_class_js__ = __webpack_require__(12);






(function ($, undefined) {
    $(function () {
        var pathInfo = window.location.pathname.substr(1);
        new __WEBPACK_IMPORTED_MODULE_0__components_classes_Menu_class_js__["a" /* Menu */]({
            resizeControl: {
                "menuBarFixed__container": "menubar-fixed ul",
                "menubarContacts__container": "menubar-contacts__container",
                "menuBarDefaultContainer": "container"
            },
            mouseOverOutControl: {
                "menubarCatalog__container": "menubar-catalog__wrapper",
                "menubarCatalog_item": "menubar-catalog_item a"
            }

        }).run();
        new __WEBPACK_IMPORTED_MODULE_2__components_classes_Gallery_class_js__["a" /* Gallery */]({
            "galleryContainer": "article__container__image",
            "thumbnailContainer": "gallery-image-wrapper",
            "fullSizeContainer": "gallery-image-full_size",
            "thumbnail": "gallery-image"
        }).run();
        switch (pathInfo) {
            case "":
                new __WEBPACK_IMPORTED_MODULE_1__components_classes_Slider_class_js__["a" /* Slider */]({
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
                }).start();
                break;
            case "contacts":
                new __WEBPACK_IMPORTED_MODULE_3__components_classes_YandexMap_class_js__["a" /* YandexMap */]('contacts__map').load();
                break;
            case "men/t-shirts":
                new __WEBPACK_IMPORTED_MODULE_4__components_classes_ModalWindows_class_js__["a" /* ModalWindows */]({
                    "bodyWrapper": "modal-wrapper",
                    "callingMW": {
                        container: "cards__item",
                        itemNameSelector: '.cards__item-name>p'
                    },
                    modalWindowsOptions: {
                        classes: ['modal-clothes_size', 'modal-product_description', 'modal-product_order'],
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
                                selectedItem: 'selected-size'
                            }
                        }
                    }

                }).initWindows().run();
                new __WEBPACK_IMPORTED_MODULE_5__components_classes_Order_class_js__["a" /* Order */]({
                    validate: {
                        container: 'modal-product_order',
                        elements: 'input'
                    },
                    ajax: {}

                }).inputValidate().send();
                break;
        }
    });
})(jQuery);

/***/ }),
/* 2 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return ModalWindows; });
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
        key: '_openMW',
        value: function _openMW(event) {
            var target = event.target;
            if (target.closest(this._containerCallingMW) === null) return false;
            this._cardOpenedMW$ = this._getCurrentProductCard(target);
            this._setSelectedProductData(this._getItemColor(target));
            var openMW$ = $('.' + $(target).closest("[data-modal-open]").data('modal-open'));
            if (!openMW$.length) throw new Error('No modal window found');
            this._toggleBodyWrapper.call(this);
            if (openMW$.hasClass('d-none') === false) throw new Error('Modal window is already open. Check that windows closing works properly.');
            openMW$.removeClass('d-none').fadeOut(0, function () {

                ModalWindows._centerMW($(this)).fadeIn("normal");
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
                $(item).val('');
            });
            $('.' + this._modalProductOrder.ajaxSendData.orderPrice + ' li').text('0 руб.');
        }
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
                top: (windowSize.height - mwSize.height) / 2 + 'px',
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
/* 3 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return Menu; });
var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/**
 * Created by isida on 07.05.2019.
 */

var Menu = function () {
    function Menu(menuComponents) {
        _classCallCheck(this, Menu);

        this._menuBarFixed__container$ = $('.' + menuComponents.resizeControl.menuBarFixed__container);
        this._menuBarDefaultContainer$ = $('.' + menuComponents.resizeControl.menuBarDefaultContainer);
        this._menubarContacts__container$ = $('.' + menuComponents.resizeControl.menubarContacts__container);
        this._menubarCatalog__container = '.' + menuComponents.mouseOverOutControl.menubarCatalog__container;
        this._menubarCatalog_item = '.' + menuComponents.mouseOverOutControl.menubarCatalog_item;
        this._imgOpts = menuComponents.mouseOverOutControl.imgOpts;
        this._currentOverElem = null;
        this._widthResizeHandler();
    }

    _createClass(Menu, [{
        key: 'run',
        value: function run() {
            $(window).on('resize.Menu', $.proxy(this._widthResizeHandler, this));
            $(this._menubarCatalog__container).on({
                'mouseover.Menu': $.proxy(this._overMenubarCatalogHandler, this),
                'mouseout.Menu': $.proxy(this._outMenubarCatalogHandler, this)
            });
        }
    }, {
        key: '_widthResizeHandler',
        value: function _widthResizeHandler() {
            var currentMenuBarContainerWidth = this._menuBarDefaultContainer$.width();
            this._menuBarFixed__container$.css('width', currentMenuBarContainerWidth + 'px');
            this._menuBarFixed__container$.add(this._menubarContacts__container$).css('width', currentMenuBarContainerWidth + 'px');
        }
    }, {
        key: '_overMenubarCatalogHandler',
        value: function _overMenubarCatalogHandler(event) {
            if (this._currentOverElem !== null) return false;
            var target = event.target.closest(this._menubarCatalog_item);
            if (!target) return false;
            Menu._getHoverImg($(target)).removeClass('d-none');
            Menu._getOutImg($(target)).addClass('d-none');
            this._currentOverElem = target;
        }
    }, {
        key: '_outMenubarCatalogHandler',
        value: function _outMenubarCatalogHandler(event) {
            var target = event.relatedTarget;
            if (!target) return false;
            if (this._currentOverElem === null) return false;
            while (target !== document.body) {
                if (target === this._currentOverElem) {
                    return false;
                }
                target = target.parentNode;
            }
            Menu._getHoverImg($(this._currentOverElem)).addClass('d-none');
            Menu._getOutImg($(this._currentOverElem)).removeClass('d-none');
            this._currentOverElem = null;
        }
    }], [{
        key: '_getHoverImg',
        value: function _getHoverImg(target$) {
            return target$.find('img').last();
        }
    }, {
        key: '_getOutImg',
        value: function _getOutImg(target$) {
            //console.log(target$.find('img').first());
            return target$.find('img').first();
        }
    }]);

    return Menu;
}();



/***/ }),
/* 4 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return Slider; });
var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

/**
 * Created by Dragon on 21.12.2018.
 */
var Slider = function () {
    function Slider(sliderOptions) {
        _classCallCheck(this, Slider);

        this._carousel$ = sliderOptions.slider;
        this._duration = sliderOptions.duration;
        this._countScroll = sliderOptions.countScroll;
        this._searchContext = this._getContext(this._carousel$);
        this._navigateOpts = sliderOptions.navigate;
        this._controlTopNavigatePosition(this._navigateOpts);
        this._carouselContent$ = this._carousel$.children().filter(':first-child');
        this._carouselContent$.data('countScrollCards', 0);
        this._maxScrollCards = (this._carouselContent$.children().length - 4) / this._countScroll;
        //this._productsLinkClass = sliderOptions.productCartLinkClass;
    }

    _createClass(Slider, [{
        key: 'start',
        value: function start() {
            var self = this;
            this._carousel$.click(function (e) {
                if ($(':animated').length) {
                    return false;
                }
                self._adaptiveOffset();
                var target = e.target;
                var nextClass = self._navigateOpts.buttonNext;
                var prevClass = self._navigateOpts.buttonPrev;
                var productsLink$ = $(target).closest('.' + self._navigateOpts.productCartLinkClass);
                if (productsLink$.length !== 0) window.location.href = productsLink$.attr('href');

                var navLinks = $(target.closest('div')).filter(function (_, elem) {
                    return elem.classList[0] == nextClass || elem.classList[0] == prevClass;
                });
                if (navLinks.length === 0) return false;

                if (false === Slider._notDisabled(navLinks)) return false;

                if (navLinks.hasClass(nextClass)) {
                    self._slide('left', self._duration);
                } else if (navLinks.hasClass(prevClass)) {
                    self._slide('right', self._duration);
                } else return false;
            });
        }
    }, {
        key: '_slide',
        value: function _slide(direction, duration) {
            var cardWidth = this._cardWidth();
            var offset = 0;
            var scrollSlide = this._scrollSlide.bind(this, direction);this._countScroll;
            if (direction === 'left') offset = this._sliderOffset() - this._countScroll * cardWidth + 'px';
            if (direction === 'right') offset = this._sliderOffset() + this._countScroll * cardWidth + 'px';
            this._carouselContent$.animate({
                "left": offset
            }, duration, /*"easeOutBounce",*/scrollSlide);
        }
    }, {
        key: '_scrollSlide',
        value: function _scrollSlide(direction) {
            var countScrollCards = this._carouselContent$.data('countScrollCards');
            if (direction === 'left') {
                this._carouselContent$.data('countScrollCards', ++countScrollCards);
            }
            if (direction === 'right') {
                this._carouselContent$.data('countScrollCards', --countScrollCards);
            }
            this._activeButton();
        }
    }, {
        key: '_activeButton',
        value: function _activeButton() {
            var next = $('.' + this._navigateOpts.buttonNext, this._searchContext);
            var prev = $('.' + this._navigateOpts.buttonPrev, this._searchContext);
            parseInt(this._carouselContent$.data('countScrollCards')) === this._maxScrollCards ? Slider.replaceClass(next, 'active', 'nonActive') : Slider.replaceClass(next, 'nonActive', 'active');

            parseInt(this._carouselContent$.data('countScrollCards')) !== 0 ? Slider.replaceClass(prev, 'nonActive', 'active') : Slider.replaceClass(prev, 'active', 'nonActive');
        }
    }, {
        key: '_adaptiveOffset',
        value: function _adaptiveOffset() {
            this._carouselContent$.data('currentWidth', this._cardWidth());
            $(window).on('resize', this._navigateOpts, $.proxy(this._resizeWindow, this));
        }
    }, {
        key: '_controlTopNavigatePosition',
        value: function _controlTopNavigatePosition(event) {
            var opts = event.data === undefined ? event : event.data;
            var relativeTo = $(opts.relativeTo, this._searchContext);
            var relativeToHeight = relativeTo.height();
            var positioningElement = $(opts.positioningElement, this._searchContext);
            var positioningElementHeight = positioningElement.outerHeight();
            var offset = 0;
            if (!$.isEmptyObject(opts.offset)) {
                var offsetKey = Object.keys(opts.offset)[0];
                var offsetValue = opts.offset[offsetKey];
                offset = $(offsetKey, this._searchContext).css(offsetValue);
            }
            switch (opts.position) {
                case "middle":
                    positioningElement.css('top', relativeToHeight / 2 - positioningElementHeight / 2 + parseInt(offset) + 'px');
                    break;
                case "bottom":
                    positioningElement.css('top', relativeToHeight - positioningElementHeight - parseInt(offset) + 'px');
                    break;
            }
        }
    }, {
        key: '_resizeWindow',
        value: function _resizeWindow(options) {
            var resizeCardWidth = this._cardWidth();
            if (this._carouselContent$.data('currentWidth') !== resizeCardWidth) {
                var countHideSlide = Math.round(this._sliderOffset() / this._carouselContent$.data('currentWidth'));
                this._carouselContent$.css("left", resizeCardWidth * countHideSlide + 'px');
                this._carouselContent$.data('currentWidth', resizeCardWidth);
            }
            this._controlTopNavigatePosition(options);
        }
    }, {
        key: '_cardWidth',
        value: function _cardWidth() {
            return this._carouselContent$.children().filter(':first-child').outerWidth(true);
        }
    }, {
        key: '_sliderOffset',
        value: function _sliderOffset() {
            return parseFloat(this._carouselContent$.css('left'));
        }
    }, {
        key: '_getContext',
        value: function _getContext(element) {
            var domElement = element[0];
            while (domElement.parentNode !== document.documentElement) {
                if (domElement.parentNode === document.body) {
                    break;
                }
                domElement = domElement.parentNode;
            }
            return domElement;
        }
    }], [{
        key: '_notDisabled',
        value: function _notDisabled(button) {
            return !button.hasClass('nonActive');
        }
    }, {
        key: 'replaceClass',
        value: function replaceClass(element, search, replace) {
            element.removeClass(search).addClass(replace);
        }
    }]);

    return Slider;
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
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),
/* 8 */,
/* 9 */,
/* 10 */,
/* 11 */,
/* 12 */
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

        this._validateCollection$ = $('' + settings.validate.elements, '.' + settings.validate.container);
        this._inputNumberPrevValue = '';
        this._inputTelPrevValue = '';
    }

    _createClass(Order, [{
        key: 'inputValidate',
        value: function inputValidate() {
            var _this = this;

            try {
                this._validateCollection$.each(function (_, item) {
                    var typeAttr = item.getAttribute('type');
                    var inputHandler = '_' + typeAttr + 'Validate';
                    var self = _this;
                    switch (typeAttr) {
                        case "number":
                            $(item).on({
                                'input.Order': function inputOrder() {
                                    self[inputHandler](event);
                                }
                            });
                            break;
                        case "text":
                            $(item).on('blur', _this[inputHandler]);
                            break;
                        case "tel":
                            $(item).on('blur', _this[inputHandler]);
                            break;
                        case "email":
                            $(item).on('blur', _this[inputHandler]);
                            break;
                        default:
                            throw new Error('Input with type ' + typeAttr + ' does not not process ');

                    }
                    if (_this[inputHandler] === undefined) throw new Error('Input validate handler ' + inputHandler + ' does not exists.');
                });
            } catch (e) {
                console.log(e.message);
            }
            return this;
        }
    }, {
        key: 'send',
        value: function send() {}
    }, {
        key: '_numberValidate',
        value: function _numberValidate(event) {
            var target = event.target;
            var patternRes = $(target).val().match(/^\d+$/);
            if (patternRes !== null) {
                this._inputPrevValue = $(target).val();
            }
            $(target).val(this._inputNumberPrevValue);
        }
    }, {
        key: '_textValidate',
        value: function _textValidate() {}
    }, {
        key: '_telValidate',
        value: function _telValidate() {
            var target = event.target;
            console.log($(target).val());
            var patternRes = $(target).val().match(/^[0-9]{5}$/);
            if (patternRes !== null) {
                console.log('Not pattern');
                this._inputTelPrevValue = $(target).val();
                $(target).val('+375');
            }
            //$(target).val(this._inputTelPrevValue);
        }
    }, {
        key: '_emailValidate',
        value: function _emailValidate() {}
        /*_pasteHandler(event){
            let target = event.target;
            switch (target.getAttribute('type')){
                case "number":
                    this._numberValidate(event);
                    /!*let patternRes = $(target).val().match(/^\d+$/);
                    if(patternRes===null)
                        $(target).val('');*!/
                    break;
              }
        }*/

    }]);

    return Order;
}();



/***/ })
/******/ ]);