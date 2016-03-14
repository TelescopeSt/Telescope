tests
testChildrenNodeInVisu
	self assert: visualization allChildrenNodes first effectiveStyleSheet backgroundColor equals: Color yellow.
	self assert: visualization allChildrenNodes first effectiveStyleSheet shape equals: TLEllipse.