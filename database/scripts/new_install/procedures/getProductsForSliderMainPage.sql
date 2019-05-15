DROP PROCEDURE IF EXISTS getProductsForSliderMainPage;
DELIMITER //
CREATE PROCEDURE getProductsForSliderMainPage ()
LANGUAGE SQL
DETERMINISTIC
COMMENT 'return products data for CardSlider on index page'
BEGIN
   select name,price,img_src,img_alt,routeKeyName,url_prefix from t_shirts t join gender g on g.id=t.gender_id join t_shirt_image
   t_s on t_s.t_shirt_id = t.id join images i on t_s.image_id = i.id order by rand() limit 8;
END//