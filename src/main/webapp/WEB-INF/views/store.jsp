    <p>
        Store Contents
        <div id="storeContents">loading...</div>
    </p>
	<p>
		AJAX results
		<div id="ajaxContents">loading...</div>
	</p>
	<p>
		Store modified with AJAX
		<div id="storeAjaxContents">loading...</div>
	</p>

    <%--<script src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js" data-dojo-config="async: true" ></script> --%>

    <!-- blank.html is not yet defined in this application -->
    <script data-dojo-config="async: 1, dojoBlankHtmlUrl: '/blank.html',
        packages: [ {
            name: 'demo',
            location: location.pathname.replace(/\/[^/]+$/, '') + '/resources/js/demo'
        } ]"
            <%-- This is the compressed version for speed --%>
            src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js"></script>
            <%-- This is the uncompressed version for debugging --%>
            <%--src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js.uncompressed.js"></script>--%>
    <script>
		// Example of a raw store and rendering its contents
		require(["dojo/store/Memory", "dojo/store/Observable", "dojo/when", "dojo/dom"],
				function(Memory, Observable, when, dom) {
			// Manually create a Memory Store
			var exampleStore = new Memory({
				data: {status: "false"}
			});
			var resultDiv = dom.byId("storeContents");
			resultDiv.innerHTML = exampleStore.data.status;
		});

		// A typical AJAX call and showing its contents
        require(["dojo/dom", "dojo/request", "dojo/json",
            "dojo/_base/array", "dojo/domReady!"], function(dom, request, JSON, arrayUtil){
            // Put the response in the DOM
            var resultDiv = dom.byId("ajaxContents");

            // Request the JSON data from the server
            request.get("store/example-data", {
                // Parse data from JSON to a JavaScript object
                handleAs: "json"
            }).then(function(data){
            	// Display the data sent from the server
            	resultDiv.innerHTML = data.status;
            },
            function(error){
            	// Display the error returned
            	resultDiv.innerHTML = error;
            });
        });

		// An AJAX call that modifies the store and renders it
		require(["dojo/store/Memory", "dojo/store/JsonRest", "dojo/store/Observable", "dojo/when", "dojo/dom",
					"dojo/request", "dojo/json"],
				function(Memory, JsonRest, Observable, when, dom, request, json) {
			// Manually create a Memory Store
			var exampleStore = new Memory({
				data: {status: "false"}
			});

			var resultDiv = dom.byId("storeAjaxContents");

			var exampleStore = new JsonRest({
				target: "store/example-data"
			});

			//resultDiv.innerHTML = exampleStore.data.status; // Undefined, error, badness
			//resultDiv.innerHTML = JSON.stringify(exampleStore); // {"headers":{},"target":"store/example-data"}
			exampleStore.query().then(function(result) {
				resultDiv.innerHTML = result.status;
			});
		});
    </script>
