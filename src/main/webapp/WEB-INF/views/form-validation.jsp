<form>
    <div>
        <label for="firstName">First Name*</label>
        <input type="text" name="firstName" id="firstName" value="" />
    </div>
    <div>
        <label for="lastName">Last Name*</label>
        <input type="text" name="lastName" id="lastName" value="" />
        <div>
        </div>
        <label for="email">Email Address*</label>
        <input type="text" name="email" id="email" value="" />
    </div>
    <div>
        <label for="emailConfirm">Confirm Email*</label>
        <input type="text" name="emailConfirm" id="emailConfirm" value="" />
    </div>
    <div>
        <label for="password">Password*</label>
        <input type="password" name="password" id="password" value="" />
    </div>
    <div>
        <label for="password2">Confirm Password*</label>
        <input type="password" name="password2" id="password2" value="" />
    </div>
    <div>
        <label for="phone">Phone</label>
        <input type="text" name="phone" id="phone" value="" />
    </div>
    <input type="submit" value="Post!" />
</form>

<h3>Form Validation Results</h3>
<div id="result" ></div>

<%--<script src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js" data-dojo-config="async: true" ></script> --%>

    <!-- blank.html is not yet defined in this application -->
<script data-dojo-config="async: 1, dojoBlankHtmlUrl: '/blank.html', parseOnLoad: false,
        packages: [ {
            name: 'demo',
            location: location.pathname.replace(/\/[^/]+$/, '') + '/resources/js/demo'
        } ]"
<%-- This is the compressed version for speed --%>
        src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js"></script>
            <%-- This is the uncompressed version for debugging --%>
            <%--src="//ajax.googleapis.com/ajax/libs/dojo/1.9.2/dojo/dojo.js.uncompressed.js"></script>--%>
<script>
    require(["demo/formValidation"], function (formValidation) {
        console.debug("Begin Form Validation");
        formValidation.validateForm();
        console.debug("End Form Validation");
    });
</script>

