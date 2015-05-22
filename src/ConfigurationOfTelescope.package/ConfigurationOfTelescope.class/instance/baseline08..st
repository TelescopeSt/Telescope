baselines
baseline08: spec
	<version: '0.8-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
		spec 
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassalForTelescope;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ];
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
					repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main/' ].
		spec 
			package: 'Telescope' with: [
				spec requires: #('Stylesheet' 'Geometry' 'RoassalForTelescope' 'XMenuModel' ). ];
			package: 'XMenuModel';
			package: 'Telescope-Tests' with: [
				spec requires: #('Telescope' 'BabyMock2' ). ]. ].
