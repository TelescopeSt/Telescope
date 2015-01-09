versions
version044: spec
	<version: '0.4.4' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.4.4'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/22/2014 11:57'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.17';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1';
			package: 'Moose-Algos-Kontractor' with: 'Moose-Algos-Kontractor-LeoPerard.4'. ].
