<p>Classes</p>
<button id="log-it">Log It!</button>

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
    require([
        "demo/classes"
    ], function() {

    });

    // TODO: Fix this so it works (console.log) when you press the button and adds the label
    require([
            "demo/customButtonClass",
            "dojo/dom",
            "dojo/domReady!"
    ], function(dom) {
        var myButton = new mynamespace.Button();
    });

    /*define([
        "dojo/_base/declare",
        "dijit/form/Button"
    ], function(declare, Button){
        return declare("mynamespace.Button", Button, {
            label: "My Button",
            onClick: function(evt){
                console.log("I was clicked!");
                this.inherited(arguments);
            }
        });
    });
    var myButton = new mynamespace.Button();*/

</script>