/**
 * Created by Dragon on 19.05.2019.
 */
class ModalWindows {
    constructor(settings) {
        this._bodyWrapper = settings.bodyWrapper;
        this._modalCallContainer = `.${settings.modalCallContainer}`;
        this._modalWindows = settings.modalWindows;
    }

    run() {
        $(this._modalCallContainer).on('click.ModalWindows',$.proxy(this._callModalWindow,this));
    }
    _callModalWindow(event){
        switch (this._modalCallContainer){
            case ".cards__item-description":
                this._cardsCallBack.call(this,event);
                //$.proxy(this._cardsCallBack,this,event);
                break;
        }
    }

    _cardsCallBack(event){
        let target =event.target;
        if(target.closest(this._modalCallContainer)===null) return false;

        this._toggleBodyWrapper.call(this);
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
}
export {ModalWindows}