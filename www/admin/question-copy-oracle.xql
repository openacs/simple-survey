<?xml version="1.0"?>

<queryset>
    <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

    <fullquery name="copy_question">
        <querytext>
            begin
                :1 := survsimp_question.copy(:question_id);
            end;
        </querytext>
    </fullquery>

</queryset>
