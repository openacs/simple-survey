<master>
<property name="title">@survey_name@: Respondents</property>
<property name="context">@context@</property>

<ul>
<multiple name="respondents">
  <li>
    <a href="one-respondent?survey_id=@survey_id@&user_id=@respondents.user_id@">
      @respondents.name@ (@respondents.email@)
    </a>
  </li>
</multiple>
</ul>
