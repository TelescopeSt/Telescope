updating
updateShapeFor: anElement
	|  trachelShape |

	trachelShape := anElement trachelShape shapes first.
	trachelShape ifNil: [ ^ self ].
	trachelShape color: (self shape colorFor: anElement).
	trachelShape strokePaint: (self shape borderColorFor: anElement).