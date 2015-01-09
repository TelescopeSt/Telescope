private
resizeSimple: backElement with: encompassingRectangle
	| shape extent |
	extent := (encompassingRectangle width + (padding * 2)) @ (encompassingRectangle height + (padding * 2)).
	shape := backElement trachelShape.
	shape extent: extent.
	^ shape encompassingRectangle center - encompassingRectangle center