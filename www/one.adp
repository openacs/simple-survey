<master src=./master>
<property name=title>One Survey: @name@</property>
<property name=context_bar>@context_bar@</property>

    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <form enctype=multipart/form-data method="post" action="process-response">
        <tr>
          <td class="mainheading">@name@</td>
        </tr>
        <tr>
          <td class="tabledata"><hr noshade size="1" color="#dddddd"></td>
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
