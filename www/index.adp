<master src=./master>
<property name=title>Surveys</property>
<property name=context_bar>@context_bar@</property>
    <ul>
      
      <multiple name=surveys>
	<li><a href="one?survey_id=@surveys.survey_id@">@surveys.name@</a>
      </multiple>
      
      <if @surveys:rowcount@ eq 0>
	<li>No surveys active
      </if>
    </ul>

