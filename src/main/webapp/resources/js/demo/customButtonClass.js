// Custom button Class which inherits from dijit/form/Button

define([
	"dojo/_base/declare",
	"dijit/form/Button",
	"dojo/on", // Events
	"dojo/mouse"
], function (declare, Button, on, dom) {
	return declare("mynamespace.Button", Button) {
		label: "My Button",
		on(dom.byId("log-it"), "click", function (evt) {
			console.log("I was clicked!");
			this.inherited(arguments);
		});
	}
});

