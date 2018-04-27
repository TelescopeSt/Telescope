Class {
	#name : #ConfigurationOfTelescope,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfTelescope'
}

{ #category : #'development support' }
ConfigurationOfTelescope class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfTelescope class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #metadata }
ConfigurationOfTelescope class >> catalogContactInfo [
	^ 'guillaume.larcheveque@synectique.eu'
]

{ #category : #metadata }
ConfigurationOfTelescope class >> catalogDescription [
	^ 'Telescope provides a system to express highly interactive software visualizations. It provides rich API to express interactive, dynamic, and customized visualizations built on top of Roassal.
	
	More information: http://rmod.inria.fr/web/software/telescope'
]

{ #category : #metadata }
ConfigurationOfTelescope class >> catalogKeyClassesAndExample [
	^ 'Todo'
]

{ #category : #metadata }
ConfigurationOfTelescope class >> catalogKeywords [
	^ #(visualization roassal cytoscape)
]

{ #category : #private }
ConfigurationOfTelescope class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfTelescope class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfTelescope class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfTelescope class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfTelescope class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfTelescope class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfTelescope class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfTelescope class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline01: spec [
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

]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline02: spec [
	<version: '0.2-baseline'>

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
			package: 'XMenuModel'.
		spec 
			group: 'Vizualisation' with: #('Telescope' 'XMenuModel' );
			group: 'Menu' with: #('XMenuModel' );
			group: 'Tests' with: #('Telescope-Tests' ). ].

]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline03: spec [
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

]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline04: spec [
	<version: '0.4-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/LeoPerard/Telescope/main/'.
		spec project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: '1.0';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/' ].
		spec 
			package: 'Telescope';
			package: 'Telescope-Tests';
			package: 'XMenuModel'.
		spec 
			group: 'Vizualisation' with: #('Telescope' 'XMenuModel' );
			group: 'Menu' with: #('XMenuModel' );
			group: 'Tests' with: #('Telescope-Tests' );
			group: 'Tools' with: #(). ].

]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline05: spec [
	<version: '0.5-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/LeoPerard/Telescope/main/'.
		spec project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: '1.0';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/' ].
		spec 
			package: 'Telescope';
			package: 'XMenuModel'. ].

]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline06: spec [
	<version: '0.6-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/LeoPerard/Telescope/main/'.
		spec 
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: '1.0';
					repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main/' ];
			project: 'BabyMock2' with: [
				spec
					className: #ConfigurationOfBabyMock2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ].
		spec 
			package: 'Telescope';
			package: 'XMenuModel';
			package: 'Telescope-Tests'. ].

]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline07: spec [
	<version: '0.7-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #'baseline'.
			spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
			spec
				project: 'Roassal2'
				with: [ 
					spec
								className: #ConfigurationOfRoassalForTelescope;
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ].
			spec
				project: 'BabyMock2'
					with: [ 
							spec
								className: #ConfigurationOfBabyMock2;
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
				project: 'Geometry'
					with: [ 
							spec
								className: #ConfigurationOfGeometry;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/NataliaTymchuk/Geometry/main/' ].
			spec
				package: 'Telescope';
				package: 'XMenuModel';
				package: 'Telescope-Tests' ]
]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline08: spec [
	<version: '0.8-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
		spec 
			project: 'BabyMock2' with: [
				spec
					className: #ConfigurationOfBabyMock2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
			project: 'Geometry' with: [
				spec
					className: #ConfigurationOfGeometry;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/NataliaTymchuk/Geometry/main/' ];
			project: 'Stylesheet' with: [
				spec
					className: #ConfigurationOfStylesheet;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main/' ];
			project: 'RoassalForTelescope' with: [
				spec
					className: #ConfigurationOfRoassalForTelescope;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ].
		spec 
			package: 'XMenuModel';
			package: 'Telescope' with: [
				spec requires: #('Stylesheet' 'Geometry' 'XMenuModel' 'RoassalForTelescope' ). ];
			package: 'Telescope-Tests' with: [
				spec requires: #('Telescope' 'BabyMock2' ). ]. ].

]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline09: spec [
	<version: '0.9-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
		spec 
			project: 'BabyMock2' with: [
				spec
					className: #ConfigurationOfBabyMock2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
			project: 'Geometry' with: [
				spec
					className: #ConfigurationOfGeometry;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/NataliaTymchuk/Geometry/main/' ];
			project: 'Stylesheet' with: [
				spec
					className: #ConfigurationOfStylesheet;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main/' ];
			project: 'RoassalForTelescope' with: [
				spec
					className: #ConfigurationOfRoassalForTelescope;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ].
		spec 
			package: 'XMenuModel';
			package: 'Telescope' with: [
				spec requires: #('Stylesheet' 'Geometry' 'XMenuModel' 'RoassalForTelescope' ). ];
			package: 'Telescope-Tests' with: [
				spec requires: #('Telescope' 'BabyMock2' ). ];
			package: #Roassal2 with: 'Roassal2-AlexandreBergel.913'.  ].

]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline101: spec [
	<version: '1.01-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
			spec author: 'usmanbhatti'.
			spec description: 'fork baseline 10 because we need a version that corresponds to end feburary for Ada visualizations'.
			spec
				project: 'BabyMock2'
					with: [ 
							spec
								className: #ConfigurationOfBabyMock2;
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
				project: 'Geometry'
					with: [ 
							spec
								className: #ConfigurationOfGeometry;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/NataliaTymchuk/Geometry/main/' ];
				project: 'Stylesheet'
					with: [ 
							spec
								className: #ConfigurationOfStylesheet;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main/' ];
				project: 'RoassalForTelescope'
					with: [ 
							spec
								className: #ConfigurationOfRoassalForTelescope;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ].
			spec
				package: 'XMenuModel';
				package: 'Telescope' with: [ spec requires: #('Stylesheet' 'Geometry' 'XMenuModel' 'RoassalForTelescope') ];
				package: 'Telescope-Tests' with: [ spec requires: #('Telescope' 'BabyMock2') ];
				package: 'Telescope-Roassal2' with: [ spec requires: #('Telescope') ];
				package: 'Telescope-Roassal2-Tests' with: [ spec requires: #('Telescope-Roassal2') ].
			spec
				repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main';
				package: #Roassal2 ]
]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline10: spec [
	<version: '1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
		spec 
			project: 'BabyMock2' with: [
				spec
					className: #ConfigurationOfBabyMock2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
			project: 'Geometry' with: [
				spec
					className: #ConfigurationOfGeometry;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/NataliaTymchuk/Geometry/main/' ];
			project: 'Stylesheet' with: [
				spec
					className: #ConfigurationOfStylesheet;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main/' ];
			project: 'RoassalForTelescope' with: [
				spec
					className: #ConfigurationOfRoassalForTelescope;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ].
		spec 
			package: 'XMenuModel';
			package: 'Telescope' with: [
				spec requires: #('Stylesheet' 'Geometry' 'XMenuModel' 'RoassalForTelescope' ). ];
			package: 'Telescope-Tests' with: [
				spec requires: #('Telescope' 'BabyMock2' ). ];
			repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main';
			package: #Roassal2 with: 'Roassal2-AlexandreBergel.913'.].

]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline11: spec [
	<version: '1.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
		spec 
			project: 'BabyMock2' with: [
				spec
					className: #ConfigurationOfBabyMock2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
			project: 'Geometry' with: [
				spec
					className: #ConfigurationOfGeometry;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/NataliaTymchuk/Geometry/main/' ];
			project: 'Stylesheet' with: [
				spec
					className: #ConfigurationOfStylesheet;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main/' ].
		spec 
			package: 'XMenuModel';
			package: 'Telescope' with: [
				spec requires: #('Stylesheet' 'Geometry' 'XMenuModel' ). ];
			package: 'Telescope-Tests' with: [
				spec requires: #('Telescope' 'BabyMock2' ). ]. ].

]

{ #category : #baselines }
ConfigurationOfTelescope >> baseline12: spec [
	<version: '1.2-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
			spec
				project: 'BabyMock2'
					with: [ 
							spec
								className: #ConfigurationOfBabyMock2;
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ];
			project: 'MooseAlgos' with: [
				spec
					className: #ConfigurationOfMooseAlgos;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Moose/MooseAlgos/main/' ];
				project: 'Geometry'
					with: [ 
							spec
								className: #ConfigurationOfGeometry;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/NataliaTymchuk/Geometry/main/' ];
				project: 'Stylesheet'
					with: [ 
							spec
								className: #ConfigurationOfStylesheet;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main/' ];
				project: 'MaterialDesignLite'
					with: [ 
							spec
								className: #ConfigurationOfMaterialDesignLite;
								versionString: #bleedingEdge;
								loads: #('colors');
								repository: 'http://smalltalkhub.com/mc/KevinLanvin/MaterialDesignLite/main/' ];
				project: 'TelescopeLayouts'
					with: [ 
							spec
								className: #ConfigurationOfTelescopeLayouts;
								versionString: #bleedingEdge;
								repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ].
			spec
				package: 'XMenuModel';
				package: 'Telescope'
					with: [ spec requires: #('Stylesheet' 'Geometry' 'XMenuModel' 'MaterialDesignLite' 'TelescopeLayouts' 'MooseAlgos') ];
				package: 'Telescope-Tests' with: [ spec requires: #('Telescope') ].
			spec group: 'Core' with: #('Telescope' 'XMenuModel') ]
]

{ #category : #accessing }
ConfigurationOfTelescope >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfTelescope >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.2-baseline'.

	spec for: #'pharo4.x' version: '1.2-baseline'.

	spec for: #'pharo5.x' version: '1.2-baseline'.

]

{ #category : #accessing }
ConfigurationOfTelescope >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfTelescope >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '0.75'.
	
	spec for: #'pharo4.x' version: '0.75'.
	
	spec for: #'pharo5.x' version: '0.75'.
]

{ #category : #versions }
ConfigurationOfTelescope >> version010: spec [
	<version: '0.10' imports: #('1.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.10'.
		spec author: 'GuillaumeLarcheveque'.
		spec timestamp: '7/14/2015 08:47'.
		spec 
			project: 'BabyMock2' with: '2.0';
			project: 'Geometry' with: '0.1-baseline';
			project: 'Stylesheet' with: '0.2-baseline';
			project: 'RoassalForTelescope' with: '2.0'.
		spec 
			package: 'XMenuModel' with: 'XMenuModel-VincentBlondeau.2';
			package: 'Telescope' with: 'Telescope-GuillaumeLarcheveque.394';
			package: 'Telescope-Tests' with: 'Telescope-Tests-GuillaumeLarcheveque.61'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version02: spec [
	<version: '0.2' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.2'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/14/2014 14:43'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.11';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.1';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version03: spec [
	<version: '0.3' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.3'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/17/2014 10:14'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.13';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version041: spec [
	<version: '0.4.1' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.4.1'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/18/2014 17:08'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.16';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version042: spec [
	<version: '0.4.2' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.4.2'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/22/2014 11:05'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.17';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version044: spec [
	<version: '0.4.4' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.4.4'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/22/2014 11:57'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.17';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1';
			package: 'Moose-Algos-Kontractor' with: 'Moose-Algos-Kontractor-LeoPerard.4'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version04: spec [
	<version: '0.4' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.4'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/18/2014 15:08'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.15';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version0501: spec [
	<version: '0.5.0.1' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.0.1'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/24/2014 11:04'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.20';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version0502: spec [
	<version: '0.5.0.2' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.0.2'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/24/2014 11:20'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.23';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version050: spec [
	<version: '0.5.0' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.0'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/23/2014 17:19'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.19';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version051: spec [
	<version: '0.5.1' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.1'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/25/2014 12:40'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.23';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.3';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version0531: spec [
	<version: '0.5.3.1' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.3.1'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/29/2014 17:46'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.26';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version053: spec [
	<version: '0.5.3' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.3'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/29/2014 17:35'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.25';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version0541: spec [
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

]

{ #category : #versions }
ConfigurationOfTelescope >> version054: spec [
	<version: '0.5.4' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.4'.
		spec author: 'LeoPerard'.
		spec timestamp: '4/30/2014 17:24'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.27';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version0551: spec [
	<version: '0.5.5.1' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.5.1'.
		spec author: 'LeoPerard'.
		spec timestamp: '5/12/2014 10:56'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.28';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version05521: spec [
	<version: '0.5.5.2-1' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.5.2-1'.
		spec author: 'LeoPerard'.
		spec timestamp: '5/14/2014 17:42'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.29';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version0552: spec [
	<version: '0.5.5.2' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.5.2'.
		spec author: 'LeoPerard'.
		spec timestamp: '5/14/2014 17:33'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.28';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version05531: spec [
	<version: '0.5.5.31' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.5.31'.
		spec author: 'LeoPerard'.
		spec timestamp: '5/21/2014 11:45'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.30';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version0553: spec [
	<version: '0.5.5.3' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.5.3'.
		spec author: 'LeoPerard'.
		spec timestamp: '5/21/2014 11:42'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.29';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version055: spec [
	<version: '0.5.5' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.5.5'.
		spec author: 'LeoPerard'.
		spec timestamp: '5/12/2014 09:56'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-LeoPerard.27';
			package: 'Telescope-Tests' with: 'Telescope-Tests-LeoPerard.4';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version06: spec [
	<version: '0.6' imports: #('0.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.6'.
		spec author: 'LeoPerard'.
		spec timestamp: '6/24/2014 10:45'.
		spec project: 'Roassal2' with: '1.0'.
		spec 
			package: 'Telescope' with: 'Telescope-GuillaumeLarcheveque.208';
			package: 'XMenuModel' with: 'XMenuModel-LeoPerard.1'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version075: spec [
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
			package: 'Telescope-Tests' with: 'Telescope-Tests-guillaumelarcheveque.71'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> version076: spec [
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

]

{ #category : #versions }
ConfigurationOfTelescope >> version07: spec [
	<version: '0.7' imports: #('0.7-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.7'.
		spec author: 'GuillaumeLarcheveque'.
		spec timestamp: '5/21/2015 16:49'.
		spec 
			project: 'Roassal2' with: '1.0';
			project: 'BabyMock2' with: '2.0';
			project: 'Geometry' with: '0.1-baseline'.
		spec 
			package: 'Telescope' with: 'Telescope-GuillaumeLarcheveque.350';
			package: 'XMenuModel' with: 'XMenuModel-VincentBlondeau.2';
			package: 'Telescope-Tests' with: 'Telescope-Tests-GuillaumeLarcheveque.48'. ].

]

{ #category : #versions }
ConfigurationOfTelescope >> versionbeta: spec [
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

]
