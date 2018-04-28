Extension { #name : #Color }

{ #category : #'*Telescope-Core-Style' }
Color >> property: aBlockOrProperty gradientAt: aLevel [
	^ TLGradient new
		levelProperty: aBlockOrProperty;
		to: self at: aLevel;
		yourself
]

{ #category : #'*Telescope-Core-Style' }
Color >> to: aColor dependingOn: aBlockOrProperty range: aRange [
	^ (self property: aBlockOrProperty gradientAt: aRange first) to: aColor at: aRange last
]
