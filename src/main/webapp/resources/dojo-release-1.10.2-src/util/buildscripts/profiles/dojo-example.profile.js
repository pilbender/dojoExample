copyrightFile: '../../../documents/copyright.txt',
	dependencies = {

		action:'clean,release',
		optimize:'closure',
		layerOptimize:'closure',
		cssOptimize: true,
		releaseName:'dojo', // This name sucks and should be changed -scott smith
		releaseDir:'../../../dojobuild',
		mini:'true',
		internStrings: 'true',
		boot: true,
		stripConsole: 'normal',

		layers:  [
			{
				name: '../demo/demo-layer.js',
				/*exclude: [ 'dojo/demo/demo-layer' ],*/ // Note, the prefix comes from releaseName! -scott smith
				dependencies: ['demo/demo-layer' ]
			},
			{
				name: '../PersonWidget/PersonWidget.js',
				layerDependencies: [ '../demo/demo-layer.js' ],
				dependencies: ['PersonWidget/PersonWidget' ]
			}
		],

		prefixes: [
			[ 'dijit', '../dijit' ],
			[ 'dojox', '../dojox' ],
			[ 'demo', '../../../resources/js/demo' ],
			[ 'PersonWidget', '../../../resources/js/PersonWidget' ],
			[ 'css', '../../../resources/css' ],
			[ 'images', '../../../resources/images']
		]
	}


