baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
		spec 
			project: 'Telescope' with: [
				spec
					className: #ConfigurationOfTelescope;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/' ].
		spec package: #'Telescope-Roassal2' with: [
				spec requires: #('Telescope' 'Roassal2' ). ]. ].
