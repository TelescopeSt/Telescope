as yet unclassified
expandNode: aNode
	super expandNode: aNode.
	aNode connections do: #hide
	