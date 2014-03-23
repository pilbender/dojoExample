<p>
    Message from the controller:

    <div id="greeting">${message}</div>
</p>
<p>
    AJAX Message

    <div id="ajaxGet">loading...</div>
</p>

<p>
    Events examples, coming soon...
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
    require(["demo/myModule"], function (myModule) {
        // Use our module to change the text in the greeting
        myModule.setText("greeting", "Hello Dojo!");

        // After a few seconds, restore the text to its original state
        setTimeout(function () {
            myModule.restoreText("greeting");
        }, 3000);
    });

</script>
<script>
    require(["dojo/dom", "dojo/request", "dojo/json",
        "dojo/_base/array", "dojo/domReady!"], function (dom, request, JSON, arrayUtil) {
        // Put the response in the DOM
        var resultDiv = dom.byId("ajaxGet");

        // Request the JSON data from the server
        request.get("example-data", {
            // Parse data from JSON to a JavaScript object
            handleAs: "json"
        }).then(function (data) {
                    // Display the data sent from the server
                    resultDiv.innerHTML = data.status;
                },
                function (error) {
                    // Display the error returned
                    resultDiv.innerHTML = error;
                });
    });
</script>
