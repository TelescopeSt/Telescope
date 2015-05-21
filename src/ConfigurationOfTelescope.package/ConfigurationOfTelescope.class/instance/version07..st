versions
version07: spec
	<version: '0.7' imports: #('0.7-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.7'.
		spec author: 'GuillaumeLarcheveque'.
		spec timestamp: '5/21/2015 16:49'.
		spec 
			project: 'Roassal2' with: '1.0';
			project: 'BabyMock2' with: '2.0';
			project: 'Geometry' with: '0.1-baseline'.
		spec 
			package: 'Telescope' with: 'Telescope-GuillaumeLarcheveque.350';
			package: 'XMenuModel' with: 'XMenuModel-VincentBlondeau.2';
			package: 'Telescope-Tests' with: 'Telescope-Tests-GuillaumeLarcheveque.48'. ].
