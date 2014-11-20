	<hr />
	<p>First let's show an example of a non-widget version...</p>
    <p>
        <h3>Person Data</h3>
        <div id="personData">loading...</div>
    </p>
	<hr />
	<p>Same thing but created as a widget...</p>
	<p>
		<h3>Person Data</h3>
		<div id="personDataWidget">loading...</div>

		Widget Declaritive
		<%--<div data-dojo-id="personStore" data-dojo-type="dojo/store/JsonRest"
			 data-dojo-props="target: '/widget/person-data'"></div>
		<div data-dojo-type="PersonWidget/PersonWidget" data-dojo-props="store:personStore, type:'PersonWidget/PersonWidget', page:0, pageSize:7"></div>--%>
	</p>

    <%--<script src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js" data-dojo-config="async: true" ></script> --%>

    <!-- blank.html is not yet defined in this application -->
    <script data-dojo-config="async: 1, dojoBlankHtmlUrl: '/blank.html',
        packages: [ {
            name: 'demo',
            location: location.pathname.replace(/\/[^/]+$/, '') + '/resources/js/demo'
            },
            {
            name: 'PersonWidget',
            location: location.pathname.replace(/\/[^/]+$/, '') + '/resources/js/PersonWidget'
        } ]"
            <%-- This is the compressed version for speed --%>
            src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js"></script>
            <%-- This is the uncompressed version for debugging --%>
            <%--src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js.uncompressed.js"></script>--%>
    <script>
        require(["dojo/dom", "dojo/request", "dojo/json",
            "dojo/_base/array", "dojo/domReady!"], function(dom, request, JSON, arrayUtil){
            // Put the response in the DOM
            var resultDiv = dom.byId("personData");

            // Request the JSON data from the server
            request.get("widget/person-data", {
                // Parse data from JSON to a JavaScript object
                handleAs: "json"
            }).then(function(data){
                        // Display the data sent from the server
                        resultDiv.innerHTML = "Name:" + data.name + "<br />" + "Age:" + data.age + "<br />" + "State:" + data.state;
                    },
                    function(error){
                        // Display the error returned
                        resultDiv.innerHTML = error;
                    });
        });

		// Person Widget
		require(["dojo/dom",
			"PersonWidget/PersonWidget",
			"dojo/parser",
			"dojo/domReady!"], function(dom, PersonWidget, parser) {
			//parser.parse();
		});
    </script>
