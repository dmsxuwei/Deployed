/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/4/16 0:30:42                            */
/*==============================================================*/


drop table if exists Menu;

drop table if exists billingaddress;

drop table if exists cart;

drop table if exists cartitems;

drop table if exists customers;

drop table if exists deliveryarea;

drop table if exists deliveryareatime;

drop table if exists deliveryareatimefoods;

drop table if exists deliveryareatimemenus;

drop table if exists deliverytime;

drop table if exists failed_jobs;

drop table if exists food_menu;

drop table if exists foodclass;

drop table if exists foods;

drop table if exists ingredient_food;

drop table if exists ingredients;

drop table if exists logs;

drop table if exists manufactuer;

drop table if exists menusuppytime;

drop table if exists orderdetail;

drop table if exists orders;

drop table if exists paymentinfo;

drop table if exists resources;

drop table if exists shippingaddress;

drop table if exists stores;

drop table if exists system_messages;

drop table if exists users;

/*==============================================================*/
/* Table: Menu                                                  */
/*==============================================================*/
create table Menu
(
   menuid               varchar(32) not null,
   menusupplytimeid     varchar(32),
   storeid              varchar(32),
   foodclassid          varchar(32),
   name_zhCN            varchar(255) not null,
   name_enUS            varchar(255) not null,
   images               varchar(255) default NULL,
   price                int(11) not null default 0,
   old_price            int(11) default NULL,
   category             varchar(32),
   created_at           datetime not null,
   updated_at           datetime default NULL,
   deleted_at           datetime default NULL,
   primary key (menuid)
);

alter table Menu comment '菜单';

/*==============================================================*/
/* Table: billingaddress                                        */
/*==============================================================*/
create table billingaddress
(
   billingaddressid     varchar(32) not null,
   billingaddress       varchar(255),
   city                 varchar(32),
   state                varchar(32),
   zipcode              varchar(10),
   country              varchar(32),
   primary key (billingaddressid)
);

alter table billingaddress comment '账单地址';

/*==============================================================*/
/* Table: cart                                                  */
/*==============================================================*/
create table cart
(
   cartid               varchar(32) not null,
   customerid           varchar(32),
   primary key (cartid)
);

alter table cart comment '购物车';

/*==============================================================*/
/* Table: cartitems                                             */
/*==============================================================*/
create table cartitems
(
   cartitemid           varchar(32) not null,
   cartid               varchar(32),
   foodid               varchar(32),
   menuid               varchar(32),
   storeid              varchar(32),
   quantity             int,
   amount               int,
   status               int not null,
   primary key (cartitemid)
);

alter table cartitems comment '购物车商品';

/*==============================================================*/
/* Table: customers                                             */
/*==============================================================*/
create table customers
(
   customerid           varchar(32) not null,
   shippingaddressid    varchar(32),
   billingaddressid     varchar(32),
   fisrtname            varchar(32),
   lastname             varchar(32),
   email                varchar(255) not null comment '邮箱',
   mobile               varchar(255) not null comment '手机',
   salt                 varchar(255) comment '手机验证时可为空',
   password             varchar(255) comment '手机验证时可为空',
   email_verified_at    datetime default NULL,
   mobile_verified_at   datetime default NULL,
   created_at           datetime not null,
   updated_at           datetime default NULL,
   deleted_at           datetime default NULL,
   primary key (customerid),
   unique key AK_Key_2 (email),
   unique key AK_Key_3 (mobile)
);

alter table customers comment 'customers';

/*==============================================================*/
/* Table: deliveryarea                                          */
/*==============================================================*/
create table deliveryarea
(
   deliveryareaid       varchar(32) not null,
   storeid              varchar(32),
   areaname             varchar(50),
   address              varchar(100),
   longitude            varchar(100),
   latitude             varchar(100),
   primary key (deliveryareaid)
);

alter table deliveryarea comment '配送的地域范围';

/*==============================================================*/
/* Table: deliveryareatime                                      */
/*==============================================================*/
create table deliveryareatime
(
   deliveryareatimeid   varchar(32) not null,
   deliveryareaid       varchar(32),
   deliverytimeid       varchar(32),
   areaname             varchar(255),
   address              varchar(255),
   longitude            varchar(100),
   latitude             varchar(100),
   week                 int,
   timefrom             varchar(32),
   timeto               varchar(32),
   primary key (deliveryareatimeid)
);

alter table deliveryareatime comment 'deliveryareatime';

/*==============================================================*/
/* Table: deliveryareatimefoods                                 */
/*==============================================================*/
create table deliveryareatimefoods
(
   deliveryareatimefoodsid varchar(32) not null,
   foodid               varchar(32),
   deliveryareatimeid   varchar(32),
   storeid              varchar(32),
   foodclassid          varchar(32),
   spicy                int(11),
   servingsize          int(11),
   salinity             int(11),
   name_zhCN            varchar(255) not null,
   name_enUS            varchar(255) not null,
   images               varchar(255) default NULL,
   price                int(11) not null default 0,
   old_price            int(11) default NULL,
   category             varchar(32),
   created_at           datetime,
   deliveryareaid       varchar(32),
   deliverytimeid       varchar(32),
   areaname             varchar(255),
   address              varchar(255),
   longitude            varchar(100),
   latitude             varchar(100),
   week                 int,
   timefrom             varchar(32),
   timeto               varchar(32),
   primary key (deliveryareatimefoodsid)
);

alter table deliveryareatimefoods comment 'deliveryareatimefoods';

/*==============================================================*/
/* Table: deliveryareatimemenus                                 */
/*==============================================================*/
create table deliveryareatimemenus
(
   deliveryareatimemenusid varchar(32) not null,
   menuid               varchar(32),
   deliveryareatimeid   varchar(32),
   storeid              varchar(32),
   foodclassid          varchar(32),
   name_zhCN            varchar(255) not null,
   name_enUS            varchar(255) not null,
   images               varchar(255) default NULL,
   price                int(11) not null default 0,
   old_price            int(11) default NULL,
   category             varchar(32),
   created_at           datetime not null,
   deliveryareaid       varchar(32),
   deliverytimeid       varchar(32),
   areaname             varchar(255),
   address              varchar(255),
   longitude            varchar(100),
   latitude             varchar(100),
   week                 int,
   timefrom             varchar(32),
   timeto               varchar(32),
   primary key (deliveryareatimemenusid)
);

alter table deliveryareatimemenus comment 'deliveryareatimemenus';

/*==============================================================*/
/* Table: deliverytime                                          */
/*==============================================================*/
create table deliverytime
(
   deliverytimeid       varchar(32) not null,
   storeid              varchar(32),
   timetype             int comment '0 all 1 area 2 week',
   week                 int,
   timefrom             varchar(32),
   timeto               varchar(32),
   primary key (deliverytimeid)
);

alter table deliverytime comment '配送的时间范围';

/*==============================================================*/
/* Table: failed_jobs                                           */
/*==============================================================*/
create table failed_jobs
(
   failedjobid          varchar(32) not null,
   connections          text not null,
   queue                text not null,
   payload              longtext not null,
   exception            longtext not null,
   failed_at            timestamp not null default CURRENT_TIMESTAMP,
   primary key (failedjobid)
);

alter table failed_jobs comment 'failed_jobs';

/*==============================================================*/
/* Table: food_menu                                             */
/*==============================================================*/
create table food_menu
(
   foodmenuid           varchar(32) not null,
   foodid               varchar(32),
   menuid               varchar(32),
   quantity             int,
   primary key (foodmenuid)
);

alter table food_menu comment 'food_menu';

/*==============================================================*/
/* Table: foodclass                                             */
/*==============================================================*/
create table foodclass
(
   foodclassid          varchar(32) not null,
   classname            varchar(32),
   description          varchar(255),
   foodtype             int(1) comment '1 food 2 menu',
   primary key (foodclassid)
);

alter table foodclass comment 'foodclass';

/*==============================================================*/
/* Table: foods                                                 */
/*==============================================================*/
create table foods
(
   foodid               varchar(32) not null,
   manufactuerid        varchar(32),
   storeid              varchar(32),
   foodclassid          varchar(32),
   spicy                int(11),
   servingsize          int(11),
   salinity             int(11),
   name_zhCN            varchar(255) not null,
   name_enUS            varchar(255) not null,
   images               varchar(255) default NULL,
   price                int(11) not null default 0,
   old_price            int(11) default NULL,
   category             varchar(32),
   created_at           datetime not null,
   updated_at           datetime default NULL,
   deleted_at           datetime default NULL,
   primary key (foodid)
);

alter table foods comment 'foods';

/*==============================================================*/
/* Table: ingredient_food                                       */
/*==============================================================*/
create table ingredient_food
(
   ingredientfoodid     varchar(32) not null,
   ingredientid         varchar(32),
   foodid               varchar(32),
   quantity             int,
   primary key (ingredientfoodid)
);

alter table ingredient_food comment 'ingredient_food';

/*==============================================================*/
/* Table: ingredients                                           */
/*==============================================================*/
create table ingredients
(
   ingredientid         varchar(32) not null,
   name_zhCN            varchar(255) not null,
   name_enUS            varchar(255) not null,
   images               varchar(255) default NULL,
   price                int(11),
   desc_zhCN            varchar(255)  not null default '',
   desc_enUS            varchar(255) not null default '',
   category             varchar(32),
   created_at           datetime not null,
   updated_at           datetime default NULL,
   deleted_at           datetime default NULL,
   primary key (ingredientid)
);

alter table ingredients comment 'ingredients';

/*==============================================================*/
/* Table: logs                                                  */
/*==============================================================*/
create table logs
(
   logid                varchar(32) not null,
   customerid           varchar(32),
   userid               varchar(32),
   loggable             varchar(255) default NULL,
   loggable_id          varchar(255) default NULL,
   action               varchar(255) not null,
   ip                   varchar(32) not null,
   content              text not null,
   created_at           datetime not null,
   primary key (logid)
);

alter table logs comment 'logs';

/*==============================================================*/
/* Table: manufactuer                                           */
/*==============================================================*/
create table manufactuer
(
   manufactuerid        varchar(32) not null,
   name_zhCN            varchar(255) not null,
   name_enUS            varchar(255) not null,
   address              varchar(255),
   phone                varchar(255),
   location             point,
   highlight_zhCN       varchar(255) default '',
   highlight_enUS       varchar(255) default '',
   timezone             varchar(255) default 'America/Los_Angeles',
   created_at           datetime not null,
   updated_at           datetime default NULL,
   deleted_at           datetime default NULL,
   primary key (manufactuerid)
);

/*==============================================================*/
/* Table: menusuppytime                                         */
/*==============================================================*/
create table menusuppytime
(
   menusupplytimeid     varchar(32) not null,
   timetype             int comment '0 all 1 area 2 week',
   week                 int,
   timefrom             datetime,
   timeto               datetime,
   primary key (menusupplytimeid)
);

alter table menusuppytime comment '菜单供应时间';

/*==============================================================*/
/* Table: orderdetail                                           */
/*==============================================================*/
create table orderdetail
(
   orderdetailid        varchar(32) not null,
   orderid              varchar(32),
   cartitemid           varchar(32),
   created_at           datetime not null,
   updated_at           datetime default NULL,
   primary key (orderdetailid)
);

alter table orderdetail comment '定单明细';

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   orderid              varchar(32) not null,
   customerid           varchar(32),
   status               int(10) not null,
   payment_method       int(10) not null,
   order_amount         int(11) not null,
   created_by           varchar(255) not null,
   created_at           datetime not null,
   estimated_delivery_time datetime,
   items_qty            int,
   price_after_tax      int,
   price_before_tax     int,
   discount             int,
   tips                 varchar(255),
   finnal_price         int,
   special_requests     varchar(255),
   primary key (orderid)
);

alter table orders comment 'orders';

/*==============================================================*/
/* Table: paymentinfo                                           */
/*==============================================================*/
create table paymentinfo
(
   paymentid            varchar(32) not null,
   customerid           varchar(32),
   cardnum              varchar(32),
   primary key (paymentid)
);

alter table paymentinfo comment '支付信息';

/*==============================================================*/
/* Table: resources                                             */
/*==============================================================*/
create table resources
(
   resourceid           varchar(32) not null,
   resourcename         varchar(32),
   addr                 varchar(32),
   parentid             varchar(32),
   isend                int,
   catagory             int,
   state                varchar(32),
   iconCls              varchar(32),
   sort                 int,
   primary key (resourceid)
);

alter table resources comment 'resources';

/*==============================================================*/
/* Table: shippingaddress                                       */
/*==============================================================*/
create table shippingaddress
(
   shippingaddressid    varchar(32) not null,
   shippingaddress      varchar(255),
   city                 varchar(32),
   state                varchar(32),
   zipcode              varchar(10),
   country              varchar(32),
   primary key (shippingaddressid)
);

alter table shippingaddress comment '配送地址';

/*==============================================================*/
/* Table: stores                                                */
/*==============================================================*/
create table stores
(
   storeid              varchar(32) not null,
   name_zhCN            varchar(255),
   name_enUS            varchar(255),
   address              varchar(255),
   phone                varchar(255),
   location             varchar(255),
   highlight_zhCN       varchar(255) default '',
   highlight_enUS       varchar(255) default '',
   timezone             varchar(255) default 'America/Los_Angeles',
   created_at           datetime,
   updated_at           datetime default NULL,
   deleted_at           datetime default NULL,
   primary key (storeid)
);

alter table stores comment 'stores';

/*==============================================================*/
/* Table: system_messages                                       */
/*==============================================================*/
create table system_messages
(
   systemmessageid      varchar(32) not null,
   type_msg             int(10) not null comment '发送类型',
   recv                 varchar(255) not null comment '接收者',
   content              varchar(255) not null comment '发送内容',
   result_msg           varchar(255) default NULL comment '发送结果',
   created_at           datetime not null,
   primary key (systemmessageid)
);

alter table system_messages comment 'system_messages';

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users
(
   userid               varchar(32) not null,
   email                varchar(50) not null,
   salt                 varchar(255) comment '手机验证时可为空',
   password             varchar(50) not null,
   realname             varchar(32),
   phone                varchar(32) default NULL,
   primary key (userid),
   unique key AK_Key_2 (email)
);

alter table users comment 'aminbackend用户';

alter table Menu add constraint FK_Reference_15 foreign key (storeid)
      references stores (storeid) on delete restrict on update restrict;

alter table Menu add constraint FK_Reference_40 foreign key (foodclassid)
      references foodclass (foodclassid) on delete restrict on update restrict;

alter table Menu add constraint FK_Reference_5 foreign key (menusupplytimeid)
      references menusuppytime (menusupplytimeid) on delete restrict on update restrict;

alter table cart add constraint FK_Reference_10 foreign key (customerid)
      references customers (customerid) on delete restrict on update restrict;

alter table cartitems add constraint FK_Reference_20 foreign key (cartid)
      references cart (cartid) on delete restrict on update restrict;

alter table cartitems add constraint FK_Reference_21 foreign key (foodid)
      references foods (foodid) on delete restrict on update restrict;

alter table cartitems add constraint FK_Reference_22 foreign key (menuid)
      references Menu (menuid) on delete restrict on update restrict;

alter table cartitems add constraint FK_Reference_23 foreign key (storeid)
      references stores (storeid) on delete restrict on update restrict;

alter table customers add constraint FK_Reference_1 foreign key (shippingaddressid)
      references shippingaddress (shippingaddressid) on delete restrict on update restrict;

alter table customers add constraint FK_Reference_2 foreign key (billingaddressid)
      references billingaddress (billingaddressid) on delete restrict on update restrict;

alter table deliveryarea add constraint FK_Reference_30 foreign key (storeid)
      references stores (storeid) on delete restrict on update restrict;

alter table deliveryareatime add constraint FK_Reference_33 foreign key (deliveryareaid)
      references deliveryarea (deliveryareaid) on delete restrict on update restrict;

alter table deliveryareatime add constraint FK_Reference_34 foreign key (deliverytimeid)
      references deliverytime (deliverytimeid) on delete restrict on update restrict;

alter table deliveryareatimefoods add constraint FK_Reference_35 foreign key (foodid)
      references foods (foodid) on delete restrict on update restrict;

alter table deliveryareatimefoods add constraint FK_Reference_36 foreign key (deliveryareatimeid)
      references deliveryareatime (deliveryareatimeid) on delete restrict on update restrict;

alter table deliveryareatimemenus add constraint FK_Reference_37 foreign key (menuid)
      references Menu (menuid) on delete restrict on update restrict;

alter table deliveryareatimemenus add constraint FK_Reference_38 foreign key (deliveryareatimeid)
      references deliveryareatime (deliveryareatimeid) on delete restrict on update restrict;

alter table deliverytime add constraint FK_Reference_31 foreign key (storeid)
      references stores (storeid) on delete restrict on update restrict;

alter table food_menu add constraint FK_Reference_18 foreign key (foodid)
      references foods (foodid) on delete restrict on update restrict;

alter table food_menu add constraint FK_Reference_19 foreign key (menuid)
      references Menu (menuid) on delete restrict on update restrict;

alter table foods add constraint FK_Reference_32 foreign key (storeid)
      references stores (storeid) on delete restrict on update restrict;

alter table foods add constraint FK_Reference_39 foreign key (foodclassid)
      references foodclass (foodclassid) on delete restrict on update restrict;

alter table foods add constraint FK_Reference_9 foreign key (manufactuerid)
      references manufactuer (manufactuerid) on delete restrict on update restrict;

alter table ingredient_food add constraint FK_Reference_16 foreign key (ingredientid)
      references ingredients (ingredientid) on delete restrict on update restrict;

alter table ingredient_food add constraint FK_Reference_17 foreign key (foodid)
      references foods (foodid) on delete restrict on update restrict;

alter table logs add constraint FK_Reference_27 foreign key (customerid)
      references customers (customerid) on delete restrict on update restrict;

alter table logs add constraint FK_Reference_28 foreign key (userid)
      references users (userid) on delete restrict on update restrict;

alter table orderdetail add constraint FK_Reference_24 foreign key (orderid)
      references orders (orderid) on delete restrict on update restrict;

alter table orderdetail add constraint FK_Reference_25 foreign key (cartitemid)
      references cartitems (cartitemid) on delete restrict on update restrict;

alter table orders add constraint FK_Reference_29 foreign key (customerid)
      references customers (customerid) on delete restrict on update restrict;

alter table paymentinfo add constraint FK_Reference_26 foreign key (customerid)
      references customers (customerid) on delete restrict on update restrict;

