baselines
baseline12: spec
	<version: '1.2-baseline'>

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
			project: 'MaterialDesignLite' with: [
				spec
					className: #ConfigurationOfMaterialDesignLite;
					versionString: #'bleedingEdge';
					loads: #('colors' );
					repository: 'http://smalltalkhub.com/mc/KevinLanvin/MaterialDesignLite/main/' ];
			project: 'Mocketry' with: [
				spec
					className: #ConfigurationOfMocketry;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main/' ].
		spec 
			package: 'XMenuModel';
			package: 'Telescope' with: [
				spec requires: #('Stylesheet' 'Geometry' 'XMenuModel' 'MaterialDesignLite' ). ];
			package: 'Telescope-Tests' with: [
				spec requires: #('Telescope' 'BabyMock2' 'Mocketry' ). ].
		spec 
			group: 'Core' with: #('Telescope' 'XMenuModel' );
			group: 'Tests' with: #('Telescope-Tests' );
			group: 'default' with: #('Core' ). ].
