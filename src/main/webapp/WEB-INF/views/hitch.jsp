<div>
    <div>
    First Argument: <span id="num1">1</span>
    </div>
    <div>
    Second Argument:  <span id="num2">2</span>
    </div>
</div>
<div>
    <div>
    First, we illustrate incorrect usage:
    </div>
    <div>
    First attempt: <span id="result1"></span>
    </div>
</div>
<div>
    <div>
    Now, we illustrate correct usage:
    </div>
    <div>
    Second attempt: <span id="result2"></span>
    </div>
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
    require(["dojo/dom", "dojo/_base/lang",
        "dojo/domReady!"], function (dom, lang) {
        var arg1 = dom.byId("num1");
        var arg2 = dom.byId("num2");
        var result1 = dom.byId("result1");
        var result2 = dom.byId("result2");

        // Simple object with some methods
        var theAccumulator = {
            total: 0,
            clear: function () {
                this.total = 0;
            },
            add: function (x) {
                this.total += x;
            },
            getResult: function () {
                return this.total;
            }
        };

        // Do some simple stuff on the accumulator
        theAccumulator.clear();
        theAccumulator.add(arg1);
        theAccumulator.add(arg2);

        // Define a simple function
        function printResult(f) {
            console.debug(f);
            result2.innerHTML = f();
        }

        // Call the function above
        // First erroneous attempt
        //printResult(theAccumulator.getResult());
        printResult(function() {
            console.debug(theAccumulator.getResult());
            return theAccumulator.getResult()
        });
    });

</script>

