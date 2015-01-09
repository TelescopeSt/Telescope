versions
version0541: spec
	<version: '0.5.4.1' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.4.1'.
		spec author: 'LeoPerard'.
		spec timestamp: '5/5/2014 10:22'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.27';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].
