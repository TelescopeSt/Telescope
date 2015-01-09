versions
version0501: spec
	<version: '0.5.0.1' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.0.1'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/24/2014 11:04'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.20';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].
