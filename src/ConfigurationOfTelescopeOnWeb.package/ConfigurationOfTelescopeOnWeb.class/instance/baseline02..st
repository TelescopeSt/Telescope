baselines
baseline02: spec
	<version: '0.2-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec
				project: 'Telescope'
					with: [ 
							spec
								className: #ConfigurationOfTelescope;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ];
				project: 'Neo'
					with: [ 
							spec
								className: #ConfigurationOfNeoJSON;
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main' ];
				project: 'MochaJSTest'
					with: [ 
							spec
								className: #ConfigurationOfMochaJSTest;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/PharoExtras/MochaJSTest/main' ];
				project: 'Seaside3'
					with: [ 
							spec
								className: 'ConfigurationOfSeaside3';
								version: #'release3.2';
								repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ];
				project: 'MaterialDesign'
					with: [ 
							spec
								className: 'ConfigurationOfMaterialDesignLite';
								version: #'development';
								repository: 'http://smalltalkhub.com/mc/KevinLanvin/MaterialDesignLite/main' ].
			spec repository: 'http://mc.stfx.eu/ZincHTTPComponents'.
			spec package: 'Zinc-WebSocket-Core'.
			spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
			spec package: 'Telescope-Cytoscape-Libraries' with: [ spec requires: #('Seaside3') ].
			spec
				package: 'Telescope-Cytoscape'
				with: [ spec requires: #('Telescope' 'Zinc-WebSocket-Core' 'Telescope-Cytoscape-Libraries' 'Neo') ].
			spec
				package: 'Telescope-Demo-Cytoscape'
				with: [ spec requires: #('Telescope-Cytoscape' 'MaterialDesign') ].
			spec package: 'Telescope-Cytoscape-Tests' with: [ spec requires: #('Telescope-Cytoscape' 'MochaJSTest') ].
			spec group: 'Core' with: #('Telescope-Cytoscape').
			spec group: 'default' with: #('Core' 'Telescope-Cytoscape-Tests').
			spec group: 'demo' with: #('default' 'Telescope-Demo-Cytoscape') ]