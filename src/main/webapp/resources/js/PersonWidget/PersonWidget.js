/**
 * Javascript Widget Source for PersonWidget
 * @author Richard Scott Smith
 */

define([
	"dojo/_base/declare",
	"dojo/request",
	"dijit/_WidgetBase",
	"dijit/_TemplatedMixin",
	"dojo/text!./templates/PersonWidget.html"
], function(declare, request, _WidgetBase, _TemplatedMixin, template){
	// TODO: I do not yet understand why the return value is used in this case and not in others.
	return declare("PersonWidget", [_WidgetBase, _TemplatedMixin], {
		// Some default values for our author
		// These typically map to whatever you're passing to the constructor
		name: "No Name",
		age: "No Age",
		state: "No State",

		// Accessors and Mutators
		// TODO: These getters and setters can be deleted.  They are not being used right now.
		_getNameAttr: function () {
			return this.name;
		},
		_setNameAttr: function (name) {
			this.name = name;
		},

		// Our template - important!
		templateString: template,

		// A class to be applied to the root node in our template
		baseClass: "personWidget",

		// TODO: This is starting to seem like a bad idea.  It can be completely deleted.
		// Make the AJAX call to the service
		postCreate: function () {
			// Essential to keeping a reference to the _Widget predefined dom node.  Once we're in this closure, we
			// can't get to it.
			var domNode = this.domNode;
			var name = this.domNode.nameNode;

			request("widget/person-data", {
				handleAs: "json"
			}).then(function (dummyData) {
				// Get a reference to our container
				//var personContainer = dom.byId("personWidget");
				//personContainer.innerHTML = "Illustrating that you can grab data and put it in the attach point manually, like this: " + dummyData.name;

				// Create our widget and place it
				//personContainer.innerHTML = "";  // TODO: Seems like there ought to be a better way to clear the dom.
				//var widget = new PersonWidget(dummyData).placeAt(personContainer);
				console.debug("name: " + name);
				console.debug("this.name: " + this.name);
				console.debug("domNode: " + domNode.toString());
				this.name.innerHTML = dummyData.name;
				console.debug("name: " + name);
				console.debug("this.name: " + this.name);
				age = dummyData.age;
				state = dummyData.state;
				//widget.startup(); // TODO: Not needed here, but it is considered a best practice to have it.
			});
		}
	});
});

