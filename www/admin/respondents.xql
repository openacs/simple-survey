<?xml version="1.0"?>
<queryset>

<fullquery name="survsimp_survey_respondents">      
      <querytext>
      select first_names || ' ' || last_name as name, creation_user as user_id, email
from persons, parties, survsimp_responses, acs_objects
where person_id = creation_user
and person_id = party_id
and object_id = response_id
and survey_id = :survey_id
group by creation_user, email, first_names, last_name
order by last_name
      </querytext>
</fullquery>

 
<fullquery name="survsimp_name_from_id">      
      <querytext>
      select name as survey_name
from survsimp_surveys
where survey_id = :survey_id
      </querytext>
</fullquery>

 
</queryset>
