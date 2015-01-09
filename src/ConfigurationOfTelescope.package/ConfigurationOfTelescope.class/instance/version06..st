versions
version06: spec
	<version: '0.6' imports: #('0.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.6'.
		spec author: 'LeoPerard'.
		spec timestamp: '6/24/2014 10:45'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-GuillaumeLarcheveque.208';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].
