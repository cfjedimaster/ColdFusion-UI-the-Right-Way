CFMENU
===

The `<cfmenu>` tag creates a menu, so that's a good start.

Here is an example :-

**Listing 1 : index.cfm**

    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
            <title>cfmenu</title>
        </head>
        <body>
            <cfmenu name="menu" type="horizontal" fontsize="14" bgcolor="silver">
                <cfmenuitem name="Scotch" href="http://sotr.eu/" display="Scotch"/>
                <cfmenuitem name="on" href="http://sotr.eu/" display="On"/>
                <cfmenuitem name="the" href="http://sotr.eu/" display="The">
                    <cfmenuitem name="best" href="https://twitter.com/sotr" display="Best"/>
                    <cfmenuitem name="conference" href="http://www.facebook.com/sotr.eu" display="Developer Conference"/>
                    <cfmenuitem name="by" href="http://sotr.eu/##nav-pricing" display="By"/>
                    <cfmenuitem name="miles" href="http://sotr.eu/##nav-venue" display="Miles"/>
                </cfmenuitem>
                <cfmenuitem name="rocks" href="http://sotr.eu/" display="Rocks"/>
            </cfmenu>
        </body>
    </html>


However, to make `<cfmenu>` look right you will STILL have to learn some CSS.

So, if you have to add CSS anyway, why bother with `<cfmenu>`. I agree, lets go to work.

**Listing 2 : index.html**

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>CSS Menu</title>
        <link href="../css/nav.css" rel="stylesheet">
    </head>
    <body>
        <div id="wrapper">
            <ul id="nav">
                <li><a href="http://sotr.eu/">Scotch</a></li>
                <li><a href="http://sotr.eu/">On</a></li>
                <li><a href="http://sotr.eu/">The</a>
                    <ul class="sub-nav">
                        <li><a href="https://twitter.com/sotr">Best</a></li>
                        <li><a href="http://www.facebook.com/sotr.eu">Developer Conference</a></li>
                        <li><a href="http://sotr.eu/#nav-pricing">By</a></li>
                        <li><a href="http://sotr.eu/#nav-venue">Miles</a></li>
                    </ul>
                </li>
                <li><a href="http://sotr.eu/">Rocks</a></li>
            </ul>
        </div>
    </body>
    </html>

The amount of code is about the same and the structure is similar, but our HTML file contains a reference to a CSS file.

This is the CSS file that we have dragged in via the tag :-

        <link href="../css/nav.css" rel="stylesheet">

The CSS is quite basic and if you don't understand it then, to be honest, you should learn some CSS.

**Listing 3 : nav.css**

    /* INITIAL SETTINGS */
    ul#nav, ul#nav ul.sub-nav {
        padding:0;
        margin: 0;
    }
    ul#nav li, ul#nav ul.sub-nav li {
        list-style-type: none;
        display: inline-block;
            /* FOR VERTICAL NAV */
            /*float:left;*/
    }
    /* STYLE THE LINKS */
    ul#nav li a, ul#nav li ul.sub-nav li a {
        text-decoration: none;
        color: #fff;
        background: silver;
        padding: 5px;           
        display:inline-block;
        width: 150px;
    }
    /* PARENT */
    ul#nav li {
        position: relative;
        clear: both;
    }
    /* SUB-NAV */
    ul#nav li ul.sub-nav {
        display:none;
        position: absolute;
            /* FOR VERTICAL NAV */
            /*top: 0px;*/
        left: 0;
        width: 150px;
        background: silver;
            /* FOR VERTICAL NAV */
            /*margin: 0px 0px 0px 85px;*/
    }
    ul#nav li:hover ul.sub-nav {
        display:block;
            /* FOR VERTICAL NAV */
            /*left: 75px;*/
    }
    /* HOVER STATES */
    ul#nav li a:hover {
        color: #000;
    }
    ul#nav li ul.sub-nav a:hover {
         color: #000;
    }


If you require a VERTICAL Menu, then just un-comment the lines underneath the comments called   /* FOR VERTICAL NAV */

For further information you can reference :-

* [CFMENU](http://livedocs.adobe.com/coldfusion/8/htmldocs/help.html?content=Tags_m-o_04.html)

