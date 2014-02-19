<html>
    <head>
        <title>Base CFLayout Tabset to Bootstrap Tabs Demo</title>
        <style>
            body {margin: 20px;}
        </style>
    </head>
    <body>
        <cflayout type="tab" tabHeight="200">
            <cflayoutarea title="Static">
                Some text in the first tab<br /><br />
                <cflayout type="tab" tabHeight="100">
                    <cflayoutarea title="Mouse" style="background-color:##00FFFF;" >
                        Mickey Mouse
                    </cflayoutarea>
                    <cflayoutarea title="Duck">
                        Donald Duck
                    </cflayoutarea>
                </cflayout>
            </cflayoutarea>
            <cflayoutarea title="Dynamic" source="mycontent.cfm" refreshOnActivate="true" />
        </cflayout>
    </body>
</html>