Extension { #name : #String }

{ #category : #'*Telescope-Core' }
String >> insertLineReturnEvery: anInteger [
	^ self class
		streamContents: [ :stream | 
			self
				doWithIndex: [ :character :position | 
					stream nextPut: character.
					position \\ anInteger = 0
						ifTrue: [ stream lf ] ] ]
]
