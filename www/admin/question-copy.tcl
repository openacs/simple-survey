# simple-survey/www/admin/question-copy.tcl

ad_page_contract {
    @author yon (yon@milliped.com)
    @creation-date Apr 16, 2002
    @version $Id$
} -query {
    question_id:integer,notnull
    {referer "./"}
}

db_exec_plsql copy_question {}

ad_returnredirect $referer
