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
TLNameCloudTest >> testSymbolsUsedInNamesCountTheOccurrencesOfEachWord [

	| cloud occurrences |
	cloud := TLNameCloud new.
	cloud entities: #( 'MethodDictionary' 'method_chains' 'methods' ).
	cloud nameProperty: #yourself.
	occurrences := cloud symbolsUsedInNames.
	self assert: (occurrences at: 'method') equals: 3.
	self assert: (occurrences at: 'dictionary') equals: 1.
	self assert: (occurrences at: 'chain') equals: 1.
	self assert: occurrences size equals: 3
]

{ #category : 'tests' }
TLNameCloudTest >> testWordsOfACamelCaseName [

	self assert: (TLNameCloud new wordsInCamelCase: 'camelCaseName') asArray equals: #( 'camel' 'Case' 'Name' ).
	self assert: (TLNameCloud new wordsInCamelCase: 'MethodDictionary') asArray equals: #( 'Method' 'Dictionary' )
]

{ #category : 'tests' }
TLNameCloudTest >> testWordsOfACamelCaseNameKeepAcronyms [

	self assert: (TLNameCloud new wordsInCamelCase: 'FOOBar') asArray equals: #( 'FOO' 'Bar' )
]

{ #category : 'tests' }
TLNameCloudTest >> testWordsOfACamelCaseNameSeparateNumbers [

	self assert: (TLNameCloud new wordsInCamelCase: 'FOOBar12AndSomething') asArray equals: #( 'FOO' 'Bar' '12' 'And' 'Something' )
]

{ #category : 'tests' }
TLNameCloudTest >> testWordsOfAWordWithoutCamelCaseIsTheWord [

	self assert: (TLNameCloud new wordsInCamelCase: 'method') asArray equals: #( 'method' ).
	self assertEmpty: (TLNameCloud new wordsInCamelCase: '')
]

{ #category : 'tests' }
TLNameCloudTest >> testWordsWhichAreNotInflectedAreKept [
	#( 'class' 'bus' 'is' 'string' 'sing' 'used' 'status' 'analysis' ) do: [ :word | self assert: (TLNameCloud new stemOf: word) equals: word ]
]
