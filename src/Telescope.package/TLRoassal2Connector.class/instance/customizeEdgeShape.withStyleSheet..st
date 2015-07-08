generation - connection
customizeEdgeShape: aRTEdge withStyleSheet: aTLStyleSheet 
	"Hack because roassal composite shapes only change color of first shape"
	[aRTEdge trachelShape shapes do: [ :s | s color: aTLStyleSheet borderColor]] on: MessageNotUnderstood do: [aRTEdge color: aTLStyleSheet borderColor.].