public
trachelShapeFor: anElement
	| s1 s2 c |
	s1 := self labelShape trachelShapeFor: anElement.
	s2 := self shape trachelShapeFor: anElement.
	(self labelPosition value: self) value: s1 value: s2.
	c := TLTrachelCompositeLabelShape 
			with: s1 with: s2.
	c offset2: 0@0.
	^ c