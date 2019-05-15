/**
 * Created by Dragon on 27.04.2019.
 */
class ProductsCard{
     constructor(productsComponents){
         this._productCard = productsComponents.productCard;
         this._productName$ = $(`.${productsComponents.productName}`);
         this._minHeight = 24;
    }

    run(){
        $(window).on('resize.productsCard', $.proxy(this._resizeProductNameHandler, this));
    }
    _resizeProductNameHandler(){

        let productNameCollectionWithBigHeight = this._productName$.filter((_,item)=>{
            return $(item).height()>=this._minHeight;
        });
        let startMarginBottom = this._productName$.css('marginBottom');
        console.log(startMarginBottom);
        /*if(currentProductNameHeight<=24){

        }
        else{

        }*/
    }

}
export {ProductsCard};
