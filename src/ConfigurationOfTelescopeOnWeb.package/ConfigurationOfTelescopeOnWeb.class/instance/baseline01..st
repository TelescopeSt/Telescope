baselines
baseline01: spec
	<version: '0.1-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec 
			project: 'Telescope' with: [
				spec
					className: #ConfigurationOfTelescope;
					versionString: #'development';
					loads: #( #Core );
					repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ];
				project: 'Seaside3'
					with: [ 
							spec
					className: 'ConfigurationOfSeaside3';
					version: #'release3.2';
					repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ].
			spec repository: 'http://mc.stfx.eu/ZincHTTPComponents'.
			spec package: 'Zinc-WebSocket-Core'.
			spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
			spec package: 'Telescope-Cytoscape' ]