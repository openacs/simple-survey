<?xml version="1.0"?>
<queryset>

<fullquery name="survsimp_question_required_toggle">      
      <querytext>
      update survsimp_questions set active_p = logical_negation(active_p)
where survey_id = :survey_id
and question_id = :question_id
      </querytext>
</fullquery>

 
</queryset>
