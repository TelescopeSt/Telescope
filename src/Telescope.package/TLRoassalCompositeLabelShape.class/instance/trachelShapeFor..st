public
trachelShapeFor: anElement
	| s1 s2 c |
	s1 := self labelShape trachelShapeFor: anElement.
	s2 := self shape trachelShapeFor: anElement.
	(self labelPosition value: self) value: s1 value: s2.
	c := TRCompositeShape new addShape: s1 ; addShape: s2 ; yourself.
	^ c