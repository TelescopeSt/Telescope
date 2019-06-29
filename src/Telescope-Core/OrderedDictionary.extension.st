Extension { #name : #OrderedDictionary }

{ #category : #'*Telescope-Core' }
OrderedDictionary >> sorted: aSortFunction [
	^ self class newFrom: ((self keys sorted: aSortFunction) collect: [ :key | key -> (self at: key) ])
]
