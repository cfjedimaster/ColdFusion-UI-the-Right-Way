<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Test1</title>
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/alt_tablayout.css">
        <style>
            body {margin: 20px;}
        </style>
    </head>
    <body>
        <div class="row">
            <div class="nav-tabs-container col-md-4">
                <ul class="nav nav-tabs" id="myTab">
                  <li class="active"><a href="#static" data-toggle="tab">Static</a></li>
                  <li><a href="mycontent.cfm" data-target="#dynamic" data-remote-target="true" data-toggle="tab">Dynamic</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="static">
                    <p>Some text in the first tab</p>
                    <div class="nav-tabs-container">
                        <ul class="nav nav-tabs" id="myTab2">
                          <li class="active"><a href="#mouse" data-toggle="tab">Mouse</a></li>
                          <li><a href="#duck" data-toggle="tab">Duck</a></li>
                        </ul>
                        <div class="tab-content">
                          <div class="tab-pane active" id="mouse">
                            <p>Micky Mouse</p>
                          </div>
                          <div class="tab-pane" id="duck">
                            <p>Donald Duck</p>
                          </div>
                        </div>
                    </div>
                  </div>
                  <div class="tab-pane" id="dynamic">
                      Loading ...
                  </div>
                </div>
            </div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://code.jquery.com/jquery.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="resources/tabscript.js"></script>
    </body>
</html>