select t::timestamp,count(a.publish)'publish' from generate_series(
'2018-01-01'::Timestamp,
'2018-12-31'::Timestamp,
'1 day' :: interval
) t left join ads a ON t.timestamp = a.publish AT TIME ZONE 'GMT'
and to_date(a.publish,'YYYY-MM-DD') > to_date(a.delete,'YYYY-MM-DD') 
group by publish;
