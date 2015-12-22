versions
version075: spec
	<version: '0.75' imports: #('1.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.75'.
		spec author: 'UsmanBhatti'.
		spec timestamp: '12/22/2015 15:47'.
		spec 
			project: 'BabyMock2' with: '2.0';
			project: 'Geometry' with: '0.1-baseline';
			project: 'Stylesheet' with: '0.2-baseline';
			project: 'RoassalForTelescope' with: '2.0'.
		spec 
			package: 'XMenuModel' with: 'XMenuModel-VincentBlondeau.2';
			package: 'Telescope' with: 'Telescope-usmanbhatti.416';
			package: 'Telescope-Tests' with: ' Telescope-Tests-guillaumelarcheveque.71'. ].
