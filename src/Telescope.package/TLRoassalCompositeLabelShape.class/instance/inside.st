accessing
inside
	^ [ :label :shape | | max |
			max := (label encompassingRectangle extent + (self padding*2)) max: (shape encompassingRectangle extent).
			label extent: max.
			shape extent: max.
			TRConstraint stick: label onTheTopLeftOf: shape withPadding: self padding ]