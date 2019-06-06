/**
 * Created by isida on 29.05.2019.
 */
class Order {
    constructor(settings) {
        this._orderContainerClassName = $(`.${settings.validate.container}`);
        this._validateInputCollection$ = $(`${settings.validate.elements.inputs}`, this._orderContainerClassName);
        this._validateSizeOrderContainer$ = $(`${settings.validate.elements.li}`, this._orderContainerClassName);
        //this._ajaxData = settings.ajax;
        this._price$ = settings.t_shirt.price;
        this._sendAjaxBtn$ = settings.order.send;
        this._errorHint$ = settings.order.errorHint.container;
        this._errorHintClassName = `${settings.order.errorHint.className}`;
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

    validate() {
        try {
            let self = this;
            this._validateSizeOrderContainer$.on('click.Order', 'li', function () {
                setTimeout(function () {
                    self.isValid();
                    self._orderObj.t_shirt_size = self._getOrderSize().text();
                    self._hasErrorHint(self._validateSizeOrderContainer$);
                }, 0);
            });
            this._validateInputCollection$.on('focus.Order',function(event){
               let inputLabel$ = $(event.target).closest(`.${self._errorHint$}`);
                self._hasErrorHint(inputLabel$);
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
                        $(item).on('blur.Order', $.proxy(this[inputHandler], this));
                        break;
                    case "tel":
                        $(item).on('blur.Order', $.proxy(this[inputHandler], this));
                        break;
                    case "email":
                        $(item).on('blur.Order', $.proxy(this[inputHandler], this));
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
        this._sendAjaxBtn$.on('click.Order-send-ajax', $.proxy(this._ajaxSend, this));
    }

    _numberValidate(event) {
        let target$ = $(event.target);
        if (Order._regexpValidate(target$, /[1-9]*/) !== null)
            this._inputNumberPrevValue = Order._regexpValidate(target$, /[1-9]*/)[0];
        target$.val(this._inputNumberPrevValue);
        this._setTotalPrice(this._inputNumberPrevValue);
        this._orderObj.t_shirt_qty = parseInt(this._inputNumberPrevValue);
        this._orderObj.t_shirt_totalPrice = parseFloat(this._price$.text());
        this.isValid();
    }

    _setTotalPrice(productCount) {
        this._price$.text(() => {
            return `${(productCount * parseFloat(this._price$.data('start-price'))).toFixed(2)} руб.`;
        });
    }

    _textValidate(event) {
        this._orderObj.customer_name = $(event.target).val();
        this.isValid();
    }

    _telValidate(event) {

        if (Order._regexpValidate($(event.target), /^\+375\d{9}$/) === null) {
            $(event.target).val('+375');
            this._orderObj.customer_phone = "";
            return false;
        }
        this._orderObj.customer_phone = $(event.target).val();
        this.isValid();
    }

    _emailValidate(event) {

        if (Order._regexpValidate($(event.target), /.+@.+\..+/i) === null) {
            $(event.target).val('');
            this._orderObj.customer_email = "";
            return false;
        }
        this._orderObj.customer_email = $(event.target).val();
        this.isValid();
    }

    static _regexpValidate(target$, regex) {
        return target$.val().match(regex);
    }

    _getOrderSize() {
        return this._validateSizeOrderContainer$.find('li').filter((_, item) => {
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
        if (!this._getOrderSize().length) valid = false;
        valid === true ? this._sendAjaxBtn$.removeClass('disable') : this._sendAjaxBtn$.addClass('disable');
    }
    _getInvalidCollection(){
       let invalidFields$ = this._validateInputCollection$.filter((_,item)=>{
           return  $(item).val() === '' || $(item).val() === '+375';
        });
        invalidFields$.each((_,item)=>{
            $(item).closest(`.${this._errorHint$}`).addClass(this._errorHintClassName);
        });
        if (!this._getOrderSize().length) this._validateSizeOrderContainer$.addClass(this._errorHintClassName);
    }
    _hasErrorHint(label$){
        if(label$.hasClass(this._errorHintClassName))
            label$.removeClass(this._errorHintClassName);
    }

    _ajaxSend(event) {
        this.isValid();
        let target = $(event.target);
        if (target.hasClass('disable')) {
            this._getInvalidCollection();
            return false;
        }
        console.dir(JSON.stringify(this._orderObj).length);
        try {
            this._settingAjax(target);
        }
        catch (e){
            console.log(e.message);
        }

    }

    _settingAjax(target) {

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
            success: function (response) {
                if(response){
                    //console.log(target);
                    $(target).trigger('ajaxResult.ModalWindow');
                    /*let confirmMW$ = $(`.${$(target).data('open-modal')}`);
                    if(!confirmMW$.length) throw new Error('Data open-modal attribute is not set');
                    confirmMW$*/
                }


            },
            error: function (data, textStatus, errorThrown) {
                console.log(errorThrown);

            },
        });
    }
}
export {Order}