/* What is the selection rate by age group? */

with cte as (
select
    case 
        when ((lottery_year - 1) - ben_year_of_birth) BETWEEN 21 AND 25 THEN '21-25'
        when ((lottery_year - 1) - ben_year_of_birth) BETWEEN 26 AND 30 THEN '26-30'
        when ((lottery_year - 1) - ben_year_of_birth) BETWEEN 31 AND 35 THEN '31-35'
        when ((lottery_year - 1) - ben_year_of_birth) BETWEEN 36 AND 40 THEN '36-40'
        else 'Remaining'
        end as age_group,
        sum(case when status_type = 'SELECTED' then 1 else 0 end) AS selected_count
    from all_registrations
    group by 1
    )

select age_group
      ,round((selected_count)/(select count(*) from all_registrations where status_type = 'SELECTED') * 100, 2) as selection_rate
from cte
order by selection_rate desc;