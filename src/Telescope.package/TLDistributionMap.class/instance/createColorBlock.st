private
createColorBlock
	| frequencyDictionary sortedProperties |
	frequencyDictionary := Dictionary new.
	(self containerEntities flatCollect: self innerEntities)
		do: [ :anEntity | 
			frequencyDictionary
				at: (self property value: anEntity)
				put: (frequencyDictionary at: (self property value: anEntity) ifAbsent: [ 0 ]) + 1 ].
	sortedProperties := (frequencyDictionary associations sort: [ :a :b | a value > b value ]) collect: #key.
	self colorToProperty: ((self defaultColors first: (sortedProperties size min: self defaultColors size))
		collectWithIndex: [ :aColor :anIndex | (sortedProperties at: anIndex) -> aColor ]) asDictionary.
	^ [ :anEntity | 
	| color |
	color := self colorToProperty at: (self property value: anEntity) ifAbsent: [ self defaultColor ].
	color ]