<div>
    First the long old fashioned way...
    <ul id="listOfUrls1" ></ul>
</div>

<div>
    Now with Dojo!
    <ul id="listOfUrls2" ></ul>
</div>

    <%--<script src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js" data-dojo-config="async: true" ></script> --%>

    <!-- blank.html is not yet defined in this application -->
<script data-dojo-config="async: 1, dojoBlankHtmlUrl: '/blank.html', parseOnLoad: false,
        packages: [ {
            name: 'demo',
            location: location.pathname.replace(/\/[^/]+$/, '') + '/resources/js/demo'
        } ]"
<%-- This is the compressed version for speed --%>
        src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js"></script>
            <%-- This is the uncompressed version for debugging --%>
            <%--src="//ajax.googleapis.com/ajax/libs/dojo/1.10.2/dojo/dojo.js.uncompressed.js"></script>--%>
<script>
    require(["dojo/dom", "dojo/string", "dojo/_base/array", "dojo/dom-construct",
        "dojo/domReady!"], function (dom, string, array, domConstruct) {
        // Some dummy URLs
        var urls = [
            {url: "http://google.com", title: "Google"},
            {url: "http://yahoo.com", title: "Yahoo"},
            {url: "http://ask.com", title: "Ask"}
        ];

        // The long old fashioned way
        var listNode1 = document.getElementById("listOfUrls1");
        for (var i = 0; i < urls.length; ++i) {
            var listItem = document.createElement("li");
            listItem.innerHTML = "<a href='" + urls[i].url + "'>" + urls[i].title + "</a>";
            listNode1.appendChild(listItem);
        }

        // Now we use Dojo!
        // This example raises an interesting issue with using Dojo substitution syntax in a JSP.  Notice the backslash
        // in front of the $ sign.  If that is not done, JSP EL will set those values and in this example they are empty!
        // Forgetting to put the \$ instead of just $ will make it appear that Dojo is not working!
        var listNode2 = dom.byId("listOfUrls2");
        array.forEach(urls, function(url) {
            var content = string.substitute("<a href='\${url}'>\${title}</a>", url);
            domConstruct.create("li", { innerHTML: content }, listNode2);
        });
    });

</script>

