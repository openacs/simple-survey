  <html>
    <head>
      <title>@survey_name@</title>
    </head>
    
    <h2>@survey_name@</h2>
    
    @description@
    <p>
      <multiple name=responses>	
	<if @responses.rownum@ ne @responses:rowcount@>
          <a href=#@responses.submission_date@>@responses.pretty_submission_date@</a>|
	</if>
	<else>
          <a href=#@responses.submission_date@>@responses.pretty_submission_date@</a>
	</else>
      </multiple>
      <p>
        <multiple name=responses>
          <table width=100% cellpadding=2 cellspacing=2 border=0>
            <tr bgcolor=#e6e6e6>
              <td><a name="@responses.submission_date@">Your response on @responses.pretty_submission_date@</a></td>
            </tr>
            <tr bgcolor=#f4f4f4>
              <td>responses.answer_summary</td>
            </tr>
          </table>
        </multiple>
  </html>