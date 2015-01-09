as yet unclassified
defineStructure
	self layout: (RTHorizontalLineLayout new gapSize: 60;alignCenter).
	self > #incomingCalls layout: RTVerticalLineLayout new alignCenter.
	self > #callNodes layout: (RTHorizontalTreeLayout new verticalGap: 40; horizontalGap: 60).
	self > #outgoingCalls layout: RTVerticalLineLayout new alignCenter