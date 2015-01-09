versions
version05531: spec
	<version: '0.5.5.31' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.5.31'.
		spec author: 'LeoPerard'.
		spec timestamp: '5/21/2014 11:45'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.30';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].
