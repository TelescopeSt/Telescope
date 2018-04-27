Class {
	#name : #ConfigurationOfTelescopeOnWeb,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfTelescopeOnWeb'
}

{ #category : #'development support' }
ConfigurationOfTelescopeOnWeb class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfTelescopeOnWeb class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfTelescopeOnWeb class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfTelescopeOnWeb class >> ensureMetacelloBaseConfiguration [

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
ConfigurationOfTelescopeOnWeb class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfTelescopeOnWeb class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfTelescopeOnWeb class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfTelescopeOnWeb class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfTelescopeOnWeb class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfTelescopeOnWeb class >> validate [
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
ConfigurationOfTelescopeOnWeb >> baseline01: spec [
	<version: '0.1-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec
				project: 'Telescope'
					with: [ 
							spec
								className: #ConfigurationOfTelescope;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ];
				project: 'Neo'
					with: [ 
							spec
								className: #ConfigurationOfNeoJSON;
								versionString: #stable;
								repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main' ];
				project: 'MochaJSTest'
					with: [ 
							spec
								className: #ConfigurationOfMochaJSTest;
								versionString: #development;
								repository: 'http://smalltalkhub.com/mc/PharoExtras/MochaJSTest/main' ];
				project: 'Seaside3'
					with: [ 
							spec
								className: 'ConfigurationOfSeaside3';
								version: #'release3.2';
								repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ].
			spec repository: 'http://mc.stfx.eu/ZincHTTPComponents'.
			spec package: 'Zinc-WebSocket-Core'.
			spec repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
			spec package: 'Telescope-Cytoscape-Libraries' with: [ spec requires: #('Seaside3') ].
			spec
				package: 'Telescope-Cytoscape'
				with: [ spec requires: #('Telescope' 'Zinc-WebSocket-Core' 'Telescope-Cytoscape-Libraries' 'Neo') ].
			spec package: 'Telescope-Cytoscape-Tests' with: [ spec requires: #('Telescope-Cytoscape' 'MochaJSTest') ].
			spec group: 'Core' with: #('Telescope-Cytoscape') ]
]

{ #category : #baselines }
ConfigurationOfTelescopeOnWeb >> baseline02: spec [
	<version: '0.2-baseline'>
	spec
		for: #common
		do: [ spec
				blessing: #baseline;
				repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/'.
			spec
				project: 'Telescope'
					with: [ spec
						className: #ConfigurationOfTelescope;
						versionString: #development;
						repository: 'http://smalltalkhub.com/mc/Moose/Telescope/main/' ];
				project: 'Neo'
					with: [ spec
						className: #ConfigurationOfNeoJSON;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main' ];
				project: 'MochaJSTest'
					with: [ spec
						className: #ConfigurationOfMochaJSTest;
						versionString: #development;
						repository: 'http://smalltalkhub.com/mc/PharoExtras/MochaJSTest/main' ];
				project: 'Seaside3'
					with: [ spec
						className: 'ConfigurationOfSeaside3';
						version: #'release3.2';
						repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ];
				project: 'MaterialDesign'
					with: [ spec
						className: 'ConfigurationOfMaterialDesignLite';
						version: #development;
						repository: 'http://smalltalkhub.com/mc/KevinLanvin/MaterialDesignLite/main' ];
				project: 'WebSocket'
					with: [ spec
						className: 'ConfigurationOfZincHTTPComponents';
						version: #'stable';
						loads: #('WebSocket');
						repository: 'http://mc.stfx.eu/ZincHTTPComponents' ].
			spec
				package: 'Telescope-Cytoscape-Libraries' with: [ spec requires: #('Seaside3') ];
				package: 'Telescope-Cytoscape' with: [ spec requires: #('Telescope' 'WebSocket' 'Telescope-Cytoscape-Libraries' 'Neo') ];
				package: 'Telescope-Demo-Cytoscape' with: [ spec requires: #('Telescope-Cytoscape' 'MaterialDesign') ];
				package: 'Telescope-Cytoscape-Tests' with: [ spec requires: #('Telescope-Cytoscape' 'MochaJSTest') ].
			spec
				group: 'Core' with: #('Telescope-Cytoscape');
				group: 'default' with: #('Core' 'Telescope-Cytoscape-Tests');
				group: 'demo' with: #('default' 'Telescope-Demo-Cytoscape') ]
]

{ #category : #accessing }
ConfigurationOfTelescopeOnWeb >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfTelescopeOnWeb >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.2-baseline'.

]

{ #category : #accessing }
ConfigurationOfTelescopeOnWeb >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]
