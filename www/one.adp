<html>
    <head>
      <title>@name@</title>
    </head>

    <h2>@name@</h2>

    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <form method="post" action="process-response">
        <tr>
          <td class="mainheading">@name@</td>
        </tr>
        
        <tr>
          <td class="tabledata"><hr noshapde size="1" color="#dddddd"></td>
        </tr>
        
        <tr>
          <td class="tabledata">@description@</td>
        </tr>
        
        <tr>
          <td class="tabledata"><hr noshapde size="1" color="#dddddd"></td>
        </tr>
        
        <tr>
          <td class="tabledata">
            <%= [export_form_vars survey_id] %>
            <ol>
              <list name="questions">
                <li><!--qis-->@questions:item@<!--qie-->
              </list>
            </ol>
            <hr noshapde size="1" color="#dddddd">
              <input type=submit value="Continue">
          </td>
        </tr>
        
      </form>
    </table>
  </html>