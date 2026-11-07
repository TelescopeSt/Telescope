"
The effective style sheets of the drawables of Telescope are kept while a visualization is generated or updated: see EffectiveStyleSheetCache in the Stylesheet project.
"
Class {
	#name : 'TLEffectiveStyleSheetTest',
	#superclass : 'TestCase',
	#instVars : [
		'nodes',
		'customizations'
	],
	#category : 'Telescope-Core-Tests-Style',
	#package : 'Telescope-Core-Tests',
	#tag : 'Style'
}

{ #category : 'running' }
TLEffectiveStyleSheetTest >> setUp [

	| visualization |
	super setUp.
	customizations := 0.
	visualization := TLVisualization new.
	visualization
		nodeCreationStrategy: TLNodeCreationStrategy default;
		styleSheet: TLStyleSheet default.
	visualization styleSheet dynamicCustomization: [ :sheet :element | customizations := customizations + 1 ].
	nodes := (1 to: 3) collect: [ :entity | visualization addNodeFromEntity: entity ]
]

{ #category : 'tests' }
TLEffectiveStyleSheetTest >> testParentsAreComputedForEachNodeWithoutScope [

	nodes do: [ :node | node effectiveStyleSheet ].
	self assert: customizations equals: nodes size
]

{ #category : 'tests' }
TLEffectiveStyleSheetTest >> testParentsAreComputedOnceInTheScope [
	"The nodes of a group share the style sheets of their parents, which are merged for each node when nothing keeps them"

	EffectiveStyleSheetCache during: [ nodes do: [ :node | node effectiveStyleSheet ] ].
	self assert: customizations equals: 1
]
