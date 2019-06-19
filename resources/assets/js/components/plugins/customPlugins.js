/**
 * Created by isida on 19.06.2019.
 */
(function ( $ ) {

    $.fn.replaceClass = function(search,replace) {

        // This is the easiest way to have default options.
        return this.each((_,item)=>{
            if(item.hasClass(search))
            {
                item.removeClass(search).addClass(replace);
            }
        });

    };

}( jQuery ));
