/**
 * Javascript Widget Source for PersonWidget
 * @author Richard Scott Smith
 */

define([
	"dojo/_base/declare",
	"dojo/request",
	"dojo/query",
	"dojo/store/Memory",
	"dojo/store/JsonRest",
	"dojo/store/Observable",
	"dojo/when",
	"dojo/_base/lang",
	"dojo/dom-class",
	"dijit/_WidgetBase",
	"dijit/_TemplatedMixin",
	"dojo/text!./templates/PersonWidget.html"
], function(declare, request, query, Memory, JsonRest, Observable, when, lang, domClass, _WidgetBase, _TemplatedMixin, template){
	// TODO: I do not yet understand why the return value is used in this case and not in others.
	return declare("PersonWidget", [_WidgetBase, _TemplatedMixin], {
		// Some default values for our author
		// These typically map to whatever you're passing to the constructor
		name: "loading...",
		age: "loading...",
		state: "loading...",
		target: undefined, // No getter available if we removed this.  But we would still be able to execute the setTarget

		_setNameAttr: { node: "nameNode", type: "innerHTML" },
		_setAgeAttr: { node: "ageNode", type: "innerHTML" },
		_setStateAttr: { node: "stateNode", type: "innerHTML" },

		// Implicit, you do not have to define it!
		/*_getTargetAttr: function () {
			return this.target;
		},*/

		// Instead of passing the deferred into the widget externally.
		_setTargetAttr: function(target) {
			var store = new JsonRest({
				target: target
			});
			store.query().then(lang.hitch(this, function(result) {
				this.set("name", result.name);
				this.set("age", result.age);
				this.set("state", result.state);
			}));
		},

		/*store: null,
		_setStoreAttr: function (store) {
			// notify of a property change
			this._set('store', store);
			if (this.store) {
				this.render();
			}
		},

		render: function () {
			var self = this;
			// query for all items and render the results
			when(this.store.query()).then(function (results) {
				results.forEach(function (item) {
					self.renderItem(item);
				});
			});
		},

		renderItem: function (item) {
			// render an item
			console.debug(JSON.stringify(item));
		},*/

		// Accessors and Mutators
		// TODO: These getters and setters can be deleted.  They are not being used right now.
		/*_getNameAttr: function () {
			return this.name;
		},
		_setNameAttr: function (name) {
			this.name = name;
		},*/

		// Our template - important!
		templateString: template,

		// A class to be applied to the root node in our template
		baseClass: "personWidget",

		// TODO: This is starting to seem like a bad idea.  It can be completely deleted.
		// Make the AJAX call to the service
		postCreate: function () {
			// Essential to keeping a reference to the _Widget predefined dom node.  Once we're in this closure, we
			// can't get to it. Note, this doesn't seem to work as it should!
			//var domNode = this.domNode;
			//console.debug("domNode: " + JSON.stringify(domNode));

			/*
			request("widget/person-data", {
				handleAs: "json"
			}).then(function (dummyData) {
				// Get a reference to our container
				var personContainer = dom.byId("personWidget");

				// Create our widget and place it
			});
			*/

			/*
			var store = new JsonRest({
				target: "widget/person-data"
			});

			store.query().then(function(result) {
				console.debug("Query happened on postCreate: " + JSON.stringify(result));
			});
			*/

			// This is processor intensive because of being fired on each setter!
			this.watch(function(name, oldValue, value) {
				if (value && oldValue != value && this[name + "Node"]) {
					domClass.remove(this[name + "Node"], "hidden");
				}
			});
		}
	});
});

