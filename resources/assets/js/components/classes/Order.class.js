/**
 * Created by isida on 29.05.2019.
 */
class Order {
    constructor(settings) {
        this._validateInputCollection$ = $(`${settings.validate.elements.inputs}`, `.${settings.validate.container}`);
        this._validateSizeOrderContainer$ = $(`${settings.validate.elements.li}`, `.${settings.validate.container}`);
        this._ajaxData = settings.ajax;
        this._sendAjaxBtn$ = this._ajaxData.send;
        this._totalPriceElem$ = this._ajaxData.totalPriceElem;
        //this._orderSizeCollection = settings.ajax['order-size'];
        this._inputNumberPrevValue = '';
    }

    validate() {
        try {
            let self = this;
            this._validateSizeOrderContainer$.on('click.Order','li',function(){
                setTimeout(function(){
                    self.isValid();
                },0);
            });
            this._validateInputCollection$.each((_, item) => {
                let typeAttr = item.getAttribute('type');
                let inputHandler = `_${typeAttr}Validate`;
                switch (typeAttr) {
                    case "number":
                        $(item).on({
                            'input.Order': function () {
                                self[inputHandler](event);
                            },
                            'blur.Order': function () {
                                self.isValid();
                            }
                        });
                        break;
                    case "text":
                        $(item).on('blur.Order', $.proxy(this[inputHandler],this));
                        break;
                    case "tel":
                        $(item).on('blur.Order', $.proxy(this[inputHandler],this));
                        break;
                    case "email":
                        $(item).on('blur.Order', $.proxy(this[inputHandler],this));
                        break;
                    default:
                        throw new Error(`Input with type ${typeAttr} does not not process `);

                }
                if (this[inputHandler] === undefined)
                    throw new Error(`Input validate handler ${inputHandler} does not exists.`);
            });
        }
        catch (e) {
            console.log(e.message);
        }
        return this;
    }

    send() {
        //console.log(this._ajaxSend());
        this._sendAjaxBtn$.on('click.Order-send-ajax',$.proxy(this._ajaxSend));
    }

    _numberValidate(event) {
        let target$ = $(event.target);
        if (Order._regexpValidate(target$, /[0-9]*/) !== null)
            this._inputNumberPrevValue = target$.val();
        target$.val(this._inputNumberPrevValue);
        this._setTotalPrice(this._inputNumberPrevValue);
        this.isValid();
    }

    _setTotalPrice(productCount) {
        this._totalPriceElem$.text(() => {
            return `${(productCount * parseFloat(this._totalPriceElem$.data('start-price'))).toFixed(2)} руб.`;
        });
    }

    _textValidate() {
        this.isValid();
    }

    _telValidate(event) {

        if (Order._regexpValidate($(event.target), /^\+375\d{9}/) === null)
            $(event.target).val('+375');
        this.isValid();
    }

    _emailValidate(event) {

        if (Order._regexpValidate($(event.target), /.+@.+\..+/i) === null)
            $(event.target).val('');
        this.isValid();
    }

    static _regexpValidate(target$, regex) {
        return target$.val().match(regex);
    }
    _getOrderSize(){
      return this._validateSizeOrderContainer$.find('li').filter((_,item)=>{
          return $(item).hasClass('active');
      });
    }

    isValid() {
        let valid = true;
        this._validateInputCollection$.each((_, item) => {
            if ($(item).val() === '' || $(item).val() === '+375') {
                valid = false;
                return false;
            }
        });
        console.log(this._getOrderSize());
        if(!this._getOrderSize().length) valid = false;
        valid === true ? this._sendAjaxBtn$.removeClass('disabled') : this._sendAjaxBtn$.addClass('disabled');
    }
    _ajaxSend(event){
        let target = $(event.target);
        if(target.hasClass('disabled')) return false;
        console.log(JSON.stringify({
            "t_shirt":{
                "name":this._ajaxData.t_shirt_name,
                "color":this._ajaxData.t_shirt_color,
                "size":this._getOrderSize(),
                "qty":this._ajaxData.t_shirt_qty,
                "totalPrice":this._totalPriceElem$.data('start-price'),
            },
            "customer":{
                "name":this._ajaxData.customer_name,
                "phone":this._ajaxData.customer_phone,
                "email":this._ajaxData.customer_email
            }
        }));
    }
}
export {Order}