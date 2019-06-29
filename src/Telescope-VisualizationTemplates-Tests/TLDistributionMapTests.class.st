Class {
	#name : #TLDistributionMapTests,
	#superclass : #TestCase,
	#instVars : [
		'visu'
	],
	#category : #'Telescope-VisualizationTemplates-Tests'
}

{ #category : #tests }
TLDistributionMapTests >> setUp [
	| containersMock |
	containersMock := {{1}.
	{1 . 2}.
	{1 . 2 . 3}.
	{1 . 2 . 3 . 4}}.
	visu := TLDistributionMap containerEntities: containersMock innerEntities: #yourself property: #yourself
]

{ #category : #tests }
TLDistributionMapTests >> testObtainPropertyValuesSortedByFrequency [
	self assert: (visu obtainPropertyValuesSortedByFrequency ) equals: { 1 . 2 . 3 .4 }
]
