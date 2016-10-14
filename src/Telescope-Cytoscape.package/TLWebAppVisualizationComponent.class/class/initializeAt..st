as yet unclassified
initializeAt: aString
	| app |
	app := WAAdmin register: self asApplicationAt: aString.
	
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: CYSFileLibrary.