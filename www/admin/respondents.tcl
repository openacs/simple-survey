ad_page_contract {
    List respondents to this survey.

    @param survey_id which survey we're displaying respondents to

    @author jsc@arsdigita.com
    @author nstrug@arsdigita.com
    @creation-date February 11, 2000
    @version $Id$
} -query {
    survey_id:integer
} -properties {
    survey_name:onevalue
    respondents:multirow
}

ad_require_permission $survey_id survsimp_admin_survey

db_multirow respondents select_respondents {}
set survey_name [db_string select_survey_name {}]

set context_bar [list \
                    {"./" "Simple Survey Admin"} \
                    [list "one?survey_id=$survey_id" "Administer Survey"] \
                    "Respondents" \
]

ad_return_template
