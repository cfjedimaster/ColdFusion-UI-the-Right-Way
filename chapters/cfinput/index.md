CFINPUT
===

The `<cfinput>` tag acts like an `<input>` tag and allows bindings to data.

In the example below you can start typing and a drop down appears so that you can select from it :-

**Listing 1 : cfinput.cfm**

    <cfset data = queryNew("name,age,desc", "varchar,integer,varchar", [
        {name:"Raymond",age:40,desc:"He is Ray"},
        {name:"Richard",age:40,desc:"He is Richard"},
        {name:"Ripley",age:40,desc:"Alien"},
        {name:"Scott",age:60,desc:"The Mighty Scott"},
        {name:"Todd",age:35,desc:"The founder of Cold things."},
        {name:"Dave",age:42,desc:"Kung Fu Master"},
        {name:"David",age:42,desc:"Kung Fu Mimic"},
        {name:"Davina",age:42,desc:"Kung Fu Mistress"}
    ])>
    <cfquery name="qryData" dbtype="query">
        SELECT *
        FROM data
    </cfquery>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/custom.css">
    </head>
    <cfoutput>
        <body>
            <cfform>
                <ul id="inputs">
                    <li>
                        <label for="firstName">Enter First Name: </label>
                    </li>
                    <li>
                        <cfinput name="firstName" id="firstName" type="text" autoSuggest="#valueList(qryData.name)#" typeahead="true" />
                    </li>
                </ul>
            </cfform>
        </body>
    </cfoutput>
    </html>

This is the output :-

![CFINPUT Example](images/input1.png)

We can achive the same thing using **HTML5** and include a **graceful** fallback.

**Listing 2 : html5.cfm**

    <cfset data = queryNew("name,age,desc", "varchar,integer,varchar", [
        {name:"Raymond",age:40,desc:"He is Ray"},
        {name:"Richard",age:40,desc:"He is Richard"},
        {name:"Ripley",age:40,desc:"Alien"},
        {name:"Scott",age:60,desc:"The Mighty Scott"},
        {name:"Todd",age:35,desc:"The founder of Cold things."},
        {name:"Dave",age:42,desc:"Kung Fu Master"},
        {name:"David",age:42,desc:"Kung Fu Mimic"},
        {name:"Davina",age:42,desc:"Kung Fu Mistress"}
    ])>
    <cfquery name="qryData" dbtype="query">
        SELECT *
        FROM data
    </cfquery>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/custom.css">
    </head>
    <body>
        <h4>HTML 5 browsers</h4>
        <label>
            Enter First Name<br />
            <input type="text" name="firstName" id="firstName" list="listFirstNames" maxlength="20" style="width:15%;">
            <datalist id="listFirstNames">
                <cfoutput query="qryData">
                    <option value="#qryData.name#">
                </cfoutput>
            </datalist>
        </label>
        <h4>Legacy and HTML 5 browsers</h4>
        <label>
            Enter First Name<br />
            <input type="text" name="firstName" id="firstName" list="listFirstNames" maxlength="20" style="width:15%;"><br />
        </label>
        <datalist id="listFirstNames">
            <label>
                OR select one from the list below:<br />
                <select name="firstName">
                    <cfoutput query="qryData">
                        <option value="#qryData.name#">
                    </cfoutput>
                </select>
            </label>
        </datalist>
    </body>
    </html>


This is the output :-

![HTML5 Example](images/input3.png)

We can of course use a jQuery plugin to acheive the same thing and once again we will utilise **jQuery UI**.

**Listing 3 : index.cfm**

    <cfset data = queryNew("name,age,desc", "varchar,integer,varchar", [
        {name:"Raymond",age:40,desc:"He is Ray"},
        {name:"Richard",age:40,desc:"He is Richard"},
        {name:"Ripley",age:40,desc:"Alien"},
        {name:"Scott",age:60,desc:"The Mighty Scott"},
        {name:"Todd",age:35,desc:"The founder of Cold things."},
        {name:"Dave",age:42,desc:"Kung Fu Master"},
        {name:"David",age:42,desc:"Kung Fu Mimic"},
        {name:"Davina",age:42,desc:"Kung Fu Mistress"}
    ])>
    <cfquery name="qryData" dbtype="query">
        SELECT *
        FROM data
    </cfquery>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <title>jQuery UI Autocomplete - Default functionality</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.9.1.js"></script>
        <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="css/custom.css">
        <script>
            $(function() {
                var availableTags = [
                <cfoutput query="qryData">
                    <cfif qryData.currentrow NEQ qryData.recordcount>
                        "#qryData.name#",
                    <cfelse>    
                        "#qryData.name#"
                    </cfif>
                </cfoutput>
                ];
                $( "#firstName" ).autocomplete({
                source: availableTags
                });
            });
        </script>
    </head>
    <body>
        <div class="ui-widget">
            <ul id="inputs">
                <li>
                    <label for="firstName">Enter First Name: </label>
                </li>
                <li>
                    <input id="firstName">
                </li>
            </ul>
        </div>
    </body>
    </html>

This is the output :-

![jQuery UI Example](images/input2.png)

For further information you can reference :-

* [CFINPUT](http://livedocs.adobe.com/coldfusion/8/htmldocs/help.html?content=Tags_i_07.html)
* [HTML5 Datalist](http://html5doctor.com/element-index/#d)
* [HTML5 Datalist Specification](http://www.w3.org/html/wg/drafts/html/master/forms.html#the-datalist-element)

