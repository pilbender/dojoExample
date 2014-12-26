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
        First method fires everything in the Accumulator with hitch.  As we'll see in the next example it is not completely
        necessary to use hitch to fire things in the Accumulator. The button event handler (callback) uses Dojo hitch
        because it must.  Try changing the code to not use it.
    </div>
    <div>
        <button id="attempt1">Fire Event</button>
        First attempt: <span id="result1"></span>
    </div>
</div>
<hr />
<div>
    <div>
        Second method fires everything except the button event handler (callback) without hitch.  The button still must use
        Dojo hitch.  Try changing the code to not use it.
    </div>
    <div>
        <button id="attempt2">Fire Event</button>
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
        And now we'll do the same example again but we'll bind a different context to the execution (button click) with hitch.
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
    require(["dojo/dom", "dojo/_base/lang", "dojo/on", "dojo/number",
        "dojo/domReady!"], function (dom, lang, on, number) {
        var arg1 = number.parse(dom.byId("num1").innerHTML);
        var arg2 = number.parse(dom.byId("num2").innerHTML);
        var result1 = dom.byId("result1");
        var result2 = dom.byId("result2");

        // Simple object with some methods
        var theAccumulator = {
            total: 0,
            clear: function () {
                this.total = 0;
            },
            add: function (x) {
                console.debug("theAccumulator add x: " + x);
                this.total += x;
                console.debug("theAccumulator add total: " + this.total);
            },
            getResult1: function () {
                console.debug("theAccumulator getResult1 total: " + this.total);
                return this.total;
            },
            getResult2: function (arg1, arg2) {
                this.total = arg1 + arg2;
                return this.total;
            }
        };

        // Define a simple function
        // TODO: Should hitchMeUp1 and hitchMeUp2 be in a closure inside of "on"?
        function hitchMeUp1 (arg1, arg2) {
            // Do some simple stuff on the accumulator
            // What's interesting about this is the trailing parentheses. hitch returns a function!
            lang.hitch(theAccumulator, "clear")();
            lang.hitch(theAccumulator, "add", arg1)();
            lang.hitch(theAccumulator, "add", arg2)();
            var total1 = lang.hitch(theAccumulator, "getResult1")();
            console.debug("hitchMeUp1 arg1: " + arg1);
            console.debug("hitchMeUp1 arg2: " + arg2);
            console.debug("hitchMeUp1 total1: " + total1);
            result1.innerHTML = total1;
        };

        //on(attempt1, "click", hitchMeUp1(arg1, arg2)); // This causes it to just fire, instead of firing on click!
        on(attempt1, "click", lang.hitch(this, hitchMeUp1, arg1, arg2));

        // Define another simple function, similar to the above without hitch
        var hitchMeUp2 = function (arg1, arg2) {
            theAccumulator.clear();
            theAccumulator.add(arg1);
            theAccumulator.add(arg2);
            var total2 = theAccumulator.getResult1();
            //var total2 = theAccumulator.getResult2(arg1, arg2);
            console.debug("hitchMeUp2 arg1: " + arg1);
            console.debug("hitchMeUp2 arg2: " + arg2);
            console.debug("hitchMeUp2 total2: " + total2);
            result2.innerHTML = total2;
        };

        //on(attempt2, "click", hitchMeUp2(arg1, arg2)); // This causes it to just fire, instead of firing on click!
        on(attempt2, "click", lang.hitch(this, hitchMeUp2, arg1, arg2));
    });
</script>
<script>
    // TODO: What about these closures and name spacing?  Why can't we reuse the variable names?  What's wrong with this code in general?
    require(["dojo/dom", "dojo/_base/lang", "dojo/on",
        "dojo/domReady!"], function (dom, lang, on) {

        var result3 = dom.byId("result3");
        var attempt3 = dom.byId("attempt3");

        var processEvent = function(e) {
            this.result3.innerHTML = "Fail!";
        };

        on(attempt3, "click", processEvent);
        //console.debug("Value of this: " + this);
    });
</script>
<script>
    require(["dojo/dom", "dojo/_base/lang", "dojo/on",
        "dojo/domReady!"], function (dom, lang, on) {

        var result4 = dom.byId("result4");
        var attempt4 = dom.byId("attempt4");

        var processEvent = function(e) {
            this.result4.innerHTML = "Success!";
        };

        on(attempt4, "click", lang.hitch(this, processEvent));
        //console.debug("Value of this: " + this);
    });
</script>


