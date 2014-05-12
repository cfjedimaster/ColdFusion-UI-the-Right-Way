CFTEXTAREA
===
The `<cftextarea>` tag gives you a rich text editing tool.

It is based on [fckeditor](http://en.wikipedia.org/wiki/CKEditor#History_of_CKEditor_project) which was a forerunner to [ckeditor](http://ckeditor.com/).

[fckeditor](http://en.wikipedia.org/wiki/CKEditor#History_of_CKEditor_project) is no longer supported.


Here I am going to use [ckeditor](http://ckeditor.com/) to achive the same thing as `<cftextarea>`.

Firstly `<cftextarea>`.

![cftextarea](images/cftextarea_1.png)

**Listing 1 : cftextarea.cfm**

    <cfparam name="textarea_1" default="">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <title>CFTEXTAREA</title>
        <link rel="stylesheet" href="css/custom.css">
    </head>
    <body>
        <cfoutput>
            <cfform name="frmExample">
                <div id="cftextarea_content">
                    <cftextarea name="textarea_1" richtext="true" toolbar="Basic">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, ducimus, libero reprehenderit fuga recusandae iste laudantium earum tempore laborum consequuntur eligendi porro. Quae, nisi quia assumenda explicabo omnis doloribus placeat?
                    </cftextarea>
                </div>
                <cfinput type="submit" value="Update" name="frmExample_submit"/>
            </cfform>
            #textarea_1#
        </cfoutput> 
    </body>
    </html>


And now the alternative to `<cftextarea>`.

![cftextarea alternative](images/cftextarea_2.png)

**Listing 2 : index.cfm**

    <cfparam name="textarea_1" default="">
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <title>CFTEXTAREA Alternative</title>
        <link rel="stylesheet" href="css/custom.css">
    </head>
    <body>
        <cfoutput>
            <div id="content">
                <form name="frmExample" >
                    <textarea id="textarea_1" name="textarea_1">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia, ducimus, libero reprehenderit fuga recusandae iste laudantium earum tempore laborum consequuntur eligendi porro. Quae, nisi quia assumenda explicabo omnis doloribus placeat?
                    </textarea>
                    <input type="submit" value="Update" name="frmExample_submit"/>
                </form> 
            </div>
            #textarea_1#
        </cfoutput>
    </body>
    <footer>
        <script src="js/ckeditor/ckeditor.js"></script>
        <script type="text/javascript">
            CKEDITOR.replace('textarea_1');
        </script>
    </footer>
    </html>

For further information you can reference :-

* [ckeditor](http://ckeditor.com/)
* [fckeditor](http://en.wikipedia.org/wiki/CKEditor#History_of_CKEditor_project)
* [cftextarea](http://livedocs.adobe.com/coldfusion/8/htmldocs/help.html?content=Tags_t_02.html)




