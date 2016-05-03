versions
version076: spec
	<version: '0.76' imports: #('1.01-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.76'.
		spec author: 'UsmanBhatti'.
		spec timestamp: '05/03/2016 16:47'.
		spec 
			project: 'BabyMock2' with: '2.0';
			project: 'Geometry' with: '0.1-baseline';
			project: 'Stylesheet' with: '0.2-baseline';
			project: 'RoassalForTelescope' with: '2.0'.
		spec 
			package: 'XMenuModel' with: 'XMenuModel-VincentBlondeau.2';
			package: 'Telescope' with: 'Telescope-NicolasAnquetil.440';
			package: 'Telescope-Tests' with: 'Telescope-Tests-GuillaumeLarcheveque.75'; 
			package: 'Telescope-Roassal2' with: 'Telescope-Roassal2-NicolasAnquetil.4';
			package: 'Telescope-Roassal2-Tests' with: 'Telescope-Roassal2-Tests-GuillaumeLarcheveque.1'].
