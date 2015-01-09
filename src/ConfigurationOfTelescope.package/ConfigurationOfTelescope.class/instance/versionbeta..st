versions
versionbeta: spec
	<version: 'beta' imports: #('0.6-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version beta'.
		spec author: 'LeoPerard'.
		spec timestamp: '7/24/2014 18:05'.
		spec 
			project: 'Roassal2' with: '1.0';
			project: 'BabyMock2' with: '2.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.272';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.21'. ].
