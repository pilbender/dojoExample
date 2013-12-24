<html>
<head>
    <title>Dojo Example</title>
</head>
<body>
    Message from the controller:
	<div id="greeting">${message}</div>

    <%--<script src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js" data-dojo-config="async: true" ></script> --%>

    <!-- blank.html is not yet defined in this application -->
    <script data-dojo-config="async: 1, dojoBlankHtmlUrl: '/blank.html',
        packages: [ {
            name: 'demo',
            location: location.pathname.replace(/\/[^/]+$/, '') + 'resources/js/demo'
        } ]"
            src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js"></script>

    <script>
        // Require the module we just created
        require(["demo/myModule"], function(myModule){
            // Use our module to change the text in the greeting
            myModule.setText("greeting", "Hello Dojo!");

            // After a few seconds, restore the text to its original state
            setTimeout(function(){
                myModule.restoreText("greeting");
            }, 3000);
        });

    </script>
</body>
</html>