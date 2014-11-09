/**
 * Javascript Widget Source for PersonWidget
 * @author Richard Scott Smith
 */

define([
	"dojo/_base/declare",
	"dijit/_WidgetBase",
	"dijit/_TemplatedMixin",
	"dijit/_WidgetsInTemplateMixin",
	"dojo/text!./templates/PersonWidget.html"],
	function (declare, _WidgetBase, _TemplateMixin, _WidgetsInTemplateMixin, template) {
		return declare("PersonWidget/PersonWidget", [_WidgetBase, _TemplateMixin, _WidgetsInTemplateMixin], {
			templateString: template,
			widgetsInTemplate: true,
			imageBaseUrl: './templates/icon-2.png'

			/*// Some default values for our author
			// These typically map to whatever you're handing into the constructor
			name: "No Name",
			// Using dojo.moduleUrl, we can get a path to our AuthorWidget's space
			// and we want to have a default avatar, just in case
			avatar: dojo.moduleUrl("custom.AuthorWidget", "images/defaultAvatar.png"),
			bio: "",

			// Our template - important!
			templateString:
				dojo.cache("custom.AuthorWidget", "templates/AuthorWidget.html"),

			// A class to be applied to the root node in our template
			baseClass: "authorWidget",

			// A reference to our background animation
			mouseAnim: null,

			// Colors for our background animation
			baseBackgroundColor: "#fff",
			mouseBackgroundColor: "#def"*/
		});
	}
);
