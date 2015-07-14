versions
version010: spec
	<version: '0.10' imports: #('1.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.10'.
		spec author: 'GuillaumeLarcheveque'.
		spec timestamp: '7/14/2015 08:47'.
		spec 
			project: 'BabyMock2' with: '2.0';
			project: 'Geometry' with: '0.1-baseline';
			project: 'Stylesheet' with: '0.2-baseline';
			project: 'RoassalForTelescope' with: '2.0'.
		spec 
			package: 'XMenuModel' with: 'XMenuModel-VincentBlondeau.2';
			package: 'Telescope' with: 'Telescope-GuillaumeLarcheveque.394';
			package: 'Telescope-Tests' with: 'Telescope-Tests-GuillaumeLarcheveque.61';
			package: #Roassal2 with: 'Roassal2-AlexandreBergel.913'. ].
