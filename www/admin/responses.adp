<master>
<property name=title>@survey_name@: Responses</property>
<property name="context">@context@</property>

@unique_users_toggle@
<%= [survey_specific_html $type] %>
<p>
@response_sentence@

<ul>
@results@
</ul>
