DELETE from resources;

INSERT INTO `resources` VALUES ('1', 'Dishes', '', '0', 1, 1, 1, 'fa-desktop', 100);
INSERT INTO `resources` VALUES ('2', 'Stores', '', '0', 1, 1, 1, 'fa-window-maximize', 90);
INSERT INTO `resources` VALUES ('3', 'Orders', '', '0', 1, 1, 1, 'fa-sitemap', 80);
INSERT INTO `resources` VALUES ('4', 'Guests', '', '0', 1, 1, 1, 'fa-table', 70);
INSERT INTO `resources` VALUES ('5', 'Pages', '', '0', 1, 1, 1, 'fa-desktop', 60);
INSERT INTO `resources` VALUES ('6', 'Settings', '', '0', 1, 1, 1, 'fa-sitemap', 50);

INSERT INTO `resources` VALUES ('11', 'Ingredients', 'html/ingredient.html', '1', 1, 1, 1, '', 99);
INSERT INTO `resources` VALUES ('12', 'Foods', 'html/food.html', '1', 1, 1, 1, '', 98);
INSERT INTO `resources` VALUES ('13', 'Menu', 'html/menu.html', '1', 1, 1, 1, '', 97);
INSERT INTO `resources` VALUES ('14', 'DishClass', 'html/dishclass.html', '1', 1, 1, 1, '', 96);

INSERT INTO `resources` VALUES ('21', 'Information', 'html/store.html', '2', 1, 1, 1, '', 89);
INSERT INTO `resources` VALUES ('22', 'Deliverytime', 'html/deliverytime.html', '2', 1, 1, 1, '', 88);
INSERT INTO `resources` VALUES ('23', 'Deliveryarea', 'html/deliveryarea.html', '2', 1, 1, 1, '', 87);
INSERT INTO `resources` VALUES ('24', 'Deliverymenu', 'html/deliverymenu.html', '2', 1, 1, 1, '', 86);
INSERT INTO `resources` VALUES ('25', 'Deliveryfood', 'html/deliveryfood.html', '2', 1, 1, 1, '', 85);


INSERT INTO `resources` VALUES ('31', 'Orders', 'html/order.html', '3', 1, 1, 1, '', 79);

INSERT INTO `resources` VALUES ('41', 'Digital Gift Cards', 'html/digitalgiftcards.html', '4', 1, 1, 1, '', 69);

INSERT INTO `resources` VALUES ('61', 'Resources', 'html/resource.html', '6', 1, 1, 1, '', 49);



INSERT INTO `foodclass` VALUES ('2', '分类2', '分类2', '2');
INSERT INTO `foodclass` VALUES ('3', '分类3', '分类3', '2');



INSERT INTO `stores` VALUES ('f9f2e9f775634133a209f16532dedae0', '1', '1', '1', '1', '1', '1', '1', '1', null, null, null);

INSERT INTO `users` VALUES ('1', 'chefus@gmail.com', '1', '123456', NULL, NULL);