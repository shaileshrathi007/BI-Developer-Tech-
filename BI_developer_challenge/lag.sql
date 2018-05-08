select 
    a.id
   ,b.subsubcategory
   ,c.country
   ,count((a.id - LAG(a.id,1) OVER (ORDER BY a.create))/LAG(a.id,1) OVER (ORDER BY a.create)) as "MoM"
   ,count((a.id - LAG(a.id,12) OVER (ORDER BY a.create))/LAG(a.id,12) OVER (ORDER BY a.create)) as "YoY"
 from ads a inner join category b
on a.category_id = b.id
and b.subsubcategory = 'Beef Cattle'
inner join region c
on a.region_id = c.id
and c.country = 'Tipperary'
and DATE_TRUNC('year,'a.create) between '2016' AND '2017'
group by a.id
   ,b.subsubcategory
   ,c.country
