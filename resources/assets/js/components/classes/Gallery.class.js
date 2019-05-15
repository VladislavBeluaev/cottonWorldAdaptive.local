/**
 * Created by isida on 11.05.2019.
 */
class Gallery {
    constructor(elements) {
        this._galleryContainer$ = $(`.${elements.galleryContainer}`);
        this._fullSizeContainer = `.${elements.fullSizeContainer}`;
        this._thumbnailContainer = elements.thumbnailContainer;
        this._thumbnail = `.${elements.thumbnail}`;
        this._setDataAttribute();
    }

    run() {
        $(`.${this._thumbnailContainer}`).on('click.gallery', $.proxy(this._thumbnailHandler, this));
    }

    _thumbnailHandler(event) {
        let target = event.target;
        let replaceSrc = target.tagName==="IMG"?target.getAttribute('src'):$(target).find('img').attr('src');
        if(!replaceSrc) return false;
        let parentTarget = target.closest(this._thumbnail);
        if (parentTarget === null || $(parentTarget).data('full-size') === true) return false;
        let currentFullSizeElement$ = this._getFullSizeElement();
        $(this._fullSizeContainer).animate({opacity: 0.0}, 200, function () {
            $(this).css("visibility","hidden");
            $(this).find('img').attr('src', replaceSrc);
            currentFullSizeElement$.data('full-size', false);
            $(parentTarget).data('full-size', true);
            $(this).css("visibility","visible");
        });
        $(this._fullSizeContainer).animate({opacity: 1.0},200);
    }

    _setDataAttribute() {
        let currentFullWidthImgSrc = $(this._fullSizeContainer).find('img').attr('src');
        $(this._thumbnail).each((_, item) => {
            let thumbnailImg$ = $(item).find('img');
            $(item).data('full-size', false);
            if (thumbnailImg$.attr('src') === currentFullWidthImgSrc)
                $(item).data('full-size', true);
        });
    }

    _getFullSizeElement() {
        return $(this._thumbnail).filter(function () {
            return $(this).data("full-size") === true;
        });
    }

}
export {Gallery}
