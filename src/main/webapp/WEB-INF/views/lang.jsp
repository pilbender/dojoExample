<p>Animal noise: <span id="noise"></span></p>
<p>Animal color: <span id="color"></span></p>
<p>Also view the console for additional information</p>

    <%--<script src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js" data-dojo-config="async: true" ></script> --%>

    <!-- blank.html is not yet defined in this application -->
<script data-dojo-config="async: 1, dojoBlankHtmlUrl: '/blank.html', parseOnLoad: false,
        packages: [ {
            name: 'demo',
            location: location.pathname.replace(/\/[^/]+$/, '') + '/resources/js/demo'
        } ]"
<%-- This is the compressed version for speed --%>
        <%--src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js"></script>--%>
            <%-- This is the uncompressed version for debugging --%>
            <%--src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js.uncompressed.js"></script>--%>
        src="${pageContext.servletContext.contextPath}/resources/dojo-release-1.10.2-src/dojo/dojo.js"></script>
<script>

    require(["dojo/_base/lang", "dojo/dom", "dojo/domReady!"
    ], function (lang, dom) {
        var animal = {
            noise: "Oink",
            makeNoise: function () {
                // Note, we're using dojo/dom simply to replace the
                // contents of a node
                dom.byId("noise").innerHTML += " " + this.noise;
                console.log(this.noise);
            }
        };


        // Write solutions here!
        //var makeNoise = animal.makeNoise;
        var makeNoise = lang.hitch(animal, "makeNoise");
        makeNoise();

        var dog = lang.delegate(animal, {noise: "woof"});
        dog.makeNoise();

        lang.mixin(animal, {
            color: "red",
            makeNoise: function () {
                dom.byId("noise").innerHTML += " " + this.noise;
                dom.byId("color").innerHTML += " " + this.color;
                console.log(this.noise);
                console.log(this.color);
            }
        });
        console.log(animal, dog);
        makeNoise();
        dog.makeNoise();
    });
</script>

