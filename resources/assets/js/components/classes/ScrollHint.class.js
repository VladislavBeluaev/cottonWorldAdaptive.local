/**
 * Created by isida on 16.07.2019.
 */
export default class ScrollHint {
    static show(hintSettings) {
        let hint$ = $(hintSettings.hintElem);
        let cssProps = hintSettings.cssProps;
        if (hint$.hasClass(cssProps.hideHintClass) === true)
            hint$.removeClass(cssProps.hideHintClass);
        hint$.animate({
            top: `${cssProps.hintOffset}`
        }, 1000, function () {
            console.log(hintSettings);
            $(this).fadeOut(cssProps.fadeinTime, function () {
                $(this).removeAttr('style').addClass(cssProps.hideHintClass);
            });

        });
    }
}
