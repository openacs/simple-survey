<?xml version="1.0"?>
<queryset>

<fullquery name="survsimp_response_editable_toggle">      
      <querytext>
      update survsimp_surveys set single_editable_p = logical_negation(single_editable_p)
where survey_id = :survey_id
      </querytext>
</fullquery>

 
</queryset>
