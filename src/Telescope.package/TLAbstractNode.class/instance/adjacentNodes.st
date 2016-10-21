accessing
adjacentNodes
	^ self incomingAdjacentNodes copy;
	  addAllFirstUnlessAlreadyPresent: self outgoingAdjacentNodes;
	  yourself 