/**
 * Javascript Widget Source for PersonWidget
 * @author Richard Scott Smith
 */

define([
	"dojo/_base/declare",
	"dijit/_WidgetBase",
	"dijit/_TemplatedMixin",
	"dojo/text!./templates/PersonWidget.html"
], function(declare, _WidgetBase, _TemplatedMixin, template){
	// TODO: I do not yet understand why the return value is used in this case and not in others.
	return declare("PersonWidget", [_WidgetBase, _TemplatedMixin], {
		// Some default values for our author
		// These typically map to whatever you're passing to the constructor
		name: "No Name",
		age: "No Age",
		state: "No State",

		// Our template - important!
		templateString: template,

		// A class to be applied to the root node in our template
		baseClass: "personWidget"
	});
});

