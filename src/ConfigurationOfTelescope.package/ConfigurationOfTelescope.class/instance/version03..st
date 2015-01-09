versions
version03: spec
	<version: '0.3' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.3'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/17/2014 10:14'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.13';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].
