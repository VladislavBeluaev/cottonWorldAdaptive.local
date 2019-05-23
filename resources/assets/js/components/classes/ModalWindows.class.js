/**
 * Created by Dragon on 19.05.2019.
 */
class ModalWindows {
    constructor(settings) {
        this._bodyWrapper = settings.bodyWrapper;
        this._containerCallingMW = `.${settings.containerCallingMW}`;
        this._modalWindowsOptions = settings.modalWindowsOptions;
    }

    run() {
        $(this._containerCallingMW).on('click.ModalWindow-open', $.proxy(this._openHandler, this));
        $(`.${this._modalWindowsOptions.closeButton}`).on('click.ModalWindow-close', $.proxy(this._closeHandler, this));
        $(document.body).on('click.ModalWindow-close', `.${this._bodyWrapper}`, $.proxy(this._closeHandler, this));
        $(window).on({
            'keydown.ModalWindow-close': $.proxy(this._keyDownCloseHandler, this),
            'resize.ModalWindow': $.proxy(this._resizeHandler, this)
        });
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

    _openMW(event) {
        let target = event.target;
        if (target.closest(this._containerCallingMW) === null) return false;
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

}
export {ModalWindows}