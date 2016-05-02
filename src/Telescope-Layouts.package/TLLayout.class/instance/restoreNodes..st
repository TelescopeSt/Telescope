placing
restoreNodes: aGroup
	aGroup
		do: [ :aNode | 
			aNode occupyMaxSpace
				ifTrue: [ aNode restoreOriginalDimension ] ]