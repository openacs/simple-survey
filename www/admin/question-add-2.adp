<master>
<property name=title>Survey Administration: Add a Question (cont.)</property>
<property name="context">@context@</property>

<form action="question-add-3" method=post>
@form_var_list@

Question:
<blockquote>
@question_text@
</blockquote>

@presentation_options_html@

@response_type_html@

@response_fields@

<p>

Response Location: <input type=radio name=presentation_alignment value="beside"> Beside the question <input type=radio name=presentation_alignment value="below" checked> Below the question

<p>

<center>
<input type=submit value="Submit">
</center>

</form>
