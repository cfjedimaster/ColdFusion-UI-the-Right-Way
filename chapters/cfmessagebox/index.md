CFMESSAGEBOX
===
The `<cfmessage>` tag lets you display a **pop-up** window and gather information in it.

There are loads of MODAL modules out there. I used this one :-

* [jquery modal](https://github.com/kylefox/jquery-modal)

**Listing 2 : index.cfm**

    <cfif IsDefined("submitMainForm")>
        <cfdump var="#FORM#">
    </cfif>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <title>CFMESSAGEBOX Alternative</title>
        <link rel="stylesheet" href="css/custom.css">
        <script src="//code.jquery.com/jquery-1.9.1.js"></script>
        <script src="js/jquery.modal.min.js"></script>
        <script src="js/main.js"></script>
    </head>
    <cfoutput>
    <body>
        <form name="mainForm" action="index.cfm" method="post">
            <ul>
                <li>
                    <button name="showNameForm" id="showNameForm">Enter your name</button>
                </li>
                <li>
                    <span id="message"></span>
                </li>
                <li>
                    <button type="submit" name="submitMainForm" id="submitMainForm">Submit the form</button>
                </li>
            </ul>
            <!--- THESE TWO VARIABLES ARE CHANGE BY THE JS THAT RUNS WHEN submitName IS CLICKED  --->
            <input type="hidden" name="firstName" id="firstName" value="">
            <input type="hidden" name="lastName" id="lastName" value="">
        </form>
        <!--- NOTE THIS FORM IS HIDDEN --->
        <form class="login_form modal" id="nameForm" style="display:none;">
            <h3>Please enter your name</h3>
            <p>
                <label>Firstname:</label>
                <input type="text" name="txtFirstname" id="txtFirstname" />
            </p>
            <p>
                <label>Lastname:</label>
                <input type="text" name="txtLastname" id="txtLastname" type="text" />
            </p>
            <p>
                <input type="button" id="submitName" value="Submit" />
            </p>
        </form>
    </body>
    </cfoutput>
    <footer>
    </footer>
    </html>

**Listing 3 : custom.css**

    ul li {
        margin-left: -20px;
        list-style-type: none;
    }
    .modal {
        display: none;
        width: 400px;
        background: #fff;
        padding: 15px 30px;
        -webkit-border-radius: 8px;
        -moz-border-radius: 8px;
        -o-border-radius: 8px;
        -ms-border-radius: 8px;
        border-radius: 8px;
        -webkit-box-shadow: 0 0 10px #000;
        -moz-box-shadow: 0 0 10px #000;
        -o-box-shadow: 0 0 10px #000;
        -ms-box-shadow: 0 0 10px #000;
        box-shadow: 0 0 10px #000;
    }
    .modal a.close-modal {
        position: absolute;
        top: -12.5px;
        right: -12.5px;
        display: block;
        width: 30px;
        height: 30px;
        text-indent: -9999px;
        background: url(../images/close.png) no-repeat 0 0;
    }
    .login_form.modal {
        border-radius: 0;
        line-height: 18px;
        padding: 0;
        font-family: "Lucida Grande", Verdana, sans-serif;
    }
    .login_form h3 {
        margin: 0;
        padding: 10px;
        color: #fff;
        font-size: 14px;
        background: -moz-linear-gradient(top, #2e5764, #1e3d47);
        background: -webkit-gradient(linear,left bottom,left top,color-stop(0, #1e3d47),color-stop(1, #2e5764));
    }
    .login_form.modal p { 
        padding: 20px 30px; border-bottom: 1px solid #ddd; margin: 0;
        background: -webkit-gradient(linear,left bottom,left top,color-stop(0, #eee),color-stop(1, #fff));
        overflow: hidden;
    }
    .login_form.modal p:last-child { border: none; }
    .login_form.modal p label { float: left; font-weight: bold; color: #333; font-size: 13px; width: 110px; line-height: 22px; }
    .login_form.modal p input[type="text"],
    .login_form.modal p input[type="password"] {
        font: normal 12px/18px "Lucida Grande", Verdana;
        padding: 3px;
        border: 1px solid #ddd;
        width: 200px;
    }

**Listing 4 : main.js**

    $(document).on( "click", "#showNameForm", function(e) {
        event.preventDefault();
        $('#nameForm').modal();
    });
    $(document).on( "click", "#submitName", function(e) {
        //DISPLAY THE NAME THAT WAS JUST ENTERED IN THE MODAL BOX
        $("#message").html('You entered - ' + $("#txtFirstname").val() + ' ' + $("#txtLastname").val());
        //SET THE HIDDEN FORM VARIABLES IN THE MAIN FORM
        $("#firstName").val($("#txtFirstname").val());
        $("#lastName").val($("#txtLastname").val());
        //CLOSE THE MODAL BOX
        $.modal.close();
    });


For further information you can reference :-

* [jquery modal](https://github.com/kylefox/jquery-modal)




