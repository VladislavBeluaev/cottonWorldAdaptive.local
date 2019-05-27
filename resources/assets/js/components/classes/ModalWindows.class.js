/**
 * Created by Dragon on 19.05.2019.
 */
class ModalWindows {
    constructor(settings) {
        this._bodyWrapper = settings.bodyWrapper;
        this._containerCallingMW = `.${settings.callingMW.container}`;
        this._currentProductCard$ = null;
        this._itemNameSelector = settings.callingMW.itemNameSelector;
        this._modalWindowsOptions = settings.modalWindowsOptions;
        this._modalClothesSizeWindow = this._modalWindowsOptions.modalClothesSizeWindow;
    }

    initWindows() {
        $(this._containerCallingMW).on('click.ModalWindows-open', 'p,button', $.proxy(this._openHandler, this));
        $(`.${this._modalWindowsOptions.closeButton}`).on('click.ModalWindow-close', $.proxy(this._closeHandler, this));
        $(document.body).on('click.ModalWindows-close', `.${this._bodyWrapper}`, $.proxy(this._closeHandler, this));
        $(window).on({
            'keydown.ModalWindows-close': $.proxy(this._keyDownCloseHandler, this),
            'resize.ModalWindows': $.proxy(this._resizeHandler, this)
        });
        return this;
    }

    run() {

        $(`.${this._modalClothesSizeWindow.orderCheckout.container}`).on('click.ModalWindow-checkout', $.proxy(this._checkoutBtnHandler, this));
        $(`.${this._modalClothesSizeWindow.orderConfirm.container}`).on('click.ModalWindow-confirm', $.proxy(this._confirmBtnHandler, this));
    }

    _openHandler(event) {
        try {
            this._openMW.call(this, event);
        }
        catch (e) {
            console.log(e.message);
        }
    }

    _closeHandler() {
        this._toggleBodyWrapper.call(this);
        this._closeMW.call(this);
    }

    _keyDownCloseHandler(event) {
        if (event.key === 'Escape' && $(`.${this._bodyWrapper}`).length)
            this._closeHandler();
    }

    _resizeHandler() {
        ModalWindows._centerMW(this._getCurrentOpenMW());
    }

    _checkoutBtnHandler() {
        try {
            this._checkoutBtn.call(this, event);
        }
        catch (e) {
            console.log(e.message);
        }
    }

    _confirmBtnHandler() {
        try {
            this._confirmBtn.call(this, event);
        }
        catch (e) {
            console.log(e.message);
        }
    }

    _openMW(event) {
        let target = event.target;
        if (target.closest(this._containerCallingMW) === null) return false;
        this._currentInitModalOpen$ =this._getCurrentProductCard(target);
        console.log(this._getItemColor(target));
        let openMW$ = $(`.${$(target).closest("[data-modal-open]").data('modal-open')}`);
        if (!openMW$.length)
            throw new Error(`No modal window found`);
        this._toggleBodyWrapper.call(this);
        if (openMW$.hasClass('d-none') === false)
            throw new Error(`Modal window is already open. Check that windows closing works properly.`);
        openMW$.removeClass('d-none').fadeOut(0, function () {

            ModalWindows._centerMW($(this)).fadeIn("normal");
        });
    }

    _closeMW() {
        let modalWindowsCollection = this._modalWindowsOptions.classes;
        modalWindowsCollection.forEach(className => {
            let modalWindow$ = $(`.${className}`);
            if (modalWindow$.hasClass('d-none') === false)
                modalWindow$.fadeOut("900", function () {
                    ModalWindows._removeStyleAttrMW(modalWindow$).addClass('d-none');
                });
        });
    }

    _toggleBodyWrapper() {
        let wraper = $(`.${this._bodyWrapper}`);
        if (wraper.length) {
            wraper.remove();
        }
        else {
            let div = document.createElement('div');
            div.className = this._bodyWrapper;
            $(div).wrap($(document.body).children());
            document.body.prepend(div);
        }
    }

    _getCurrentOpenMW() {
        let currentOpenMW = this._modalWindowsOptions.classes.find(className => {
            let modalWindow$ = $(`.${className}`);
            if (modalWindow$.hasClass('d-none') === false) {
                return true;
            }
        });
        return $(`.${currentOpenMW}`);
    }

    static _centerMW(modalWindow$) {
        let mwSize = {
            width: modalWindow$.width(),
            height: modalWindow$.height(),
        };
        let windowSize = {
            width: $(window).width(),
            height: $(window).height(),
        };
        modalWindow$.css({
            top: `${(windowSize.height - mwSize.height) / 2}px`,
            left: `${(windowSize.width - mwSize.width) / 2}px`,
        });
        return modalWindow$;
    }

    static _removeStyleAttrMW(modalWindow$) {
        return modalWindow$.removeAttr('style');
    }

    _checkoutBtn(event) {
        let button = event.target;
        if (button.tagName !== 'BUTTON') return false;
        if ($(button).data('button-order') === undefined) throw new Error('Data button-order attribute is not set');
        /*let checkOutInfo$ = this._getCheckoutInfo();
         if (checkOutInfo$.hasClass('d-none') === false) throw new Error('This notification should have been hidden before ' +
         'the previous closing of the window.Check the window reset to default settings.');
         checkOutInfo$.removeClass('d-none');*/
        let sizeTable = this._modalClothesSizeWindow.sizeTable;
        let clickUserHint = sizeTable.sizeHint;
        let clothesSizeCollection$ = $(`${clickUserHint.selector}`, `.${sizeTable.context}`);
        let self = this;
        clothesSizeCollection$.on({
            'mouseover.ModalWindow-select-size': function () {
                $(this).not(`.${clickUserHint.style.selectedItem}`).css(clickUserHint.style.over);
            },
            'mouseout.ModalWindow-select-size': function () {
                $(this).css(clickUserHint.style.out);
            },
            'click.ModalWindow-select-size': function (event) {
                try {
                    ModalWindows._selectedSizeHandler(event, button, clickUserHint.style.selectedItem);
                }
                catch (e) {
                    console.log(e.message);
                }

            }
        }).css(clickUserHint.style.bgColor);
    }

    _confirmBtn(event) {
        let button = event.target;
        if (button.tagName !== 'BUTTON') return false;
        if ($(button).data('open-modal') === undefined) throw new Error('Data button-order attribute is not set');
        let orderModal$ = $(`.${$(button).data('open-modal')}`);
        orderModal$.data('selected-size', this._getSelectedSize());
        $(`.${this._modalWindowsOptions.closeButton}`).trigger('click.ModalWindow-close');
        this._currentInitModalOpen$.find("[data-modal-open='modal-product_order']>button").trigger('click.ModalWindows-open');
    }

    static _selectedSizeHandler(...args) {
        let [event, button, selectedSizeClass] = args;
        let target$ = $(event.target);
        if ($(target$).parent('.table__header').length) return false;
        if (target$.hasClass('active') === false) {
            $(`.active.${selectedSizeClass}`).removeAttr('class');
        }
        target$.addClass(`active ${selectedSizeClass}`);
        /*if(originalObject._getCheckoutInfo().hasClass('d-none')===false)
         originalObject._getCheckoutInfo().addClass('d-none');*/
        let confirmContainer$ = $(`.${$(button).data('button-order')}`);
        if (!confirmContainer$.length)
            throw new Error('Button order does not exists.Check your html code');
        $(button).parent().addClass('d-none');
        confirmContainer$.removeClass('d-none');

    }

    _getCurrentProductCard(target) {
        return $(target).closest(`${this._containerCallingMW}`);
    }

    _getItemColor(target) {
        let fullItemName = this._getCurrentProductCard(target).find(this._itemNameSelector).text();
        let matches = fullItemName.match(/\((.*?)\)/);
        return matches[1];
    }

    _getSelectedSize() {
        let selectedItem = $(`.${this._modalClothesSizeWindow.sizeTable.sizeHint.style.selectedItem}`);
        if (selectedItem.data('size') === undefined)
            throw new Error('Data size attribute is not set');
        return selectedItem.data('size');
    }

    /*_getCheckoutInfo() {
     return $(`.${this._modalClothesSizeWindow.orderCheckout.checkoutInfo}`);
     }*/
}
export {ModalWindows}