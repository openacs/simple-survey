# /www/survsimp/admin/index.tcl
ad_page_contract {
    This page is the main table of contents for navigation page 
    for simple survey module administrator

    @author philg@mit.edu
    @author nstrug@arsdigita.com
    @date 3rd October, 2000
    @cvs-id $Id$
} {

}

set page_content "[ad_header "Simple Survey System (Admin)"]

<h2>Simple Survey System Administration</h2>

[ad_context_bar_ws_or_index "Simple Survey Admin"]

<hr>

<ul>

"
set package_id [ad_conn package_id]

# bounce the user if they don't have permission to admin surveys
ad_require_permission $package_id survsimp_admin_survey

set disabled_header_written_p 0

db_foreach survsimp_surveys "select survey_id, name, enabled_p
from survsimp_surveys
order by enabled_p desc, upper(name)" {

    if { $enabled_p == "f" && !$disabled_header_written_p } {
	set disabled_header_written_p 1
	append page_content "<h4>Disabled Surveys</h4>\n"
    }
    append page_content "<li><a href=\"one?[export_url_vars survey_id]\">$name</a>\n"
}

append page_content "

<p>

<li><a href=\"survey-create-choice.tcl\">Create a new survey</a>
</ul>

[ad_footer]
"

doc_return 200 text/html $page_content 
