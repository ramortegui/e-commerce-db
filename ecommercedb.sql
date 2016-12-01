-- Parse::SQL::Dia      version 0.27                                                             
-- Documentation        http://search.cpan.org/dist/Parse-Dia-SQL/                               
-- Environment          Perl 5.024000, /home/ramortegui/perl5/perlbrew/perls/perl-5.24.0/bin/perl
-- Architecture         x86_64-linux                                                             
-- Target Database      postgres                                                                 
-- Input file           ECommerceDB.dia                                                          
-- Generated at         Wed Nov 30 21:47:10 2016                                                 
-- Typemap for postgres not found in input file                                                  

-- get_constraints_drop 
alter table Sales_Order drop constraint fk_coupon_id_order ;
alter table Product_Tag drop constraint fk_produc_product_tag ;
alter table Product_Tag drop constraint fk_tag_product_tag ;
alter table Ec_User_Role drop constraint fk_role_id_ec_user_role ;
alter table Ec_User_Role drop constraint fk_ec_user_ec_user_role ;
alter table Product_Category drop constraint fk_category_product_category ;
alter table Sales_Order drop constraint fk_timeframe_sales_order ;
alter table Sales_Order drop constraint fk_user_sales_order ;
alter table Sales_Order drop constraint fk_session_sales_order ;
alter table Product drop constraint fk_product_status_product ;
alter table Order_Product drop constraint fk_order_order_product ;
alter table CC_Transaction drop constraint fk_order_cc_transaction ;
alter table Product_Category drop constraint fk_product_product_category ;

-- get_permissions_drop 

-- get_view_drop

-- get_schema_drop
drop table Ec_User;
drop table Role;
drop table Ec_User_Role;
drop table Timeframe;
drop table Category;
drop table Product;
drop table Tag;
drop table Sales_Order;
drop table Coupon;
drop table Product_Tag;
drop table CC_Transaction;
drop table Session;
drop table Product_Status;
drop table Product_Category;
drop table Order_Product;

-- get_smallpackage_pre_sql 

-- get_schema_create
create table Ec_User (
   id         serial                   not null,
   username   varchar(255) unique              ,
   first_name varchar(255)                     ,
   last_name  varchar(255)                     ,
   active     bool                             ,
   created_at timestamp with time zone         ,
   updated_at timestamp with time zone         ,
   constraint pk_Ec_User primary key (id)
)   ;
create table Role (
   id         serial                   not null,
   name       varchar(255)                     ,
   created_at timestamp with time zone         ,
   updated_at timestamp with time zone         ,
   constraint pk_Role primary key (id)
)   ;
create table Ec_User_Role (
   user_id    integer                  not null,
   role_id    integer                  not null,
   created_at timestamp with time zone         ,
   updated_at timestamp with time zone         ,
   constraint pk_Ec_User_Role primary key (user_id,role_id)
)   ;
create table Timeframe (
   id         serial                   not null,
   start_time time with time zone              ,
   end_time   time with time zone              ,
   created_at timestamp with time zone         ,
   updated_at timestamp with time zone         ,
   constraint pk_Timeframe primary key (id)
)   ;
create table Category (
   id         serial                   not null,
   name       varchar(255)                     ,
   created_at timestamp with time zone         ,
   updated_at timestamp with time zone         ,
   constraint pk_Category primary key (id)
)   ;
create table Product (
   sku               varchar(255)             not null,
   name              varchar(255)                     ,
   description       text                             ,
   product_status_id integer                          ,
   regular_price     numeric                          ,
   discount_price    numeric                          ,
   category_id       integer                          ,
   quantity          integer                          ,
   taxable           bool                             ,
   created_at        timestamp with time zone         ,
   updated_at        timestamp with time zone         ,
   constraint pk_Product primary key (sku)
)   ;
create table Tag (
   id         serial                   not null,
   name       varchar(255)                     ,
   created_at timestamp with time zone         ,
   updated_at timestamp with time zone         ,
   constraint pk_Tag primary key (id)
)   ;
create table Sales_Order (
   id           serial                   not null,
   order_date   date                             ,
   total        numeric                          ,
   coupon_id    integer                          ,
   session_id   varchar(255)                     ,
   user_id      integer                          ,
   timeframe_id integer                          ,
   created_at   timestamp with time zone         ,
   updated_at   timestamp with time zone         ,
   constraint pk_Sales_Order primary key (id)
)   ;
create table Coupon (
   id          serial                   not null      ,
   code        varchar(255)                           ,
   description text                                   ,
   active      bool                                   ,
   value       numeric                                ,
   start_date  timestamp with time zone               ,
   end_date    timestamp with time zone               ,
   multiple    bool                      default false,
   created_at  timestamp with time zone               ,
   updated_at  timestamp with time zone               ,
   constraint pk_Coupon primary key (id)
)   ;
create table Product_Tag (
   product_sku varchar(255)             not null,
   tag_id      integer                  not null,
   created_at  timestamp with time zone         ,
   updated_at  timestamp with time zone         ,
   constraint pk_Product_Tag primary key (product_sku,tag_id)
)   ;
create table CC_Transaction (
   code               varchar(255)             not null,
   order_id           integer                          ,
   transdate          timestamp with time zone         ,
   processor          varchar(255)                     ,
   processor_trans_id varchar(255)                     ,
   amount             numeric                          ,
   cc_num             varchar(255)                     ,
   cc_type            varchar(255)                     ,
   cc_exp             varchar(255)                     ,
   response           text                             ,
   created_at         timestamp with time zone         ,
   updated_at         timestamp with time zone         ,
   constraint pk_CC_Transaction primary key (code)
)   ;
create table Session (
   id         varchar(255)             not null,
   data       text                             ,
   created_at timestamp with time zone         ,
   updated_at timestamp with time zone         ,
   constraint pk_Session primary key (id)
)   ;
create table Product_Status (
   id         serial                   not null,
   name       varchar(255)                     ,
   created_at timestamp with time zone         ,
   updated_at timestamp with time zone         ,
   constraint pk_Product_Status primary key (id)
)   ;
create table Product_Category (
   category_id integer                  not null,
   product_sku varchar(255)             not null,
   created_at  timestamp with time zone         ,
   updated_at  timestamp with time zone         ,
   constraint pk_Product_Category primary key (category_id,product_sku)
)   ;
create table Order_Product (
   sku         varchar(255)             not null,
   order_id    integer                  not null,
   name        varchar(255)                     ,
   description text                             ,
   price       numeric                          ,
   quantity    integer                          ,
   subtotal    numeric                          ,
   created_at  timestamp with time zone         ,
   updated_at  timestamp with time zone         ,
   constraint pk_Order_Product primary key (sku,order_id)
)   ;

-- get_view_create

-- get_permissions_create

-- get_inserts

-- get_smallpackage_post_sql

-- get_associations_create
alter table Sales_Order add constraint fk_coupon_id_order 
    foreign key (coupon_id)
    references Coupon (id) ;
alter table Product_Tag add constraint fk_produc_product_tag 
    foreign key (product_sku)
    references Product (sku) ;
alter table Product_Tag add constraint fk_tag_product_tag 
    foreign key (tag_id)
    references Tag (id) ;
alter table Ec_User_Role add constraint fk_role_id_ec_user_role 
    foreign key (role_id)
    references Role (id) ;
alter table Ec_User_Role add constraint fk_ec_user_ec_user_role 
    foreign key (user_id)
    references Ec_User (id) ;
alter table Product_Category add constraint fk_category_product_category 
    foreign key (category_id)
    references Category (id) ;
alter table Sales_Order add constraint fk_timeframe_sales_order 
    foreign key (timeframe_id)
    references Timeframe (id) ;
alter table Sales_Order add constraint fk_user_sales_order 
    foreign key (user_id)
    references Ec_User (id) ;
alter table Sales_Order add constraint fk_session_sales_order 
    foreign key (session_id)
    references Session (id) ;
alter table Product add constraint fk_product_status_product 
    foreign key (product_status_id)
    references Product_Status (id) ;
alter table Order_Product add constraint fk_order_order_product 
    foreign key (order_id)
    references Sales_Order (id) ;
alter table CC_Transaction add constraint fk_order_cc_transaction 
    foreign key (order_id)
    references Sales_Order (id) ;
alter table Product_Category add constraint fk_product_product_category 
    foreign key (product_sku)
    references Product (sku) ;
