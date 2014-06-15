<cfset aryMessage = 
    [
        'You must enter a name.',
        'You must enter a valid e-mail address.',
        'You must enter a password.',
        'You must enter your password twice.'
    ]
>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1024" />
    <title>CFFORM - ALTERNATIVE</title>
    <link rel="stylesheet" type="text/css" href="css/custom.css">
</head>
<body>
<cfoutput>
    <cfif IsDefined("form.fieldnames")>
        <cfdump var="#form#"><br>
    </cfif>
    <cfform name="myform" preservedata="Yes">
        <ul>
            <li>Name:</li>
            <li><cfinput type="text" size="25" name="name" required="yes" message="#aryMessage[1]#"></li>
            <li>E-mail:</li>
            <li><cfinput type="text" size="25" name="email" required="yes" validate="email" message="#aryMessage[2]#"></li>
            <li>Password:</li>
            <li><cfinput type="password" size="25" name="password1" required="yes" maxlength="12" message="#aryMessage[3]#"></li>
            <li>Reenter password:</li>
            <li><cfinput type="password" size="25" name="password2" required="yes" maxlength="12" message="#aryMessage[4]#"></li>
            <li><cfinput type="submit" name="submitit"></li>
        </ul>
    </cfform>
</cfoutput>
</body>
</html>

