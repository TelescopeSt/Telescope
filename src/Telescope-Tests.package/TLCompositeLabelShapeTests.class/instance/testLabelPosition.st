as yet unclassified
testLabelPosition
	| view top bottom left right topShape bottomShape leftShape rigthShape |
	view := RTView new.
	top := shape labelPosition: #top; elementOn: 1.
	bottom := shape labelPosition: #bottom; elementOn: 1.
	left := shape labelPosition: #left; elementOn: 1.
	right := shape labelPosition: #right; elementOn: 1.
	view add: top; add: bottom; add: left; add: right.
	
	topShape := top trachelShape.
	self assert: (topShape shape1 position <= topShape shape2 position).
		
	bottomShape := bottom trachelShape.
	self assert: (bottomShape shape1 position >= bottomShape shape2 position).
		
	leftShape := left trachelShape.
	self assert: (leftShape shape1 position <= leftShape shape2 position).
		
	rigthShape := right trachelShape.
	self assert: (rigthShape shape1 position >= rigthShape shape2 position).