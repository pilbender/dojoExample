	<hr />
	<p>First let's show an example of a non-widget version...</p>
    <p>
        <h3>Person Data</h3>
        <div id="personData">loading...</div>
    </p>
	<hr />
    <p>Simplist possible widget from _WidgetBase.  This would be a behavior only widget.  See the console debug to verify
    the widget was instantiated.</p>
    <span data-dojo-type="SimpleWidget">Simple Widget</span>
    <hr />
    <p>Simplist possible widget that creates its own DOM tree.  The DOM id is hard coded in the widget.</p>
    <div id="domTreeWidget">loading...</div>
    <hr />
    <p>Simple widget created with a templated mixin.</p>
    <div data-dojo-type="FancyCounter" data-dojo-props="label:'counter label'">button label</div>
    <hr />
	<p>Same as the first thing but created as a custom widget...</p>
	<p>
		<h3>Person Data</h3>
		<div data-dojo-id="personDataWidget" data-dojo-type="dojo/store/JsonRest"
                data-dojo-props="target: '/dojoExample/widget/person-data'">loading...</div>

		Widget Declaritive
		<%--<div data-dojo-id="personStore" data-dojo-type="dojo/store/JsonRest"
			 data-dojo-props="target: '/widget/person-data'"></div>
		<div data-dojo-type="PersonWidget/PersonWidget" data-dojo-props="store:personStore, type:'PersonWidget/PersonWidget', page:0, pageSize:7"></div>--%>
	</p>

    <!-- First, bring in the Dojo toolkit -->
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
        // This populates in the DOM in the traditional, way by manipulating the DOM after making an AJAX call.
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

		// Simplist possible widget which uses _WidgetBase
        require([
            "dojo/_base/declare", "dojo/parser", "dojo/ready",
            "dijit/_WidgetBase",
        ], function(declare, parser, ready, _WidgetBase){

            declare("SimpleWidget", [_WidgetBase], {
                // put methods, attributes, etc. here
            });
            ready(function(){
                // Call the parser manually so it runs after our widget is defined, and page has finished loading
                parser.parse();
                console.debug("done parsing");
            });
        });

        // Simplist widget which creates its own DOM tree
        // the parser is only needed, if you want
        // to instantiate the widget declaratively (in markup)
        require([
            "dojo/_base/declare", "dojo/dom-construct", "dojo/ready", "dojo/dom",
            "dijit/_WidgetBase",
        ], function(declare, domConstruct, ready, dom, _WidgetBase){

            declare("DomTreeWidget", [_WidgetBase], {
                buildRendering: function(){
                    // create the DOM for this widget
                    this.domNode = domConstruct.create("button", {innerHTML: "push me"});
                }
            });

            ready(function(){
                // Create the widget programmatically and place in DOM
                var domTreeWidgetId = dom.byId("domTreeWidget");
                (new DomTreeWidget()).placeAt(domTreeWidgetId);
            });
        });

        // Same example with an HTML template.  This uses a templated mixin.
        require([
            "dojo/_base/declare", "dojo/parser", "dojo/ready",
            "dijit/_WidgetBase", "dijit/_TemplatedMixin"
        ], function(declare, parser, ready, _WidgetBase, _TemplatedMixin){

            declare("FancyCounter", [_WidgetBase, _TemplatedMixin], {
                // counter
                _i: 0,

                templateString: "<div>" +
                "<button data-dojo-attach-event='onclick: increment'>press me</button>" +
                "&nbsp; count: <span data-dojo-attach-point='counter'>0</span>" +
                "</div>",

                increment: function(){
                    this.counter.innerHTML = ++this._i;
                }
            });

            ready(function(){
                // Call the parser manually so it runs after our widget is defined, and page has finished loading
                parser.parse();
            });
        });

        // Person Widget

    </script>
