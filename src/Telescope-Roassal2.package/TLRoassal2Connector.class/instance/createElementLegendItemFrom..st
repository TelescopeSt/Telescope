generation - legend
createElementLegendItemFrom: aTLLegendItem
	| shape title group |
	shape := self generateShapeCorrespondingTo: (aTLLegendItem shape).
	self customizeShape: shape withStyleSheet: aTLLegendItem effectiveStyleSheet.
	title := RTLabel new text: (aTLLegendItem title).
	group := RTGroup with: (title element) with: (shape element).
	RTHorizontalLineLayout new gapSize: 3; alignCenter; on: group.
	group do: [ :element | element setAsFixed ].
	^ group