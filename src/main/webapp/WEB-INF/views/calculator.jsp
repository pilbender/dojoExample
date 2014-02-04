<html>
<head>
    <title>Calculator Dojo Example</title>
</head>
<body>
    <p>
        <input type="text" id="num1" >
        <div id="out1">nothing yet...</div>
    </p>

    <%--<script src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js" data-dojo-config="async: true" ></script> --%>

    <!-- blank.html is not yet defined in this application -->
    <script data-dojo-config="async: 1, dojoBlankHtmlUrl: '/blank.html',
        packages: [ {
            name: 'demo',
            location: location.pathname.replace(/\/[^/]+$/, '') + '/resources/js/demo'
        } ]"
            <%-- This is the compressed version for speed --%>
            src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js"></script>
            <%-- This is the uncompressed version for debugging --%>
            <%--src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js.uncompressed.js"></script>--%>
    <script>
        // Require the module we just created
        require(["demo/calculator"], function(calculator){
            // Use our module to change the text in the greeting
            calculator.setText("out1", "nothing");

            // After a few seconds, restore the text to its original state
            setTimeout(function(){
                calculator.restoreText("out1");
            }, 3000);
        });

    </script>
</body>
</html>