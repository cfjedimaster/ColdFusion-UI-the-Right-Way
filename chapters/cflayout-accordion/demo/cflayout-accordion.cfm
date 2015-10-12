<html>
    <head>
        <title>Base CFLayout Accordion to Bootstrap Accordion Demo</title>
        <style>
            body {margin: 20px;}
        </style>
    </head>
    <body>
        <cflayout type="accordion" height="300">
            <cflayoutarea title="American League - East">
                <ul>
                    <li>Baltimore Orioles</li>
                    <li>Boston Red Sox</li>
                    <li>New York Yankees</li>
                    <li>Tampa Bay Rays</li>
                    <li>Toronto Blue Jays</li>
                </ul>
            </cflayoutarea>
            <cflayoutarea title="American League - Central">
                <ul>
                    <li>Chicago White Sox</li>
                    <li>Cleveland Indians</li>
                    <li>Detroit Tigers</li>
                    <li>Kansas City Royals</li>
                    <li>Minnesota Twins</li>
                </ul>
            </cflayoutarea>
            <cflayoutarea title="American League - West" source="alwest.cfm" refreshOnActivate="true" />
        </cflayout>
    </body>
</html>