/**
 * Created by isida on 29.05.2019.
 */
class Order {
    constructor(settings) {
        this._validateCollection$ = $(`${settings.validate.elements}`, `.${settings.validate.container}`);
        this._inputNumberPrevValue = '';
        this._inputTelPrevValue = '';
    }

    inputValidate() {
        try {
            this._validateCollection$.each((_, item) => {
                let typeAttr = item.getAttribute('type');
                let inputHandler = `_${typeAttr}Validate`;
                let self = this;
                switch (typeAttr) {
                    case "number":
                        $(item).on({
                            'input.Order':function () {
                                self[inputHandler](event);
                            }
                        });
                        break;
                    case "text":
                        $(item).on('blur', this[inputHandler]);
                        break;
                    case "tel":
                        $(item).on('blur', this[inputHandler]);
                        break;
                    case "email":
                        $(item).on('blur', this[inputHandler]);
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

    }

    _numberValidate(event) {
        let target = event.target;
        let patternRes = $(target).val().match(/^\d+$/);
        if (patternRes !== null){
            this._inputPrevValue = $(target).val();
        }
        $(target).val(this._inputNumberPrevValue);
    }

    _textValidate() {

    }

    _telValidate() {
        let target = event.target;
        console.log($(target).val());
        let patternRes = $(target).val().match(/^[0-9]{5}$/);
        if (patternRes !== null){
            console.log('Not pattern');
            this._inputTelPrevValue = $(target).val();
            $(target).val('+375')
        }
        //$(target).val(this._inputTelPrevValue);
    }

    _emailValidate() {

    }
    /*_pasteHandler(event){
        let target = event.target;
        switch (target.getAttribute('type')){
            case "number":
                this._numberValidate(event);
                /!*let patternRes = $(target).val().match(/^\d+$/);
                if(patternRes===null)
                    $(target).val('');*!/
                break;

        }
    }*/
}
export {Order}