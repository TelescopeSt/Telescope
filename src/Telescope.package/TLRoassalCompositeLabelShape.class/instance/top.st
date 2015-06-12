placing
top
	"Was: TRConstraint stick: label above: shape.
Now TLRoassalCompositeLabelShape is a subclass of RTCompositeShape
stick:above: adds a TRTranslationCallback on the TRLabel of the RTCompositeShape so that if the TRBoxShape moves, the TRLabel moves also
and the RTCompositeShape is in a RTHorizontalTreelayout which moves the TRCompositeShape and this triggers moving all elements of the shape, but then the TRLabel is moved twice: 1 because of the layout and 2 because of the callback when the TRBoxShape moves"
self flag: 'tofix'.
	^ [ :shape :label | TRConstraint move: label above: shape ]