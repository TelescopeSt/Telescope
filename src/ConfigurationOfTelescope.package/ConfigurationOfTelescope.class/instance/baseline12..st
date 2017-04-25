baselines
baseline12: spec
	<version: '1.2-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
			spec
				project: 'BabyMock2'
					with: [ 
							spec
								className: #ConfigurationOfBabyMock2;
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
			project: 'MooseAlgos' with: [
				spec
					className: #ConfigurationOfMooseAlgos;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/MooseAlgos/main/' ];
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
				project: 'MaterialDesignLite'
					with: [ 
							spec
								className: #ConfigurationOfMaterialDesignLite;
								versionString: #bleedingEdge;
								loads: #('colors');
								repository: 'http://smalltalkhub.com/mc/KevinLanvin/MaterialDesignLite/main/' ];
				project: 'TelescopeLayouts'
					with: [ 
							spec
								className: #ConfigurationOfTelescopeLayouts;
								versionString: #bleedingEdge;
								repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ].
			spec
				package: 'XMenuModel';
				package: 'Telescope'
					with: [ spec requires: #('Stylesheet' 'Geometry' 'XMenuModel' 'MaterialDesignLite' 'TelescopeLayouts' 'MooseAlgos') ];
				package: 'Telescope-Tests' with: [ spec requires: #('Telescope') ].
			spec group: 'Core' with: #('Telescope' 'XMenuModel') ]