/**
 * Created by isida on 29.05.2019.
 */
class Order {
    constructor(settings) {
        this._validateInputCollection$ = $(`${settings.validate.elements.inputs}`, `.${settings.validate.container}`);
        this._validateSizeOrderContainer$ = $(`${settings.validate.elements.li}`, `.${settings.validate.container}`);
        //this._ajaxData = settings.ajax;
        this._price$ = settings.t_shirt.price;
        this._sendAjaxBtn$ = settings.order.send;
        this._orderObj = {
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
        };
        this._inputNumberPrevValue = '';
    }

    validate() {
        try {
            let self = this;
            this._validateSizeOrderContainer$.on('click.Order', 'li', function () {
                setTimeout(function () {
                    self.isValid();
                    self._orderObj.t_shirt.size = self._getOrderSize().text();
                }, 0);
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
        //console.log(this._ajaxSend());
        this._sendAjaxBtn$.on('click.Order-send-ajax', $.proxy(this._ajaxSend, this));
    }

    _numberValidate(event) {
        let target$ = $(event.target);
        if (Order._regexpValidate(target$, /[0-9]*/) !== null)
            this._inputNumberPrevValue = target$.val();
        target$.val(this._inputNumberPrevValue);
        this._setTotalPrice(this._inputNumberPrevValue);
        this._orderObj.t_shirt.qty = parseInt(this._inputNumberPrevValue);
        this._orderObj.t_shirt.totalPrice = parseFloat(this._price$.text());
        this.isValid();
    }

    _setTotalPrice(productCount) {
        this._price$.text(() => {
            return `${(productCount * parseFloat(this._price$.data('start-price'))).toFixed(2)} руб.`;
        });
    }

    _textValidate(event) {
        this._orderObj.customer.name = $(event.target).val();
        this.isValid();
    }

    _telValidate(event) {

        if (Order._regexpValidate($(event.target), /^\+375\d{9}$/) === null) {
            $(event.target).val('+375');
            this._orderObj.customer.phone = "";
            return false;
        }
        this._orderObj.customer.phone = $(event.target).val();
        this.isValid();
    }

    _emailValidate(event) {

        if (Order._regexpValidate($(event.target), /.+@.+\..+/i) === null) {
            $(event.target).val('');
            this._orderObj.customer.email = "";
            return false;
        }
        this._orderObj.customer.email = $(event.target).val();
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

    _ajaxSend(event) {
        this.isValid();
        let target = $(event.target);
        if (target.hasClass('disable')) return false;
        console.dir(JSON.stringify(this._orderObj).length);
        this._settingAjax();
    }

    _settingAjax() {

        $.ajax({
            type: "POST",
            url: '/order',
            data: JSON.stringify(this._orderObj),
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                'Content-Type': 'application/json',
                'charset':'utf-8',
                'Accept': 'application/json'
            },
            success: function (data) {
                console.log(data);
            },
            error: function (data, textStatus, errorThrown) {
                console.log(errorThrown);

            },
        });
    }
}
export {Order}