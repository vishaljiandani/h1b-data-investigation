/* How have denial rates been trending over the years? */

select lottery_year
        ,round(sum(case when first_decision = 'Denied' then 1 else 0 end)/count(*) * 100, 2) as "denial_rate(%)"
from all_registrations
where first_decision is not null
group by 1
order by 1;