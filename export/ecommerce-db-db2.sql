-- Parse::SQL::Dia version 0.30                                                              
-- Documentation   http://search.cpan.org/dist/Parse-Dia-SQL/                                
-- Environment     Perl 5.026001, /Users/ramortegui/perl5/perlbrew/perls/perl-5.26.1/bin/perl
-- Architecture    darwin-2level                                                             
-- Target Database db2                                                                       
-- Input file      ECommerceDB.dia                                                           
-- Generated at    Thu May 17 22:05:24 2018                                                  
-- Typemap for db2 not found in input file                                                   

-- get_constraints_drop 
alter table product_tags drop constraint fk_prdcs_prdct_tgs ;
alter table sales_orders drop constraint fk_sn_sls_rdr ;
alter table product_categories drop constraint toS0xntIC_B5OJUBWs ;

-- get_permissions_drop 

-- get_view_drop

-- get_schema_drop
drop table users;
drop table roles;
drop table user_roles;
drop table categories;
drop table products;
drop table tags;
drop table sales_orders;
drop table coupons;
drop table product_tags;
drop table cc_transactions;
drop table sessions;
drop table product_statuses;
drop table product_categories;
drop table order_products;

-- get_smallpackage_pre_sql 

-- get_schema_create
create table users (
   id         serial                   not null                  ,
   email      varchar(255) unique                                ,
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
   constraint pk_cc_tranactions primary key (code)
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
   constraint pk_producttatuses primary key (id)
)   ;
create table product_categories (
   category_id integer                  not null                  ,
   product_sku varchar(255)             not null                  ,
   created_at  timestamp with time zone  default CURRENT_TIMESTAMP,
   updated_at  timestamp with time zone  default CURRENT_TIMESTAMP,
   constraint pk_productegories primary key (category_id,product_sku)
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
alter table product_tags add constraint fk_prdcs_prdct_tgs 
    foreign key (product_sku)
    references products (sku) ;
alter table sales_orders add constraint fk_sn_sls_rdr 
    foreign key (session_id)
    references sessions (id) ;
alter table product_categories add constraint toS0xntIC_B5OJUBWs 
    foreign key (product_sku)
    references products (sku) ;
