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
				name: 'demo/demo-layer.js',
				/*exclude: [ 'dojo/demo/demo-layer' ],*/ // Note, the prefix comes from releaseName! -scott smith
				dependencies: ['dojo/demo/demo-layer']
			},
			{
				name: 'PersonWidget/PersonWidget.js',
				layerDependencies: [ 'dojo/demo/demo-layer.js' ],
				dependencies: ['dojo/PersonWidget/PersonWidget']
			}
		],

		prefixes: [
			[ 'dijit', '../dijit' ],
			[ 'dojox', '../dojox' ],
			[ 'demo', '../../../js/demo' ],
			[ 'PersonWidget', '../../../js/PersonWidget' ],
			[ 'css', '../../../css' ],
			[ 'images', '../../../images']
		]
	}


