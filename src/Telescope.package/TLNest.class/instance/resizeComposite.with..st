private
resizeComposite: backElement with: encompassingRectangle
	| composite shape label extent |
	composite := backElement shape.
	shape := backElement trachelShape shape2.
	label := backElement trachelShape shape1.
	composite labelPosition = #inside
		ifTrue: [ 
			extent :=
				((encompassingRectangle width max: (label width + composite padding)) + (padding * 2))
				@ (encompassingRectangle height + (label height + composite padding) + (padding * 2)).
			shape extent: extent.
			
			^ ((shape encompassingRectangle center x - encompassingRectangle center x)
				@ (shape encompassingRectangle topLeft y + (composite padding + label height + padding))) ]
		ifFalse: [ 
			extent := 
				(encompassingRectangle width + (padding * 2)) 
				@ (encompassingRectangle height + (padding * 2)).
			(extent = (5@5)) ifTrue: [ extent := 15@15 ].
			shape extent: extent.
			^ shape encompassingRectangle center - encompassingRectangle center ]