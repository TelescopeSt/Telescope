versions
version02: spec
	<version: '0.2' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.2'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/14/2014 14:43'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.11';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.1';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].
