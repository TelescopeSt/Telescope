baselines
baseline101: spec
	<version: '1.01-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
			spec author: 'usmanbhatti'.
			spec description: 'fork baseline 10 because we need a version that corresponds to end feburary for Ada visualizations'.
			spec
				project: 'BabyMock2'
					with: [ 
							spec
								className: #ConfigurationOfBabyMock2;
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
				project: 'Geometry'
					with: [ 
							spec
								className: #ConfigurationOfGeometry;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/NataliaTymchuk/Geometry/main/' ];
				project: 'Stylesheet'
					with: [ 
							spec
								className: #ConfigurationOfStylesheet;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main/' ];
				project: 'RoassalForTelescope'
					with: [ 
							spec
								className: #ConfigurationOfRoassalForTelescope;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ].
			spec
				package: 'XMenuModel';
				package: 'Telescope' with: [ spec requires: #('Stylesheet' 'Geometry' 'XMenuModel' 'RoassalForTelescope') ];
				package: 'Telescope-Tests' with: [ spec requires: #('Telescope' 'BabyMock2') ];
				package: 'Telescope-Roassal2' with: [ spec requires: #('Telescope') ];
				package: 'Telescope-Roassal2-Tests' with: [ spec requires: #('Telescope-Roassal2') ].
			spec
				repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main';
				package: #Roassal2 ]