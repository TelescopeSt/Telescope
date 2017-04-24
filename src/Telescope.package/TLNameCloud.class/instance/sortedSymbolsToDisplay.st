building
sortedSymbolsToDisplay
	| objects |
	objects := OrderedCollection new.
	"Here we sort the entries to put the ones with the highest values to the center of the visu."
	(self symbolsUsedInNames associations sorted: [ :a :b | a value > b value ])
		doWithIndex: [ :each :ind | 
			ind even
				ifTrue: [ objects addFirst: each ]
				ifFalse: [ objects addLast: each ] ].
	^ objects