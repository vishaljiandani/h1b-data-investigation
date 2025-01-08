/* What is the average time that USCIS has been taking to make a decision on petitions each year? */
/* Note that this data doesn't contain information on who applied/upgraded to premium
processing in order to get a decision faster. So I'm making an assumption here that roughly
the same percentage of beneficiaries paid the extra dough each year */

select lottery_year
    ,round(avg(first_decision_date - rec_date), 0) as "average_decision_time (days)"
from all_registrations
group by 1
order by 1;