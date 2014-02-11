cfform
======

*&lt;cfform&gt;* is key to many of the ColdFusion form tags.

**Listing 1: Simple *&lt;cfform&gt;* example**

    <cfform>
    </cfform>
    

**Listing 2: JavaScript and HTML created by cfform tag**

<script type="text/javascript">
<!--
    _CF_checkCFForm_1 = function(_CF_this)
    {
        //reset on submit
        _CF_error_exists = false;
        _CF_error_messages = new Array();
        _CF_error_fields = new Object();
        _CF_FirstErrorField = null;


        //display error messages and return success
        if( _CF_error_exists )
        {
            if( _CF_error_messages.length > 0 )
            {
                // show alert() message
                _CF_onErrorAlert(_CF_error_messages);
                // set focus to first form error, if the field supports js focus().
                if( _CF_this[_CF_FirstErrorField].type == "text" )
                { _CF_this[_CF_FirstErrorField].focus(); }

            }
            return false;
        }else {
            return true;
        }
    }
//-->
</script>

<form name="CFForm_1" id="CFForm_1" action="&#x2f;ColdFusion&#x2f;cfform&#x2f;cfform.cfm" method="post" onsubmit="return _CF_checkCFForm_1(this)"> 
</form>


**Screenshot 1**




## An Alternative

In this chapter we will demonstrate how to no longer rely on cfform's default method="post".

### Default method
cfform defaults to method="post" while a regular HTML form tag defaults to method="get".

**Listing 3: Change *&lt;form&gt;* method using jQuery**

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=Edge" />

        <title>default form to method="post"</title>

        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" />
        <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    </head>

    <body>
        <div class="navbar navbar-default navbar-static-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/">CFDiv to jQuery Example</a>
                </div>
            </div>
        </div>

        <div id="wrap">
            <div class="container">
                <div id="content">
                    <h1>form Example 1</h1>
                    <form>
                    </form>
                </div>
            </div>
        </div>
        <script src="form.js"></script>
    </body>
    </html>
    
  form.js:
  $('form').attr('method','post');
    

Let's review the more important parts of this. First we must ensure we have included the jQuery library. 
Often you will have this file as part of your project in some folder containing static assets. 
In our case, however, we are simply requesting it from a CDN.

    <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

The next important difference is how we did **not** use *&lt;cfform&gt;*. 
We created a simple *&lt;form&gt;* tag. jQuery will add method="post" to all the forms on the page.

    <form></form>

We have a bit of JavaScript.

    $('form).attr('method','post');

That little bit of magic first selects all the *&lt;form&gt;* tags and then adds the method attribute with a value of post.



## Additional References and Info

* [jQuery](http://jquery.com) - Awesome JavaScript library
