updating
updateLabelFor: anElement
	| labelShapeTrachel |
	labelShapeTrachel := anElement trachelShape shapes first.
	self labelShape updateFor: anElement trachelShape: labelShapeTrachel.
	labelShapeTrachel pushFront