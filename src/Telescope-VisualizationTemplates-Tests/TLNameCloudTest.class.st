"
I test how the words of the name cloud are reduced to their stem.
"
Class {
	#name : 'TLNameCloudTest',
	#superclass : 'TestCase',
	#category : 'Telescope-VisualizationTemplates-Tests',
	#package : 'Telescope-VisualizationTemplates-Tests'
}

{ #category : 'tests' }
TLNameCloudTest >> testStemIsLowercase [
	self assert: (TLNameCloud new stemOf: 'Methods') equals: 'method'
]

{ #category : 'tests' }
TLNameCloudTest >> testStemOfIngAndEd [
	#( #('creating' 'creat') #('visited' 'visit') #('running' 'run') #('stopped' 'stop') ) do: [ :pair | self assert: (TLNameCloud new stemOf: pair first) equals: pair second ]
]

{ #category : 'tests' }
TLNameCloudTest >> testStemOfPlurals [
	#( #('methods' 'method') #('classes' 'class') #('entities' 'entity') #('boxes' 'box') #('Nodes' 'node') #('watches' 'watch') ) do: [ :pair | self assert: (TLNameCloud new stemOf: pair first) equals: pair second ]
]

{ #category : 'tests' }
TLNameCloudTest >> testWordsWhichAreNotInflectedAreKept [
	#( 'class' 'bus' 'is' 'string' 'sing' 'used' 'status' 'analysis' ) do: [ :word | self assert: (TLNameCloud new stemOf: word) equals: word ]
]
