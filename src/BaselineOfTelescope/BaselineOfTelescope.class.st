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
				deepTraverser: spec;
				mooseAlgo: spec;
				styleSheet: spec;
				materialColors: spec.

			"Packages"
			spec
				package: 'Telescope-Core' with: [ spec requires: #('Stylesheet' 'Telescope-Layouts' 'MaterialColors') ];
				package: 'Telescope-VisualizationTemplates' with: [ spec requires: #('Telescope-Core' 'MooseAlgos' 'DeepTraverser') ];
				package: 'Telescope-Demo' with: [ spec requires: #('Telescope-Core' 'Telescope-VisualizationTemplates') ];
				package: 'Telescope-Layouts';
				package: 'Telescope-Core-Tests' with: [ spec requires: #('Telescope-Core' 'BabyMock2') ];
				package: 'Telescope-Layouts-Tests' with: [ spec requires: #(#'Telescope-Layouts' 'BabyMock') ];
				package: 'Telescope-VisualizationTemplates-Tests' with: [ spec requires: #('Telescope-VisualizationTemplates' Telescope-Core-Tests) ].

			"Groups"
			spec
				group: 'all' with: #('default');
				group: 'core' with: #('Telescope-Core' 'Telescope-VisualizationTemplates');
				group: 'default' with: #('core' 'tests' 'demo');
				group: 'demo' with: #('Telescope-Demo');
				group: 'layout' with: #('Telescope-Layouts' 'Telescope-Layouts-Tests');
				group: 'layout-core' with: #('Telescope-Layouts');
				group: 'minimal' with: #('Telescope-Core');
				group: 'tests' with: #('Telescope-Core-Tests' 'Telescope-Layouts-Tests' 'Telescope-VisualizationTemplates-Tests') ]
]

{ #category : #dependencies }
BaselineOfTelescope >> deepTraverser: spec [
	spec
		baseline: 'DeepTraverser'
		with: [ spec
				loads: 'Core';
				repository: 'github://pharo-contributions/DeepTraverser:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfTelescope >> materialColors: spec [
	spec baseline: 'MaterialColors' with: [ spec repository: 'github://DuneSt/MaterialColors:v2.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfTelescope >> mooseAlgo: spec [
	spec
		baseline: 'MooseAlgos'
		with: [ spec
				loads: 'Core';
				repository: 'github://moosetechnology/MooseAlgos:v1.x.x/src' ]
]

{ #category : #accessing }
BaselineOfTelescope >> projectClass [
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]
]

{ #category : #dependencies }
BaselineOfTelescope >> styleSheet: spec [
	spec baseline: 'Stylesheet' with: [ spec repository: 'github://pharo-contributions/Stylesheet:v1.x.x/src' ]
]
