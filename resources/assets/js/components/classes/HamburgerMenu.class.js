/**
 * Created by isida on 19.06.2019.
 */
class HamburgerMenu {
    constructor(options) {
        this._container = `.${options.mobile.container}`;
        this._content = options.mobile.content;
        this._toggleMenuBtn = `.${options.mobile.btn}`;
    }
    run(){
        $(this._container).on('click.HamburgerMenu',this._toggleMenuBtn,$.proxy(this._toggleMenu,this));
        $(window).on('resize.HamburgerMenu',$.proxy(this._closeMenu,this,$(this._toggleMenuBtn).find('i')));
    }
    _toggleMenu(){
        this._openMenu.call(this,event);
        this._closeMenu.call(this,event);
    }
    _openMenu(event){
        let target$ = $(event.target);
        let self = this;
        $(this._content.container).animate({
        height:self._content.animateHeight
        },300,function () {
            $(this).data('menu-open',true);
            target$.replaceClass(self._content['open-menu'],self._content['close-menu']);
        });
    }
    _closeMenu(...args){
        let target$ = (args.length===1)?$(event.target):args[0];
        let menuContainer = $(this._content.container);
        let self = this;
        if(menuContainer.data('menu-open')===undefined) return -1;
        $(this._content.container).animate({
            height:0
        },300,function () {
            $(this).removeData('menu-open');
            $(this).removeAttr('style');
            target$.replaceClass(self._content['close-menu'],self._content['open-menu']);
        });
    }

}
export {HamburgerMenu};