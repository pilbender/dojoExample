// Classes

// Explain why this is here, remember only "define" and "require" are available by default.
require(["dojo/_base/declare"], function (declare) {

	// Create a new class named "mynamespace.MyClass", no inheritance
	declare("mynamespace.MyClass", null, {

		// Custom properties and methods here

	});

	// Create a scoped, anonymous class, no inheritance
	var MyClass = declare(null, {

		// Custom properties and methods here

	});

	// Class with inheritance from MyClass
	var MySubClass = declare(MyClass, {

		// MySubClass now has all of MyClass's properties and methods
		// These properties and methods override parent's

	});

	var MyOtherClass = declare(null, {});
	var MyMixinClass = declare(null, {});

	// Class with multiple inheritance, MyOtherClass and MyMixinClass are mixins.
	// MySubClass is the base prototype.  In the event of a naming collision, the last
	// one specified wins.
	var MyMultiSubClass = declare([
		MySubClass,
		MyOtherClass,
		MyMixinClass
	], {

		// MyMultiSubClass now has all of the properties and methods from:
		// MySubClass, MyOtherClass, and MyMixinClass

	});

	// TODO: Move this to a new file.
	// Create a new class with declare
	var Twitter = declare(null, {
		// The default username
		username: "defaultUser",

		// The constructor
		constructor: function (args) {
			declare.safeMixin(this, args);
		}
	});
	// Create 2 instances of this new class, one without setting anything,
	// one with setting a new instances state.
	var myInstance1 = new Twitter();
	var myInstance2 = new Twitter({
		username: "sitepen"
	});

	// TODO: Move this to a new file.  Then we need to use it to add functionality to the page.
	var MyClass = declare(null, {
		primitiveVal: 5,
		objectVal: [1, 2, 3]
	});

	var obj1 = new MyClass();
	var obj2 = new MyClass();

	// both return the same value from the prototype
	obj1.primitiveVal === 5; // true
	obj2.primitiveVal === 5; // true

	// obj2 gets its own property (prototype remains unchanged)
	obj2.primitiveVal = 10;

	// obj1 still gets its value from the prototype
	obj1.primitiveVal === 5; // true
	obj2.primitiveVal === 10; // true

	// both point to the array on the prototype,
	// neither instance has its own array at this point
	obj1.objectVal === obj2.objectVal; // true

	// obj2 manipulates the prototype's array
	obj2.objectVal.push(4);
	// obj2's manipulation is reflected in obj1 since the array
	// is shared by all instances from the prototype
	obj1.objectVal.length === 4; // true
	obj1.objectVal[3] === 4; // true

	// only assignment of the property itself (not manipulation of object
	// properties) creates an instance-specific property
	obj2.objectVal = [];
	obj1.objectVal === obj2.objectVal; // false

	// To avoid inadvertently sharing arrays or objects among all instances,
	// object properties should be declared with null values and initialized
	// in the constructor function:
	declare(null, {
		// not strictly necessary, but good practice
		// for readability to declare all properties
		memberList: null,
		roomMap: null,

		constructor: function () {
			// initializing these properties with values in the constructor
			// ensures that they ready for use by other methods
			// (and are not null or undefined)
			this.memberList = [];
			this.roomMap = {};
		}
	});

	// Inherited arguments, this.inherited can be called anywhere but should not
	// be called from the constructor.
	// Define class A
	var A = declare(null, {
		myMethod: function(){
			console.log("Hello!");
		}
	});

	// Define class B
	var B = declare(A, {
		myMethod: function(){
			// Call A's myMethod
			this.inherited(arguments); // arguments provided to A's myMethod
			console.log("World!");
		}
	});

	// Create an instance of B
	var myB = new B();
	myB.myMethod();


// Would output:
//      Hello!
//      World!
});
