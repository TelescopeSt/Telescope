Extension { #name : #PluggableDictionary }

{ #category : #'*Telescope-Core' }
PluggableDictionary >> sorted: aSortFunction [
	self flag: #pharo6.
	^ self class newFrom: ((self keys sorted: aSortFunction) collect: [ :key | key -> (self at: key) ])
]
