baselines
baseline02: spec
	<version: '0.2-baseline'>
	spec
		for: #common
		do: [ spec
				blessing: #baseline;
				repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
			spec
				project: 'Telescope'
					with: [ spec
						className: #ConfigurationOfTelescope;
						versionString: #development;
						repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ];
				project: 'Neo'
					with: [ spec
						className: #ConfigurationOfNeoJSON;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main' ];
				project: 'MochaJSTest'
					with: [ spec
						className: #ConfigurationOfMochaJSTest;
						versionString: #development;
						repository: 'http://smalltalkhub.com/mc/PharoExtras/MochaJSTest/main' ];
				project: 'Seaside3'
					with: [ spec
						className: 'ConfigurationOfSeaside3';
						version: #'release3.2';
						repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ];
				project: 'MaterialDesign'
					with: [ spec
						className: 'ConfigurationOfMaterialDesignLite';
						version: #development;
						repository: 'http://smalltalkhub.com/mc/KevinLanvin/MaterialDesignLite/main' ];
				project: 'WebSocket'
					with: [ spec
						className: 'ConfigurationOfZincHTTPComponents';
						version: '2.8.8';
						loads: #('WebSocket');
						repository: 'http://mc.stfx.eu/ZincHTTPComponents' ].
			spec
				package: 'Telescope-Cytoscape-Libraries' with: [ spec requires: #('Seaside3') ];
				package: 'Telescope-Cytoscape' with: [ spec requires: #('Telescope' 'WebSocket' 'Telescope-Cytoscape-Libraries' 'Neo') ];
				package: 'Telescope-Demo-Cytoscape' with: [ spec requires: #('Telescope-Cytoscape' 'MaterialDesign') ];
				package: 'Telescope-Cytoscape-Tests' with: [ spec requires: #('Telescope-Cytoscape' 'MochaJSTest') ].
			spec
				group: 'Core' with: #('Telescope-Cytoscape');
				group: 'default' with: #('Core' 'Telescope-Cytoscape-Tests');
				group: 'demo' with: #('default' 'Telescope-Demo-Cytoscape') ]