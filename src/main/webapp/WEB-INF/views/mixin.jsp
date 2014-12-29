    <p>
        Mixin examples
    </p>
    <p>
        <div id="myObject1">
            <div>myObject1</div>
            <div id="myObject1.prop1"></div>
            <div id="myObject1.prop2"></div>
            <div id="myObject1.prop3"></div>
        </div>
    </p>
    <hr />
    <p>
        <div id="myObject2">
            <div>myObject2</div>
            <div id="myObject2.prop1"></div>
            <div id="myObject2.prop2"></div>
            <div id="myObject2.prop3"></div>
        </div>
    </p>
    <hr />
    <p>
    <div id="myObject3">
        <div>myObject3</div>
        <div id="myObject3.prop1"></div>
        <div id="myObject3.prop2"></div>
        <div id="myObject3.prop3"></div>
    </div>
    </p>
    <hr />
    <p>
    <div id="myObject3">
        <div>myObject4 - Right most object properties win</div>
        <div id="myObject4.prop1"></div>
        <div id="myObject4.prop2"></div>
        <div id="myObject4.prop3"></div>
    </div>
    </p>
    <hr />

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
        require(["dojo/dom",
            "dojo/domReady!"], function(dom) {
            // TODO: Add mixin examples here.
            var myObject1 = {};
            var yourObject1 = {};
            myObject1.prop1 = 123.456;
            myObject1.prop2 = "hello, world 1";
            myObject1.prop3 = yourObject1;
            dom.byId("myObject1.prop1").innerHTML = myObject1.prop1;
            dom.byId("myObject1.prop2").innerHTML = myObject1.prop2;
            dom.byId("myObject1.prop3").innerHTML = myObject1.prop3;
        });
    </script>
    <script>
        require(["dojo/dom",
        "dojo/domReady!"], function(dom) {
            var myObject2 = {};
            var yourObject2 = {};
            dojo.mixin(myObject2, {
                prop1: 123.123,
                prop2: "hello, world 2",
                prop3: yourObject2
            });
            dom.byId("myObject2.prop1").innerHTML = myObject2.prop1;
            dom.byId("myObject2.prop2").innerHTML = myObject2.prop2;
            dom.byId("myObject2.prop3").innerHTML = myObject2.prop3;
        });
    </script>
    <script>
        require(["dojo/dom",
            "dojo/domReady!"], function(dom) {
            var myObject3 = {
                prop1: 456.456,
                prop2: "hello, world 3"
            };
            var yourObject3 = {
                prop3: "whatever"
            };
            dojo.mixin(myObject3, yourObject3);
            dom.byId("myObject3.prop1").innerHTML = myObject3.prop1;
            dom.byId("myObject3.prop2").innerHTML = myObject3.prop2;
            dom.byId("myObject3.prop3").innerHTML = myObject3.prop3;
        });
    </script>
    <script>
        require(["dojo/dom",
            "dojo/domReady!"], function(dom) {
            var myObject4 = {
                prop1: 789.789,
                prop2: "hello, world 4"
            };
            var yourObject3 = {
                prop2: "whatever"
            };
            dojo.mixin(myObject4, yourObject3);
            dom.byId("myObject4.prop1").innerHTML = myObject4.prop1;
            dom.byId("myObject4.prop2").innerHTML = myObject4.prop2;
            dom.byId("myObject4.prop3").innerHTML = myObject4.prop3;
        });
    </script>
