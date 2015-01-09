versions
version041: spec
	<version: '0.4.1' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.4.1'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/18/2014 17:08'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.16';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].
