baselines
baseline07: spec
	<version: '0.7-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
			spec repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/'.
							spec
								package: 'Trachel' with: 'Trachel-akevalion.253';
								package: 'Roassal2' with: 'Roassal2-AlexandreBergel.705'.
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
					repository: 'http://smalltalkhub.com/mc/NataliaTymchuk/Geometry/main/' ].
		spec 
			package: 'Telescope';
			package: 'XMenuModel';
			package: 'Telescope-Tests'. ].
