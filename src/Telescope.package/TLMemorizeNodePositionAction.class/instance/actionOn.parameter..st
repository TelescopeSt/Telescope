action
actionOn: aDrawable parameter: aPosition
	(aDrawable generator elementFromTLDrawable: aDrawable)
		in: [ :anElement | anElement defineFixedRelativePosition: aPosition ]