as yet unclassified
buildLegend
	| expand collapse |
	expand := TLEllipseShape new size: 8; color: Color red.
	collapse := TLEllipseShape new size: 8; color: Color blue.
	self legend addTitle: 'Expand' shape: expand.
	self legend addTitle: 'Collapse' shape: collapse