utilities
symbolsUsedInNames

	| symbols nospace |
	symbols := self entities	flatCollect: [ :each |
		nospace := (( self nameProperty value: each )
			piecesCutWhere: [ :a :b | {Character space. $_} includes: a])
			collect: [:token | (token replaceAll: $_ with: Character space)
			trimRight trimLeft ].
		nospace flatCollect: [ :x | x piecesCutWhereCamelCase 
			collect: [:y | each -> (MalStemmer English stem: y) ] ] ].
	^ (symbols reject: [ :each | MooseUtilities stopWordList includes: each value ]) 
			asOrderedCollection
			groupedBy: #value affect: [:assocCol | assocCol collect: #key]