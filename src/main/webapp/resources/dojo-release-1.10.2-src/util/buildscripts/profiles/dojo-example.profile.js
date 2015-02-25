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
				name: 'dojo/demo',
				exclude: [ 'dojo/demo/demo-layer' ], // Note, the prefix comes from releaseName! -scott smith
				dependencies: ['dojo/demo/demo-layer']
			},
		],

		prefixes: [
			[ 'dijit', '../dijit' ],
			[ 'dojox', '../dojox' ],
			[ 'demo', '../../../js/demo' ],
			[ 'css', '../../../css' ],
			[ 'images', '../../../images']
		]
	}


