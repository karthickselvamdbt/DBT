select 
o.ORDERID,o.ORDERDATE,o.SHIPDATE,o.SHIPMODE,o.ORDERSELLINGPRICE,o.ORDERCOSTPRICE,(o.ORDERSELLINGPRICE-o.ORDERCOSTPRICE) as ORDERPROFIT ,
c.CUSTOMERNAME,c.SEGMENT,c.COUNTRY,
p.CATEGORY,p.PRODUCTNAME,p.SUBCATEGORY
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.CUSTOMERID = c.CUSTOMERID
left join {{ ref('raw_product') }} as p
on o.PRODUCTID = p.PRODUCTID