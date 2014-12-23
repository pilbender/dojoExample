<div>
    <div>
    First Argument: <span id="num1">1</span>
    </div>
    <div>
    Second Argument: <span id="num2">2</span>
    </div>
</div>
<hr />
<div>
    <div>
    First, we illustrate incorrect usage:
    </div>
    <div>
    First attempt: <span id="result1"></span>
    </div>
</div>
<hr />
<div>
    <div>
    Now, we illustrate correct usage:
    </div>
    <div>
    Second attempt: <span id="result2"></span>
    </div>
</div>
<hr />
<div>
    <div>
        Let's try another example.  Clicking the button will show nothing.  But opening the console log will show that
        "this.result3" is undefined.
    </div>
    <div>
        <button id="attempt3">Fire Event</button>
        Third attempt: <span id="result3"></span>
    </div>
</div>
<hr />
<div>
    <div>
        And now we'll do the same exmaple but we'll bind a different context to the execution with hitch.
    </div>
    <div>
        <button id="attempt4">Fire Event</button>
        Forth attempt: <span id="result4"></span>
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
        console.debug(theAccumulator.getResult());

        // Define a simple function
        var hitchMeUp =  lang.hitch(theAccumulator, function printResult() {
            theAccumulator.clear();
            theAccumulator.add(arg1);
            theAccumulator.add(arg2);
            var result = theAccumulator.getResult();
            console.debug(result);
            result1.innerHTML = result;
        });
        hitchMeUp();
    });
</script>
<script>
    // TODO: What about these closures and name spacing?  Why can't we reuse the variable names?
    require(["dojo/dom", "dojo/_base/lang", "dojo/on",
        "dojo/domReady!"], function (dom, lang, on) {

        var result3 = dom.byId("result3");
        var attempt3 = dom.byId("attempt3");

        var processEvent = function(e){
            this.result3.innerHTML = "Fail!";
        };

        on(attempt3, "click", processEvent);
    });
</script>
<script>
    require(["dojo/dom", "dojo/_base/lang", "dojo/on",
        "dojo/domReady!"], function (dom, lang, on) {

        var result4 = dom.byId("result4");
        var attempt4 = dom.byId("attempt4");

        var processEvent = function(e){
            this.result4.innerHTML = "Success!";
        };

        on(attempt4, "click", lang.hitch(this, processEvent));
    });
</script>


