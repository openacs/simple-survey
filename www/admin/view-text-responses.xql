<?xml version="1.0"?>
<queryset>

<fullquery name="one_question">      
      <querytext>
      
  select question_text, survey_id
  from survsimp_questions
  where question_id = :question_id
      </querytext>
</fullquery>

 
<fullquery name="abstract_data_type">      
      <querytext>
      select abstract_data_type
from survsimp_questions q
where question_id = :question_id
      </querytext>
</fullquery>

 
<fullquery name="all_responses_to_question">      
      <querytext>
      
select
  $column_name as response,
  u.user_id,
  first_names || ' ' || last_name as respondent_name,
  submission_date,
  ip_address
from
  survsimp_responses r,
  survsimp_question_responses qr,
  users u
where
  qr.response_id = r.response_id
  and u.user_id = r.user_id
  and qr.question_id = :question_id
order by r.submission_date
      </querytext>
</fullquery>

 
</queryset>
