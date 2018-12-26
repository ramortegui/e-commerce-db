<html><head>
<title>Database documentation: ECommerceDB.dia</title>
<!-- Parse::SQL::Dia version 0.30                                                             
Documentation   http://search.cpan.org/dist/Parse-Dia-SQL/                               
Environment     Perl 5.028001, /home/ramortegui/perl5/perlbrew/perls/perl-5.28.1/bin/perl
Architecture    x86_64-linux                                                             
Target Database html                                                                     
Input file      ECommerceDB.dia                                                          
Generated at    Tue Dec 25 22:21:44 2018                                                 
 -->
</head><body>
<h1>Data Dictionary for ECommerceDB.dia</h1>
<h2>List of Tables</h2>
<a href='#categories'>categories</a>, <a href='#cc_transactions'>cc_transactions</a>, <a href='#coupons'>coupons</a>, <a href='#order_products'>order_products</a>, <a href='#product_categories'>product_categories</a>, <a href='#product_statuses'>product_statuses</a>, <a href='#product_tags'>product_tags</a>, <a href='#products'>products</a>, <a href='#roles'>roles</a>, <a href='#sales_orders'>sales_orders</a>, <a href='#sessions'>sessions</a>, <a href='#tags'>tags</a>, <a href='#user_roles'>user_roles</a>, <a href='#users'>users</a>
<hr width='80%'/>

<h2>Table details</h2>
<h3>Table: <a name='categories'>categories</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>id</b></td><td>serial</td><td>not null</td><td>&nbsp;</td></tr><tr><td>name</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>parent_id</td><td>integer</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='cc_transactions'>cc_transactions</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>id</b></td><td>serial</td><td>not null</td><td>&nbsp;</td></tr><tr><td>code</td><td>varchar(255)</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>order_id</td><td>integer</td><td>not null</td><td>&nbsp;</td></tr><tr><td>transdate</td><td>timestamp with time zone</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>processor</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>processor_trans_id</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>amount</td><td>numeric</td><td>not null</td><td>&nbsp;</td></tr><tr><td>cc_num</td><td>varchar(255)</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>cc_type</td><td>varchar(255)</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>response</td><td>text</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='coupons'>coupons</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>id</b></td><td>serial</td><td>not null</td><td>&nbsp;</td></tr><tr><td>code</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>description</td><td>text</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>active</td><td>bool</td><td>true</td><td>&nbsp;</td></tr><tr><td>value</td><td>numeric</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>multiple</td><td>bool</td><td>false</td><td>&nbsp;</td></tr><tr><td>start_date</td><td>timestamp with time zone</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>end_date</td><td>timestamp with time zone</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='order_products'>order_products</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>id</b></td><td>serial</td><td>not null</td><td>&nbsp;</td></tr><tr><td>order_id</td><td>integer</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>sku</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>name</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>description</td><td>text</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>price</td><td>numeric</td><td>not null</td><td>&nbsp;</td></tr><tr><td>quantity</td><td>integer</td><td>not null</td><td>&nbsp;</td></tr><tr><td>subtotal</td><td>numeric</td><td>not null</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='product_categories'>product_categories</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>category_id</b></td><td>integer</td><td>not null</td><td>&nbsp;</td></tr><tr><td><b>product_id</b></td><td>integer</td><td>not null</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='product_statuses'>product_statuses</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>id</b></td><td>serial</td><td>not null</td><td>&nbsp;</td></tr><tr><td>name</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='product_tags'>product_tags</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>product_id</b></td><td>integer</td><td>not null</td><td>&nbsp;</td></tr><tr><td><b>tag_id</b></td><td>integer</td><td>not null</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='products'>products</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>id</b></td><td>serial</td><td>not null</td><td>&nbsp;</td></tr><tr><td>sku</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>name</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>description</td><td>text</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>product_status_id</td><td>integer</td><td>not null</td><td>&nbsp;</td></tr><tr><td>regular_price</td><td>numeric</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>discount_price</td><td>numeric</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>quantity</td><td>integer</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>taxable</td><td>bool</td><td>false</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='roles'>roles</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>id</b></td><td>serial</td><td>not null</td><td>&nbsp;</td></tr><tr><td>name</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='sales_orders'>sales_orders</a></h3>

<p>References: <a href='#sessions'>sessions</a></p>

<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>id</b></td><td>serial</td><td>not null</td><td>&nbsp;</td></tr><tr><td>order_date</td><td>date</td><td>not null</td><td>&nbsp;</td></tr><tr><td>total</td><td>numeric</td><td>not null</td><td>&nbsp;</td></tr><tr><td>coupon_id</td><td>integer</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>session_id</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>user_id</td><td>integer</td><td>not null</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='sessions'>sessions</a></h3>


<p>Referenced by: <a href='#sales_orders'>sales_orders</a></p>
<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>id</b></td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>data</td><td>text</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='tags'>tags</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>id</b></td><td>serial</td><td>not null</td><td>&nbsp;</td></tr><tr><td>name</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='user_roles'>user_roles</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>user_id</b></td><td>integer</td><td>not null</td><td>&nbsp;</td></tr><tr><td><b>role_id</b></td><td>integer</td><td>not null</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<h3>Table: <a name='users'>users</a></h3>



<table border='1' cellspacing='0' cellpadding='1'>
<tr><td>Field</td><td>Type</td><td>Default</td><td>Description</td></tr>
<tr><td><b>id</b></td><td>serial</td><td>not null</td><td>&nbsp;</td></tr><tr><td>email</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>first_name</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>last_name</td><td>varchar(255)</td><td>not null</td><td>&nbsp;</td></tr><tr><td>active</td><td>bool</td><td>true</td><td>&nbsp;</td></tr><tr><td>inserted_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr><tr><td>updated_at</td><td>timestamp with time zone</td><td>not null</td><td>&nbsp;</td></tr>
</table>



<hr width='80%'/>
<p style="font-size:75%">Generated at Tue Dec 25 22:21:44 2018.</p></body></html>