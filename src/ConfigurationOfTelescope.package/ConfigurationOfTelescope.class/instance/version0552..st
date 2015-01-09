versions
version0552: spec
	<version: '0.5.5.2' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.5.2'.
		spec author: 'LeoPerard'.
		spec timestamp: '5/14/2014 17:33'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.28';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].
