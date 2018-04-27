Extension { #name : #TLPosition }

{ #category : #'*Telescope-Roassal2' }
TLPosition >> forRoassal2 [
	^ self vertical = #center
		ifFalse: [ self vertical ]
		ifTrue: [ 
			self horizontal = #center
				ifTrue: [ #inside ]
				ifFalse: [ self horizontal ] ]
]
