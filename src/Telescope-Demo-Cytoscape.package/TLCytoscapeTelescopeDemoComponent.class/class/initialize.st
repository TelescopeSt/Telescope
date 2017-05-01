initialization
initialize
	| app |
	app := WAAdmin register: self asApplicationAt: 'TelescopeWebDemo'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: CYSFileLibrary;
		addLibrary: CYSDemoFileLibrary