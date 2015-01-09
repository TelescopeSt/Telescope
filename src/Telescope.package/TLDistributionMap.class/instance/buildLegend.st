private
buildLegend
	self colorToProperty
		keysAndValuesDo: [ :prop :color | self legend addTitle: prop shape: (TLRectangleShape new color: color) ]