<master src=./master>
<property name=title>One Survey: @survey_name@</property>
<property name=context_bar>@context_bar@</property>

<ul>
<li>Created by: <a href="<%= [acs_community_member_url -user_id $creation_user] %>">@creator_name@</a>
<li>Name: @survey_name@ <font size=-1>[ <a href="name-edit?survey_id=@survey_id@">edit</a> ]</font>
<li>Created: <%= [util_AnsiDatetoPrettyDate $creation_date] %>
<li>Status: @survey_status@ <font size=-1>@toggle_enabled_link@</font>
<li>Display Type: @display_type@ <font size=-1>@display_type_toggle@</font>
<li>Responses per user: @survey_response_limit@ <font size=-1>[ <a href="response-limit-toggle?survey_id=@survey_id@">@response_limit_toggle@</a> @response_editable_link@ ]</font>
<li>Description: @survey_description@ <font size=-1>[ <a href="description-edit?survey_id=@survey_id@">edit</a> ]</font>
<li>Type: @type@
<li>View responses:  <a href="respondents?survey_id=@survey_id@">by user</a> | <a href="responses?survey_id=@survey_id@">summary</a>
<%= [survey_specific_html $type] %>
</ul>
<p>

@questions_summary@
