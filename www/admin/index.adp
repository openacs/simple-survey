<master src=./master>
<property name=title>Survey Administration</property>
<property name=context_bar>@context_bar@</property>

<ul>
<multiple name=surveys>
<group column="enabled_p">
<li> <a href=one?survey_id=@surveys.survey_id@>@surveys.name@</a>
</group>
</multiple>
<p>
<li> <a href=survey-create>New Survey</a>
</ul>
