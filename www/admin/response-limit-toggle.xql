<?xml version="1.0"?>
<queryset>

<fullquery name="survsimp_reponse_toggle">      
      <querytext>
      update survsimp_surveys 
set single_response_p = logical_negation(single_response_p)
where survey_id = :survey_id
      </querytext>
</fullquery>

 
</queryset>
