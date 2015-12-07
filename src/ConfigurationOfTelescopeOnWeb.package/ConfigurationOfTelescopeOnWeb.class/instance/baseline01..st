baselines
baseline01: spec
	<version: '0.1-baseline'>
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
				project: 'Seaside3'
					with: [ 
							spec
								className: #ConfigurationOfSeaside3;
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main/' ].
			spec repository: 'http://mc.stfx.eu/ZincHTTPComponents'.
			spec package: 'Zinc-WebSocket-Core'.
			spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
			spec package: 'Telescope-Cytoscape' ]