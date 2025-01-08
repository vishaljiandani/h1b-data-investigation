/* How have selection rates been trending over the last 4 years? */

select lottery_year
        ,round(sum(case when status_type = 'SELECTED' then 1 else 0 end)/count(*) * 100, 2) as "selection_rate(%)"
from all_registrations
group by 1
order by 1;