baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'developpement version'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/14/2014 14:42'.
		spec repository: 'http://smalltalkhub.com/mc/LeoPerard/Telescope/main/'.
		spec project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/' ].
		spec 
			package: 'Telescope';
			package: 'Telescope-Tests';
			package: 'XMenuModel'.
		spec 
			group: 'Vizualisation' with: #('Telescope' 'XMenuModel' );
			group: 'Menu' with: #('XMenuModel' );
			group: 'Tests' with: #('Telescope-Tests' ). ].
