<div>
    <p>Turn on the console log.  Interesting things can be done with define.</p>
</div>

    <%--<script src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js" data-dojo-config="async: true" ></script> --%>

    <!-- blank.html is not yet defined in this application -->
<script data-dojo-config="async: 1, dojoBlankHtmlUrl: '/blank.html', parseOnLoad: false,
        packages: [ {
            name: 'module',
            location: location.pathname.replace(/\/[^/]+$/, '') + '/resources/js/module'
        } ]"
<%-- This is the compressed version for speed --%>
        <%--src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js"></script>--%>
            <%-- This is the uncompressed version for debugging --%>
            <%--src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js.uncompressed.js"></script>--%>
        src="${pageContext.servletContext.contextPath}/resources/dojo-release-1.10.2-src/dojo/dojo.js"></script>
<script>
    // module/config.js
    // Using define can be as simple as providing an object
    //define({someProp: "someVal", otherProp: "otherVal"});

    // module/home.js
    // config.someProp and config.otherProp are available for use
    /*define(["./config"], function (config) {
        return {
            init: function () {
                console.log(config.someProp);
            }
        }
    });*/

    // main.js
    // The home module is available for use
    require(["module/home"], function (home) {
        home.init(); // logs "someVal"
    });
</script>

