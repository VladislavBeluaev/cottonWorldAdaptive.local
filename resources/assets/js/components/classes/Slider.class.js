/**
 * Created by Dragon on 21.12.2018.
 */
class Slider {
    constructor(sliderOptions) {
        this._carousel$ = sliderOptions.slider;
        this._duration = sliderOptions.duration;
        this._countScroll = sliderOptions.countScroll;
        this._searchContext = this._getContext(this._carousel$);
        this._navigateOpts = sliderOptions.navigate;
        this._controlTopNavigatePosition(this._navigateOpts);
        this._carouselContent$ = this._carousel$.children().filter(':first-child');
        this._carouselContent$.data('countScrollCards', 0);
        this._maxScrollCards = (this._carouselContent$.children().length - 4)/this._countScroll;
        //this._productsLinkClass = sliderOptions.productCartLinkClass;
    }

    start() {
        let self = this;
        this._carousel$.click(function (e) {
            if ($(':animated').length) {
                return false;
            }
            self._adaptiveOffset();
            let target = e.target;
            let nextClass = self._navigateOpts.buttonNext;
            let prevClass = self._navigateOpts.buttonPrev;
            let productsLink$ =$(target).closest(`.${self._navigateOpts.productCartLinkClass}`);
            if(productsLink$.length!==0)
                window.location.href = productsLink$.attr('href');

            let navLinks = $(target.closest('div')).filter((_, elem) => {
                return elem.classList[0] == nextClass || elem.classList[0] == prevClass;
            });
            if (navLinks.length === 0) return false;

            if (false === Slider._notDisabled(navLinks)) return false;

            if (navLinks.hasClass(nextClass)) {
                self._slide('left', self._duration);
            }
            else if (navLinks.hasClass(prevClass)) {
                self._slide('right', self._duration);
            }
            else
                return false;
        });

    }

    _slide(direction, duration) {
        let cardWidth = this._cardWidth();
        let offset = 0;
        let scrollSlide = this._scrollSlide.bind(this, direction); this._countScroll
        if (direction === 'left') offset = `${this._sliderOffset() - this._countScroll*cardWidth}px`;
        if (direction === 'right') offset = `${this._sliderOffset() + this._countScroll*cardWidth}px`;
        this._carouselContent$.animate({
            "left": offset
        }, duration,/*"easeOutBounce",*/ scrollSlide);
    }

    _scrollSlide(direction) {
        let countScrollCards = this._carouselContent$.data('countScrollCards');
        if (direction === 'left') {
            this._carouselContent$.data('countScrollCards', ++countScrollCards);
        }
        if (direction === 'right') {
            this._carouselContent$.data('countScrollCards', --countScrollCards);
        }
        this._activeButton();
    }

    static _notDisabled(button) {
        return !button.hasClass('nonActive');
    }

    _activeButton() {
        let next = $('.'+this._navigateOpts.buttonNext,this._searchContext);
        let prev = $('.'+this._navigateOpts.buttonPrev,this._searchContext);
        parseInt(this._carouselContent$.data('countScrollCards')) === this._maxScrollCards ? Slider.replaceClass(next, 'active', 'nonActive')
            : Slider.replaceClass(next, 'nonActive', 'active');

        parseInt(this._carouselContent$.data('countScrollCards')) !== 0 ? Slider.replaceClass(prev, 'nonActive', 'active')
            : Slider.replaceClass(prev, 'active', 'nonActive');
    }

    static replaceClass(element, search, replace) {
        element.removeClass(search).addClass(replace);
    }

    _adaptiveOffset() {
        this._carouselContent$.data('currentWidth', this._cardWidth());
        $(window).on('resize',this._navigateOpts,$.proxy(this._resizeWindow, this));
    }
     _controlTopNavigatePosition(event) {
    let opts = event.data === undefined ? event : event.data;
    let relativeTo = $(opts.relativeTo,this._searchContext);
    let relativeToHeight = relativeTo.height();
    let positioningElement = $(opts.positioningElement,this._searchContext);
    let positioningElementHeight = positioningElement.outerHeight();
    let offset = 0;
    if(!$.isEmptyObject(opts.offset)){
        let offsetKey = Object.keys(opts.offset)[0];
        let offsetValue = opts.offset[offsetKey];
        offset = $(offsetKey,this._searchContext).css(offsetValue);
    }
    switch (opts.position) {
        case "middle":
            positioningElement.css('top', `${relativeToHeight/2 - positioningElementHeight/2 + parseInt(offset)}px`);
            break;
        case "bottom":
            positioningElement.css('top', `${relativeToHeight - positioningElementHeight - parseInt(offset)}px`);
            break;
    }
}

    _resizeWindow(options) {
        let resizeCardWidth = this._cardWidth();
        if (this._carouselContent$.data('currentWidth') !== resizeCardWidth) {
            let countHideSlide = Math.round((this._sliderOffset() / this._carouselContent$.data('currentWidth')));
            this._carouselContent$.css("left", `${resizeCardWidth * countHideSlide}px`);
            this._carouselContent$.data('currentWidth', resizeCardWidth);
        }
        this._controlTopNavigatePosition(options);
    }

    _cardWidth() {
        return this._carouselContent$.children().filter(':first-child').outerWidth(true);
    }

    _sliderOffset() {
        return parseFloat(this._carouselContent$.css('left'));
    }
    _getContext(element){
        let domElement = element[0];
        while(domElement.parentNode!==document.documentElement){
            if(domElement.parentNode===document.body){
                break;
            }
            domElement = domElement.parentNode;
        }
        return domElement;
    }
}
export {Slider};