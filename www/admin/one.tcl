ad_page_contract {

    This page allows the admin to administer a single survey.

    @param  survey_id integer denoting survey we're administering

    @author jsc@arsdigita.com
    @author nstrug@arsdigita.com
    @date   February 9, 2000
    @cvs-id $Id$
} {

    survey_id:integer

}

ad_require_permission $survey_id survsimp_admin_survey

# Get the survey information.
db_1row survsimp_properties "select name as survey_name, 
short_name, description as survey_description, 
first_names || ' ' || last_name as creator_name, creation_user, 
creation_date, decode(enabled_p, 't', 'Enabled', 'f', 'Disabled') as survey_status, enabled_p,
decode(single_response_p, 't', 'One', 'f', 'Multiple') as survey_response_limit,
decode(single_editable_p, 't', 'Editable', 'f', 'Non-editable') as survey_editable_single, type
from survsimp_surveys, acs_objects, persons
where object_id = survey_id
and person_id = creation_user
and survey_id = :survey_id"

if {$survey_response_limit == "One"} {
    set response_limit_toggle "allow Multiple"
    if {$survey_editable_single == "Editable"} {
        set response_editable_link "| Editable: <a href=\"response-editable-toggle?[export_url_vars survey_id]\">make non-editable</a>"
    } else {
	set response_editable_link "| Non-editable: <a href=\"response-editable-toggle?[export_url_vars survey_id]\">make editable</a>"
    }
} else {
    set response_limit_toggle "limit to One"
    set response_editable_link ""
}

# allow site-wide admins to enable/disable surveys directly from here
if { 1 == 1 } {
    set target "one?[export_url_vars survey_id]"
    set toggle_enabled_link "\[ <a href=\"survey-toggle?[export_url_vars survey_id enabled_p target]\">"
    if {$enabled_p == "t"} {
	append toggle_enabled_link "Disable"
    } else {
	append toggle_enabled_link "Enable"
    }
    append toggle_enabled_link "</a> \]"
} else {
    set toggle_enabled_link "(can only be changed by a site-wide admin)"
}

set questions_summary "<form><ol>\n"
set count 0


# Questions summary.   

proc survey_specific_question_option_html { type survey_id question_id } {
    
    switch $type {
	"general" {
	    set return_html ""
	}
	"scored" {
	    set return_html "<a href=\"modify-responses?[export_url_vars survey_id question_id]\">modify responses</a>"
	}
	default {
	    set return_html ""
	}

	return $return_html
    }
}

db_foreach sursimp_survey_questions "select question_id, sort_key, active_p, required_p
from survsimp_questions
where survey_id = :survey_id  
order by sort_key" {


    set question_options [list "<a href=\"question-modify-text?[export_url_vars question_id survey_id]\">modify text</a>" "<a href=\"question-delete?question_id=$question_id\">delete</a>" "<a href=\"question-add?[export_url_vars survey_id]&after=$sort_key\">insert after</a>"]

    if { $count > 0 } {
	lappend question_options "<a href=\"question-swap?[export_url_vars survey_id sort_key]\">swap with prev</a>"
    }

    if {$active_p == "t"} {
	lappend question_options "Active: <a href=\"question-active-toggle?[export_url_vars survey_id question_id active_p]\">inactivate</a>"
	if {$required_p == "t"} {
	    lappend question_options "Response Required: <a href=\"question-required-toggle?[export_url_vars survey_id question_id required_p]\">don't require</a>"
	} else {
	    lappend question_options "Response Not Required: <a href=\"question-required-toggle?[export_url_vars survey_id question_id required_p]\">require</a>"
	}
    } else {
	lappend question_options "Inactive: <a href=\"question-active-toggle?[export_url_vars survey_id question_id active_p]\">activate</a>"
    }

    lappend question_options [survey_specific_question_option_html $type $survey_id $question_id]

    append questions_summary "
<li>[survsimp_question_display $question_id]
<br>
<font size=-1>
\[ [join $question_options " | "] \]
</font>

<p>"
    incr count
}  

if {$count == 0} {
    append questions_summary "<p><a href=\"question-add?survey_id=$survey_id\">Add a question</a>\n"
}

append questions_summary "</ol></form>\n"

proc survey_specific_html { type } {

    switch $type {
	"general" {
	    set return_html ""
	}

	"scored" {
	    upvar survey_id local_survey_id
	    set return_html "<li><a href=\"edit-logic?survey_id=$local_survey_id\">Edit survey logic</a>"
	}

	default {
	    set return_html ""
	}

	return $return_html
    }
}


doc_return 200 text/html "[ad_header "Administer Survey"]
<h2>$survey_name</h2>

[ad_context_bar_ws_or_index [list "" "Simple Survey Admin"] "Administer Survey"]

<hr>

<ul>
<li>Created by: <a href=\"/shared/community-member?user_id=$creation_user\">$creator_name</a>
<li>Short name: $short_name
<li>Created: [util_AnsiDatetoPrettyDate $creation_date]
<li>Status: $survey_status <font size=-1>$toggle_enabled_link</font>
<li>Responses per user: $survey_response_limit <font size=-1>\[ <a href=\"response-limit-toggle?[export_url_vars survey_id]\">$response_limit_toggle</a> $response_editable_link \]</font>
<li>Description: $survey_description <font size=-1>\[ <a href=\"description-edit?[export_url_vars survey_id]\">edit</a> \]</font>
<li>Type: $type
<li>View responses:  <a href=\"respondents?survey_id=$survey_id\">by user</a>|<a href=\"responses?survey_id=$survey_id\">summary</a>
[survey_specific_html $type]
</ul>
<p>

$questions_summary

[ad_footer]
"


