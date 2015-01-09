updating
updateShapeFor: anElement
	|  trachelShape |
	trachelShape := anElement trachelShape shape2.
	trachelShape isNil
		ifTrue: [ ^ self ].
	trachelShape color: (self shape colorFor: anElement).
	trachelShape strokePaint: (self shape borderColorFor: anElement).