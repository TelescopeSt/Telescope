baselines
baseline03: spec
	<version: '0.3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/LeoPerard/Telescope/main/'.
		spec project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/' ].
		spec 
			package: 'Telescope';
			package: 'Telescope-Tests';
			package: 'XMenuModel';
			package: 'Moose-Algos-Kontractor'.
		spec 
			group: 'Vizualisation' with: #('Telescope' 'XMenuModel' );
			group: 'Menu' with: #('XMenuModel' );
			group: 'Tests' with: #('Telescope-Tests' );
			group: 'Tools' with: #('Moose-Algos-Kontractor' ). ].
