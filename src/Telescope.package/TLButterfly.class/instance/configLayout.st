layout
configLayout
	self > #left layout: (RTVerticalLineLayout new alignRight).
	self > #central.
	self > #right layout: (RTVerticalLineLayout new alignLeft).
	self layout: (RTHorizontalLineLayout new alignCenter; horizontalGap: 100)