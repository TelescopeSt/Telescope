"
I am a baseline of Telescope. Read more at: https://github.com/TelescopeSt/Telescope
"
Class {
	#name : #BaselineOfTelescope,
	#superclass : #BaselineOf,
	#category : #BaselineOfTelescope
}

{ #category : #dependencies }
BaselineOfTelescope >> babyMock2: spec [
	spec
		project: 'BabyMock2'
		with: [ spec
				className: #ConfigurationOfBabyMock2;
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock2/main/' ]
]

{ #category : #dependencies }
BaselineOfTelescope >> babyMock: spec [
	spec
		project: 'BabyMock'
		with: [ spec
				className: #ConfigurationOfBabyMock;
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/zeroflag/BabyMock/main/' ]
]

{ #category : #baseline }
BaselineOfTelescope >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self
				babyMock: spec;
				babyMock2: spec;
				mooseAlgo: spec;
				styleSheet: spec;
				materialColors: spec.

			"Packages"
			spec
				package: 'Telescope' with: [ spec requires: #('Stylesheet' 'MaterialColors' 'Telescope-Layouts' 'MooseAlgos') ];
				package: 'Telescope-Tests' with: [ spec requires: #('Telescope' 'BabyMock2') ];
				package: #'Telescope-Layouts';
				package: #'Telescope-Tests-Layouts' with: [ spec requires: #(#'Telescope-Layouts' 'BabyMock') ].

			"Groups"
			spec
				group: 'all' with: #('default');
				group: 'core' with: #('Telescope');
				group: 'default' with: #('core' 'tests');
				group: 'layout' with: #('Telescope-Layouts' 'Telescope-Tests-Layouts');
				group: 'layout-core' with: #('Telescope-Layouts');
				group: 'tests' with: #('Telescope-Tests' 'Telescope-Tests-Layouts') ]
]

{ #category : #dependencies }
BaselineOfTelescope >> materialColors: spec [
	spec baseline: 'MaterialColors' with: [ spec repository: 'github://DuneSt/MaterialColors:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfTelescope >> mooseAlgo: spec [
	spec
		project: 'MooseAlgos'
		with: [ spec
				className: #ConfigurationOfMooseAlgos;
				versionString: #development;
				repository: 'http://smalltalkhub.com/mc/Moose/MooseAlgos/main/' ]
]

{ #category : #accessing }
BaselineOfTelescope >> projectClass [
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]
]

{ #category : #dependencies }
BaselineOfTelescope >> styleSheet: spec [
	spec
		project: 'Stylesheet'
		with: [ spec
				className: #ConfigurationOfStylesheet;
				versionString: #development;
				repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main/' ]
]
