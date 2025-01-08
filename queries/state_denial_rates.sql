/* Which US states have the highest denial rates? */
/* Note this is the state where the petitioner is headquartered in the US, not the worksite */

select state
      ,round(sum(case when first_decision = 'Denied' then 1 else 0 end)/count(*) * 100, 2) as "denial_rate(%)"
from all_registrations
where first_decision is not null
group by 1
order by 2 desc;