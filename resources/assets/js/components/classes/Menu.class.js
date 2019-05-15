/**
 * Created by isida on 07.05.2019.
 */

class Menu{
    constructor(menuComponents){

        this._menuBarFixed__container$ = $(`.${menuComponents.resizeControl.menuBarFixed__container}`);
        this._menuBarDefaultContainer$ = $(`.${menuComponents.resizeControl.menuBarDefaultContainer}`);
        this._menubarContacts__container$ = $(`.${menuComponents.resizeControl.menubarContacts__container}`);
        this._menubarCatalog__container = `.${menuComponents.mouseOverOutControl.menubarCatalog__container}`;
        this._menubarCatalog_item = `.${menuComponents.mouseOverOutControl.menubarCatalog_item}`;
        this._imgOpts = menuComponents.mouseOverOutControl.imgOpts;
        this._currentOverElem = null;
        this._widthResizeHandler();
    }

    run(){
        $(window).on('resize.Menu', $.proxy(this._widthResizeHandler, this));
        $(this._menubarCatalog__container).on({
            'mouseover.Menu':$.proxy(this._overMenubarCatalogHandler,this),
            'mouseout.Menu':$.proxy(this._outMenubarCatalogHandler,this),
        });
    }
    _widthResizeHandler(){
        let currentMenuBarContainerWidth = this._menuBarDefaultContainer$.width();
        this._menuBarFixed__container$.css('width',`${currentMenuBarContainerWidth}px`);
        this._menuBarFixed__container$.add(this._menubarContacts__container$).css('width',`${currentMenuBarContainerWidth}px`);
    }
    _overMenubarCatalogHandler(event){
        if(this._currentOverElem!==null) return false;
        let target = event.target.closest(this._menubarCatalog_item);
        if(!target) return false;
        Menu._getHoverImg($(target)).removeClass('d-none');
        Menu._getOutImg($(target)).addClass('d-none');
        this._currentOverElem = target;
    }
    _outMenubarCatalogHandler(event){
        let target = event.relatedTarget;
        if(!target) return false;
        if(this._currentOverElem===null) return false;
        while(target!==document.body){
            if(target===this._currentOverElem) {
                return false;
            }
            target = target.parentNode;
        }
        Menu._getHoverImg($(this._currentOverElem)).addClass('d-none');
        Menu._getOutImg($(this._currentOverElem)).removeClass('d-none');
        this._currentOverElem = null;
    }
    static _getHoverImg(target$){
        return target$.find('img').last();
    }
    static _getOutImg(target$){
        //console.log(target$.find('img').first());
        return target$.find('img').first();
    }

}
export {Menu};