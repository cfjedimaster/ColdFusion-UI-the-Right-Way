<html>
    <head>
        <title>Base CFWindow to Bootstrap Modal Demo</title>
        <style>
            body {margin: 20px;}
        </style>
    </head>
    <body>
        <input type="button" name="mybutton" value="Show Dialog" onclick="javascript:ColdFusion.Window.show('myWindow')">
        <cfwindow name="myWindow" title="This is my modal dialog" center="true">
            <p>I have some content right here <cfoutput>#Now()#</cfoutput></p>
        </cfwindow>
        <hr />
        <input type="button" name="mybutton" value="Show Remote Dialog" onclick="javascript:ColdFusion.Window.show('myWindow2')">
        <cfwindow name="myWindow2" title="This is my modal dialog" center="true" source="mycontent.cfm" />
    </body>
</html>