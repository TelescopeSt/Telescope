Class {
	#name : #TLDistributionMapTest,
	#superclass : #TestCase,
	#instVars : [
		'visu'
	],
	#category : #'Telescope-VisualizationTemplates-Tests'
}

{ #category : #running }
TLDistributionMapTest >> setUp [ 
	super setUp.
	visu := TLDistributionMap containerEntities: {{1} . {1 . 2} . {1 . 2 . 3} . {1 . 2 . 3 . 4}} innerEntities: #yourself property: #yourself
]

{ #category : #tests }
TLDistributionMapTest >> testObtainPropertyValuesSortedByFrequency [
	self assert: (visu obtainPropertyValuesSortedByFrequency ) equals: { 1 . 2 . 3 .4 }
]
