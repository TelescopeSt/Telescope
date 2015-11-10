initialization
initializeElementLevels
	| elementsToAnalyze |
	elementsToAnalyze := self elements difference: {self entryPoint}.
	levelsCollection := OrderedCollection new.
	levelsCollection add: { self entryPoint }.
	[ elementsToAnalyze isEmpty ]
		whileFalse: [ 
			| thisLevel |
			thisLevel := OrderedCollection new.
			elementsToAnalyze
				do: [ :each | 
					((each perform: self nextProperty) anySatisfy: [ :nextElement | elementsToAnalyze includes: nextElement  ])
						ifTrue: [ thisLevel add: each ] ].
			thisLevel
				ifEmpty: [ 
					levelsCollection add: elementsToAnalyze.
					elementsToAnalyze := OrderedCollection new ]
				ifNotEmpty: [ 
					levelsCollection add: thisLevel.
					elementsToAnalyze removeAll: thisLevel ] ].
	self setLevelsOrientation