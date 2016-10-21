accessing
adjacentNodes
   |t|
	t:=TLDrawableCollection new 
	addAll: self incomingAdjacentNodes.
	t addAllFirstUnlessAlreadyPresent: self outgoingAdjacentNodes.
	^ t