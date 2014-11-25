/**
 * Javascript Widget Source for PersonWidget
 * @author Richard Scott Smith
 */

define([
	"dojo/_base/declare",
	"dojo/dom-construct",
	"dojo/dom",
	"dijit/_WidgetBase",
	"dijit/_TemplatedMixin",
	"dojo/text!./templates/PersonWidget.html",
	"dojo/domReady!"],
	function (declare, domConstruct, dom, _WidgetBase, _TemplatedMixin, template) {
		return declare("PersonWidget.PersonWidget", [_WidgetBase, _TemplatedMixin], {

			templateString: dojo.cache("PersonWidget", "templates/PersonWidget.html"),
			store: undefined,
			type: undefined,
			query: "person-data",
			imageBaseUrl: './templates/icon-2.png',
			sort: undefined,

			create: function() {
				this.inherited(arguments);
			},

			update: function() {
				if(this.type) {
					require([this.type], dojo.hitch(this, function(type) {
						domConstruct.empty(this.contentNode);

						if(this.store) {
							var results = this.store.query(this.query);
							results.forEach(dojo.hitch(this, function(result, i) {
								var div = domConstruct.create("div", null, this.contentNode);
								new type({json:result}).placeAt(div);
							}));
						}
					}));
				}
			}

		});
	}
);

