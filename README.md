# e-commerce-db
Database schema for e-commerce (webstores) sites.

## Description

The diagram represents a generic base for web stores, and is the result of different projects.

The diagram was created using [Dia](http://dia-installer.de).

In order to make changes and re-generate the sql statements you could use
[parsediasql](https://metacpan.org/pod/distribution/Parse-Dia-SQL/bin/parsediasql) , and perl application easy to install and use.

`parsediasql --file ECommerceDB.dia --db postgres >> ecommercedb.sql`

## Diagram

![ECommerceDB.png](https://github.com/ramortegui/e-commerce-db/blob/master/ECommerceDB.png)
