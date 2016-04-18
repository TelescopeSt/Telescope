baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
		spec project: 'BabyMock' with: [
				spec
					className: #ConfigurationOfBabyMock;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock/main/' ].
		spec 
			package: #'Telescope-Layouts';
			package: #'Telescope-Tests-Layouts' with: [
				spec requires: #(#'Telescope-Layouts' 'BabyMock' ). ]. ].
