-- Parse::SQL::Dia     version 0.27                                                             
-- Documentation       http://search.cpan.org/dist/Parse-Dia-SQL/                               
-- Environment         Perl 5.024000, /home/ramortegui/perl5/perlbrew/perls/perl-5.24.0/bin/perl
-- Architecture        x86_64-linux                                                             
-- Target Database     sqlite3                                                                  
-- Input file          ECommerceDB.dia                                                          
-- Generated at        Sat Apr 14 20:28:47 2018                                                 
-- Typemap for sqlite3 not found in input file                                                  

-- get_constraints_drop 
drop trigger if exists fk_producs_product_tags_bi_tr;
drop trigger if exists fk_producs_product_tags_bu_tr;
drop trigger if exists fk_producs_product_tags_buparent_tr;
drop trigger if exists fk_producs_product_tags_bdparent_tr;

drop trigger if exists fk_session_sales_order_bi_tr;
drop trigger if exists fk_session_sales_order_bu_tr;
drop trigger if exists fk_session_sales_order_buparent_tr;
drop trigger if exists fk_session_sales_order_bdparent_tr;

drop trigger if exists fk_product_product_category_bi_tr;
drop trigger if exists fk_product_product_category_bu_tr;
drop trigger if exists fk_product_product_category_buparent_tr;
drop trigger if exists fk_product_product_category_bdparent_tr;


-- get_permissions_drop 

-- get_view_drop

-- get_schema_drop
drop table if exists users;
drop table if exists roles;
drop table if exists user_roles;
drop table if exists categories;
drop table if exists products;
drop table if exists tags;
drop table if exists sales_orders;
drop table if exists coupons;
drop table if exists product_tags;
drop table if exists cc_transactions;
drop table if exists sessions;
drop table if exists product_statuses;
drop table if exists product_categories;
drop table if exists order_products;

-- get_smallpackage_pre_sql 

-- get_schema_create

create table users (
   id         serial                   not null                  ,
   username   varchar(255) unique                                ,
   first_name varchar(255)                                       ,
   last_name  varchar(255)                                       ,
   active     bool                                               ,
   created_at timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_users primary key (id)
)   ;

create table roles (
   id         serial                   not null                  ,
   name       varchar(255)                                       ,
   created_at timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_roles primary key (id)
)   ;

create table user_roles (
   user_id    integer                  not null                  ,
   role_id    integer                  not null                  ,
   created_at timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_user_roles primary key (user_id,role_id)
)   ;

create table categories (
   id         serial                   not null                  ,
   name       varchar(255)                                       ,
   created_at timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_categories primary key (id)
)   ;

create table products (
   sku               varchar(255)             not null                  ,
   name              varchar(255)                                       ,
   description       text                                               ,
   product_status_id integer                                            ,
   regular_price     numeric                                            ,
   discount_price    numeric                                            ,
   category_id       integer                                            ,
   quantity          integer                                            ,
   taxable           bool                                               ,
   created_at        timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at        timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_products primary key (sku)
)   ;

create table tags (
   id         serial                   not null                  ,
   name       varchar(255)                                       ,
   created_at timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_tags primary key (id)
)   ;

create table sales_orders (
   id         serial                   not null                  ,
   order_date date                                               ,
   total      numeric                                            ,
   coupon_id  integer                                            ,
   session_id varchar(255)                                       ,
   user_id    integer                                            ,
   created_at timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_sales_orders primary key (id)
)   ;

create table coupons (
   id          serial                   not null                  ,
   code        varchar(255)                                       ,
   description text                                               ,
   active      bool                                               ,
   value       numeric                                            ,
   start_date  timestamp with time zone                           ,
   end_date    timestamp with time zone                           ,
   multiple    bool                      default false            ,
   created_at  timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at  timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_coupons primary key (id)
)   ;

create table product_tags (
   product_sku varchar(255)             not null                  ,
   tag_id      integer                  not null                  ,
   created_at  timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at  timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_product_tags primary key (product_sku,tag_id)
)   ;

create table cc_transactions (
   code               varchar(255)             not null                  ,
   order_id           integer                                            ,
   transdate          timestamp with time zone                           ,
   processor          varchar(255)                                       ,
   processor_trans_id varchar(255)                                       ,
   amount             numeric                                            ,
   cc_num             varchar(255)                                       ,
   cc_type            varchar(255)                                       ,
   response           text                                               ,
   created_at         timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at         timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_cc_transactions primary key (code)
)   ;

create table sessions (
   id         varchar(255)             not null                  ,
   data       text                                               ,
   created_at timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_sessions primary key (id)
)   ;

create table product_statuses (
   id         serial                   not null                  ,
   name       varchar(255)                                       ,
   created_at timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_product_statuses primary key (id)
)   ;

create table product_categories (
   category_id integer                  not null                  ,
   product_sku varchar(255)             not null                  ,
   created_at  timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at  timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_product_categories primary key (category_id,product_sku)
)   ;

create table order_products (
   sku         varchar(255)             not null                  ,
   order_id    integer                  not null                  ,
   name        varchar(255)                                       ,
   description text                                               ,
   price       numeric                                            ,
   quantity    integer                                            ,
   subtotal    numeric                                            ,
   created_at  timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at  timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_order_products primary key (sku,order_id)
)   ;

-- get_view_create

-- get_permissions_create

-- get_inserts

-- get_smallpackage_post_sql

-- get_associations_create
create trigger fk_producs_product_tags_bi_tr before insert on product_tags for each row begin select raise(abort, 'insert on table product_tags violates foreign key constraint fk_producs_product_tags') where new.product_sku is not null and (select sku from products where sku=new.product_sku) is null;end;
create trigger fk_producs_product_tags_bu_tr before update on product_tags for each row begin select raise(abort, 'update on table product_tags violates foreign key constraint fk_producs_product_tags') where new.product_sku is not null and (select sku from products where sku=new.product_sku) is null;end;
create trigger fk_producs_product_tags_bdparent_tr before delete on products for each row begin select raise(abort, 'delete on table products violates foreign key constraint fk_producs_product_tags on product_tags') where (select product_sku from product_tags where product_sku=old.sku) is not null;end;
create trigger fk_producs_product_tags_buparent_tr before update on products for each row when new.sku <> old.sku begin select raise(abort, 'update on table products violates foreign key constraint fk_producs_product_tags on product_tags') where (select product_sku from product_tags where product_sku=old.sku) is not null;end;

create trigger fk_session_sales_order_bi_tr before insert on sales_orders for each row begin select raise(abort, 'insert on table sales_orders violates foreign key constraint fk_session_sales_order') where new.session_id is not null and (select id from sessions where id=new.session_id) is null;end;
create trigger fk_session_sales_order_bu_tr before update on sales_orders for each row begin select raise(abort, 'update on table sales_orders violates foreign key constraint fk_session_sales_order') where new.session_id is not null and (select id from sessions where id=new.session_id) is null;end;
create trigger fk_session_sales_order_bdparent_tr before delete on sessions for each row begin select raise(abort, 'delete on table sessions violates foreign key constraint fk_session_sales_order on sales_orders') where (select session_id from sales_orders where session_id=old.id) is not null;end;
create trigger fk_session_sales_order_buparent_tr before update on sessions for each row when new.id <> old.id begin select raise(abort, 'update on table sessions violates foreign key constraint fk_session_sales_order on sales_orders') where (select session_id from sales_orders where session_id=old.id) is not null;end;

create trigger fk_product_product_category_bi_tr before insert on product_categories for each row begin select raise(abort, 'insert on table product_categories violates foreign key constraint fk_product_product_category') where new.product_sku is not null and (select sku from products where sku=new.product_sku) is null;end;
create trigger fk_product_product_category_bu_tr before update on product_categories for each row begin select raise(abort, 'update on table product_categories violates foreign key constraint fk_product_product_category') where new.product_sku is not null and (select sku from products where sku=new.product_sku) is null;end;
create trigger fk_product_product_category_bdparent_tr before delete on products for each row begin select raise(abort, 'delete on table products violates foreign key constraint fk_product_product_category on product_categories') where (select product_sku from product_categories where product_sku=old.sku) is not null;end;
create trigger fk_product_product_category_buparent_tr before update on products for each row when new.sku <> old.sku begin select raise(abort, 'update on table products violates foreign key constraint fk_product_product_category on product_categories') where (select product_sku from product_categories where product_sku=old.sku) is not null;end;

