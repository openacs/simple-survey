ad_page_contract {

    List respondents to this survey.

    @param    survey_id  which survey we're displaying respondents to

    @author   jsc@arsdigita.com
    @author   nstrug@arsdigita.com
    @date     February 11, 2000
    @cvs-id   $Id$
} {

    survey_id:integer

}

ad_require_permission $survey_id survsimp_admin_survey



set respondents ""

db_foreach survsimp_survey_respondents "select first_names || ' ' || last_name as name, creation_user as user_id, email
from persons, parties, survsimp_responses, acs_objects
where person_id = creation_user
and person_id = party_id
and object_id = response_id
and survey_id = :survey_id
group by creation_user, email, first_names, last_name
order by last_name" {

    append respondents "<li><a href=\"one-respondent?[export_url_vars user_id  survey_id]\">$name ($email)</a>\n"
}

set survey_name [db_string survsimp_name_from_id "select name as survey_name
from survsimp_surveys
where survey_id = :survey_id" ]

set context_bar [ad_context_bar_ws_or_index [list "./" "Simple Survey Admin"] \
     [list "one?survey_id=$survey_id" "Administer Survey"] \
     "Respondents"]


ad_return_template
