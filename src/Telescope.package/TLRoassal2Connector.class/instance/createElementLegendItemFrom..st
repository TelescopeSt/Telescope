generation - legend
createElementLegendItemFrom: aTLLegendItem
	| shape title group |
	shape := (aTLLegendItem shape) generateWith: self.
	title := (aTLLegendItem) title generateWith: self.
	group := RTGroup with: (title element) with: (shape element).
	RTHorizontalLineLayout new gapSize: 3; alignCenter; on: group.
	group do: [ :element | element setAsFixed ].
	^ group