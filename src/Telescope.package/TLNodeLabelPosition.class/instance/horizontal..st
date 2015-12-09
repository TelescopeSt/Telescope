accessing
horizontal: horizontalPosition
	self assert: (#(left center right) includes: horizontalPosition) description: 'Horizontal position must be left, center or right'.
	horizontal := horizontalPosition