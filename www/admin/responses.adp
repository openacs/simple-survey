<master>
<property name=title>@survey_name;noquote@: Responses</property>
<property name="context">@context;noquote@</property>

@unique_users_toggle@
<%= [survey_specific_html $type] %>
<p>
@response_sentence@

<ul>
@results@
</ul>
