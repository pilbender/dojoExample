copyrightFile: "../../../documents/copyright.txt",
	dependencies ={

		layers:  [
			// OreillyCommonDojo Extension Layer
			{
				name: "../oDojo/OreillyCommonDojo.js",
				copyrightFile: "../../../documents/copyright.txt",
				dependencies: ["oDojo.OreillyCommonDojo"],
				exclude: [ "fco/fco-layer-1_10" ]
			},
			// whole enchilada custom layer
			{
				name: "../fco/fco-layer-1_10.js",
				/*layerDependencies:
					[
						"oDojo.OreillyCommonDojo"
					],*/
				copyrightFile: "../../../documents/copyright.txt",
				dependencies: ["fco.fco-layer-1_10"]
			}
		],

		prefixes: [
			[ "dijit", "../dijit" ],
			[ "dojox", "../dojox" ],
			[ "oDojo", "../../js/OreillyCommonDojoExtensions/oDojo", "../../../documents/copyright.txt"],
			[ "oDijit", "../../js/OreillyCommonDojoExtensions/oDijit", "../../../documents/copyright.txt"],
			[ "oDojox", "../../js/OreillyCommonDojoExtensions/oDojox", "../../../documents/copyright.txt"],
			/*[ "OreillyCommonDojoExtensions", "../../js/OreillyCommonDojoExtensions", "../../documents/copyright.txt"],*/
			[ "fco", "../../js/fco", "../../../documents/copyright.txt" ],
			[ "css", "../../css", "../../../documents/copyright.txt"],
			[ "images", "../../images"],
			[ "public/images", "../../public/images"]
		],

		releaseDir:"../../../dojobuild-1.10"

	};

