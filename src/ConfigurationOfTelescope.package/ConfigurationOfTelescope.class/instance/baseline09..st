baselines
baseline09: spec
	<version: '0.9-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
		spec 
			project: 'BabyMock2' with: [
				spec
					className: #ConfigurationOfBabyMock2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
			project: 'Geometry' with: [
				spec
					className: #ConfigurationOfGeometry;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/NataliaTymchuk/Geometry/main/' ];
			project: 'Stylesheet' with: [
				spec
					className: #ConfigurationOfStylesheet;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main/' ];
			project: 'RoassalForTelescope' with: [
				spec
					className: #ConfigurationOfRoassalForTelescope;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ].
		spec 
			package: 'XMenuModel';
			package: 'Telescope' with: [
				spec requires: #('Stylesheet' 'Geometry' 'XMenuModel' 'RoassalForTelescope' ). ];
			package: 'Telescope-Tests' with: [
				spec requires: #('Telescope' 'BabyMock2' ). ];
			package: #Roassal2 with: 'Roassal2-AlexandreBergel.913'.  ].
