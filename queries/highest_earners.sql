/* What are the top 5 highest earning countries? */

select country_of_nationality
      ,round(avg(ben_comp_paid), 0) as "average_compensation($)"
from all_registrations
group by 1
having avg(ben_comp_paid) is not null
order by 2 desc
limit 5;