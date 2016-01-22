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
	self assert: (topShape shapes first position <= topShape shapes second position).
		
	bottomShape := bottom trachelShape.
	self assert: (bottomShape shapes first position >= bottomShape shapes second position).
		
	leftShape := left trachelShape.
	self assert: (leftShape shapes first position <= leftShape shapes second position).
		
	rigthShape := right trachelShape.
	self assert: (rigthShape shapes first position >= rigthShape shapes second position).