generation - connection
customizeEdgeShape: aRTEdge withStyleSheet: aTLStyleSheet
	"Hack because roassal composite shapes only change color of first shape"
	[ aRTEdge trachelShape shapes do: [ :s | s color: aTLStyleSheet backgroundColor ] ]
		on: MessageNotUnderstood
		do: [ aRTEdge color: aTLStyleSheet backgroundColor ]