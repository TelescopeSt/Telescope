as yet unclassified
buildItem
	^ TLLegendItem new
		label: self labelBuilder buildShape;
		shape: self shapeBuilder buildShape;
		yourself