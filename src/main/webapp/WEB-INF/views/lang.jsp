HTML stuff here.

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
    require(["dojo/_base/lang",
        "dojo/domReady!"], function (lang) {
        // Lang code here.
    });

</script>

