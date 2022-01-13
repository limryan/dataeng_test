/* I want to know the list of our customers and their spending. */
select C.name, sum(price) as spending
from Customers C, Cars, Transactions T
where T.cid = C.cid
and Cars.serial_number = T.serial_number
group by C.cid
order by C.cid;

/* I want to find out the top 3 car manufacturers that customers bought by sales (quantity) 
and the sales number for it in the current month. */
select manufacturer, count(T.tid) as sales
from Cars, Transactions T
where Cars.serial_number = T.serial_number
and extract (month FROM sale_date) = extract (month FROM CURRENT_DATE)
group by manufacturer
order by count(T.tid) desc
limit 3;
