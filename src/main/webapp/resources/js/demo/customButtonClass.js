// Custom button Class which inherits from dijit/form/Button

require([
	"dojo/_base/declare",
	"dijit/form/Button",
	"dojo/on", // Events
	"dojo/mouse"
], function (declare, Button, on, dom) {
	var MyButton = declare(digit.form.Button, {
		constructor: function () {
			label: "My Button",
				on(dom.byId("log-it"), "click", function (evt) {
					console.log("I was clicked!");
					this.inherited(arguments);
				});

		} // End constructor
	}); // End MyButton
});
