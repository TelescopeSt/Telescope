placing
inside
	^ [ :aShape :label | | max |
			max := (label encompassingRectangle extent + (self padding*2)) max: (aShape encompassingRectangle extent).
			label extent: max.
			aShape extent: max.
			TRConstraint stick: label onTheTopLeftOf: aShape withPadding: self padding ]