--
-- drop SQL for survsimp package
--
-- by nstrug@arsdigita.com on 29th September 2000
--
-- $Id$

begin
	acs_object_type.drop_type ('survsimp_survey');
end;
/
show errors


drop view survsimp_question_responses_un;
drop table survsimp_logic_surveys_map cascade constraints;
drop sequence survsimp_logic_id_sequence;
drop table survsimp_logic;
drop table survsimp_choice_scores cascade constraints;
drop table survsimp_variables_surveys_map cascade constraints;
drop table survsimp_variables;
drop sequence survsimp_variable_id_sequence;
drop table survsimp_question_responses cascade constraints;
drop view survsimnp_responses_unique;
drop table survsimp_responses cascade constraints;
drop sequence survsimp_response_id_sequence;
drop table survsimp_question_choices cascade constraints;
drop sequence survsimp_choice_id_sequence;
drop table survsimp_questions cascade constraints;
drop sequence survsimp_question_id_sequence;
drop table survsimp_surveys cascade constraints;
drop sequence survsimp_survey_id_sequence;
