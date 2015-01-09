generation - shape
generateCompositeLabelShape: aCompositeLabelShape
	| label shape compositeShape |
	label := aCompositeLabelShape label generateWith: self.
	shape := aCompositeLabelShape shape generateWith: self.
	compositeShape := TLRoassalCompositeLabelShape labelPosition: aCompositeLabelShape labelPosition.
	compositeShape labelShape: label.
	compositeShape labelShape color: aCompositeLabelShape labelColor; height: aCompositeLabelShape labelFontSize.
	compositeShape shape: shape.
	^ compositeShape