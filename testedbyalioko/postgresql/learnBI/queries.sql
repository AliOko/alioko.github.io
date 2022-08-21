--Based on https://learnbi.online/pizzaproject

/*
Dashboard 1 - Order activity
For this, we will need a dashboard with the following data:
1. Total orders
2. Total sales
3. Total items
4. Average order value
5. Sales by category
6. Top selling items
7. Orders by hour
8. Sales by hour
9. Orders by address
10. Orders by delivery/pick up
*/

select
	o.order_id,
	i.item_price,
	o.quantity,
	i.item_cat,
	i.item_name,
	o.created_at,
	a.delivery_address1,
	a.delivery_address2,
	a.delivery_city,
	a.delivery_zipcode,
	o.delivery
from
	orders o
left join item i on
	o.item_id = i.item_id
left join address a on
	o.add_id = a.add_id ;


/*
Dashboard 2 - Inventory Management
This will be a lot more complicated than the orders. Mainly because we need to calculate
how much inventory we're using and then identify inventory that needs reordering.
We also want to calculate how much each pizza costs to make based on the cost of the
ingredients so we can keep an eye on pricing and P/L.
Here is what we need:
1. Total quantity by ingredient
2. Total cost of ingredients
3. Calculated cost of pizza
4. Percentage stock remaining by ingredient
*/

CREATE OR REPLACE VIEW learn_bi_pizza.stock1
AS SELECT s1.item_name,
    s1.ing_id,
    s1.ing_name,
    s1.ing_weight,
    s1.ing_price,
    s1.order_quantity,
    s1.recipe_quantity,
    s1.order_quantity * s1.recipe_quantity AS ordered_weight,
    s1.ing_price / s1.ing_weight::numeric AS unit_cost,
    (s1.order_quantity * s1.recipe_quantity)::numeric * (s1.ing_price / s1.ing_weight::numeric) AS ingridient_cost
   FROM ( SELECT o.item_id,
            i.sku,
            i.item_name,
            r.ing_id,
            ing.ing_name,
            r.quantity AS recipe_quantity,
            sum(o.quantity) AS order_quantity,
            ing.ing_weight,
            ing.ing_price
           FROM learn_bi_pizza.orders o
             LEFT JOIN learn_bi_pizza.item i ON o.item_id::text = i.item_id::text
             LEFT JOIN learn_bi_pizza.recipe r ON i.sku::text = r.recipe_id::text
             LEFT JOIN learn_bi_pizza.ingredient ing ON ing.ing_id::text = r.ing_id::text
          GROUP BY o.item_id, i.sku, i.item_name, r.ing_id, ing.ing_name, r.quantity, ing.ing_weight, ing.ing_price) s1;
          
select
	s2.ing_name,
	s2.ordered_weight,
	ing.ing_weight * inv.quantity as total_inv_weight,
	(ing.ing_weight * inv.quantity)-s2.ordered_weight as remaining_weight
from
	(
	select
		ing_name ,
		ing_id ,
		sum(ordered_weight) as ordered_weight
	from
		stock1 s
	group by
		1,
		2) s2
left join inventory inv on
	inv.item_id = s2.ing_id
left join ingredient ing on
	ing.ing_id = s2.ing_id;
  
select
	r."date" ,
	s.first_name,
	s.last_name,
	s.hourly_rate,
	sh.start_time,
	sh.end_time,
	extract(epoch from (sh.end_time-sh.start_time))/ 3600 as hours_in_shift,
	(extract(epoch from (sh.end_time-sh.start_time))/ 3600)*s.hourly_rate as staff_cost
from
	rota r
left join staff s on
	r.staff_id = s.staff_id
left join shift sh on
	r.shift_id = sh.shift_id ;

select
	(sh.end_time-sh.start_time) as time_diff,
	extract (hour from 	(sh.end_time-sh.start_time)) + extract (minute from	(sh.end_time-sh.start_time))/ 60 as hours_in_shift,
	extract(epoch from 	(sh.end_time-sh.start_time))/ 3600 as hours_in_shift_short_ver
from
	shift sh;
