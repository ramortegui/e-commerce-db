-- Parse::SQL::Dia          version 0.30                                                             
-- Documentation            http://search.cpan.org/dist/Parse-Dia-SQL/                               
-- Environment              Perl 5.028001, /home/ramortegui/perl5/perlbrew/perls/perl-5.28.1/bin/perl
-- Architecture             x86_64-linux                                                             
-- Target Database          mysql-innodb                                                             
-- Input file               ECommerceDB.dia                                                          
-- Generated at             Tue Dec 25 22:21:44 2018                                                 
-- Typemap for mysql-innodb not found in input file                                                  

-- get_constraints_drop 
alter table sales_orders drop foreign key fk_session_sales_order ;

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
   id          serial                   not null     ,
   email       varchar(255)             not null     ,
   first_name  varchar(255)             not null     ,
   last_name   varchar(255)             not null     ,
   active      bool                      default true,
   inserted_at timestamp with time zone not null     ,
   updated_at  timestamp with time zone not null     ,
   constraint pk_users primary key (id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table roles (
   id          serial                   not null,
   name        varchar(255)             not null,
   inserted_at timestamp with time zone not null,
   updated_at  timestamp with time zone not null,
   constraint pk_roles primary key (id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table user_roles (
   user_id     integer                  not null,
   role_id     integer                  not null,
   inserted_at timestamp with time zone not null,
   updated_at  timestamp with time zone not null,
   constraint pk_user_roles primary key (user_id,role_id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table categories (
   id          serial                   not null,
   name        varchar(255)             not null,
   parent_id   integer                          ,
   inserted_at timestamp with time zone not null,
   updated_at  timestamp with time zone not null,
   constraint pk_categories primary key (id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table products (
   id                serial                   not null      ,
   sku               varchar(255)             not null      ,
   name              varchar(255)             not null      ,
   description       text                                   ,
   product_status_id integer                  not null      ,
   regular_price     numeric                   default 0    ,
   discount_price    numeric                   default 0    ,
   quantity          integer                   default 0    ,
   taxable           bool                      default false,
   inserted_at       timestamp with time zone not null      ,
   updated_at        timestamp with time zone not null      ,
   constraint pk_products primary key (id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table tags (
   id          serial                   not null,
   name        varchar(255)             not null,
   inserted_at timestamp with time zone not null,
   updated_at  timestamp with time zone not null,
   constraint pk_tags primary key (id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table sales_orders (
   id          serial                   not null,
   order_date  date                     not null,
   total       numeric                  not null,
   coupon_id   integer                          ,
   session_id  varchar(255)             not null,
   user_id     integer                  not null,
   inserted_at timestamp with time zone not null,
   updated_at  timestamp with time zone not null,
   constraint pk_sales_orders primary key (id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table coupons (
   id          serial                   not null      ,
   code        varchar(255)             not null      ,
   description text                                   ,
   active      bool                      default true ,
   value       numeric                                ,
   multiple    bool                      default false,
   start_date  timestamp with time zone               ,
   end_date    timestamp with time zone               ,
   inserted_at timestamp with time zone not null      ,
   updated_at  timestamp with time zone not null      ,
   constraint pk_coupons primary key (id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table product_tags (
   product_id  integer                  not null,
   tag_id      integer                  not null,
   inserted_at timestamp with time zone not null,
   updated_at  timestamp with time zone not null,
   constraint pk_product_tags primary key (product_id,tag_id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table cc_transactions (
   id                 serial                   not null,
   code               varchar(255)                     ,
   order_id           integer                  not null,
   transdate          timestamp with time zone         ,
   processor          varchar(255)             not null,
   processor_trans_id varchar(255)             not null,
   amount             numeric                  not null,
   cc_num             varchar(255)                     ,
   cc_type            varchar(255)                     ,
   response           text                             ,
   inserted_at        timestamp with time zone not null,
   updated_at         timestamp with time zone not null,
   constraint pk_cc_transactions primary key (id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table sessions (
   id          varchar(255)             not null,
   data        text                             ,
   inserted_at timestamp with time zone not null,
   updated_at  timestamp with time zone not null,
   constraint pk_sessions primary key (id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table product_statuses (
   id          serial                   not null,
   name        varchar(255)             not null,
   inserted_at timestamp with time zone not null,
   updated_at  timestamp with time zone not null,
   constraint pk_product_statuses primary key (id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table product_categories (
   category_id integer                  not null,
   product_id  integer                  not null,
   inserted_at timestamp with time zone not null,
   updated_at  timestamp with time zone not null,
   constraint pk_product_categories primary key (category_id,product_id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;
create table order_products (
   id          serial                   not null,
   order_id    integer                          ,
   sku         varchar(255)             not null,
   name        varchar(255)             not null,
   description text                             ,
   price       numeric                  not null,
   quantity    integer                  not null,
   subtotal    numeric                  not null,
   inserted_at timestamp with time zone not null,
   updated_at  timestamp with time zone not null,
   constraint pk_order_products primary key (id)
)   ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- get_view_create

-- get_permissions_create

-- get_inserts

-- get_smallpackage_post_sql

-- get_associations_create
alter table sales_orders add constraint fk_session_sales_order 
    foreign key (session_id)
    references sessions (id) ;
