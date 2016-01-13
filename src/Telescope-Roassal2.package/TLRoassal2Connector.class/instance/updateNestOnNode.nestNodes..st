nesting
updateNestOnNode: aNode nestNodes: aGroupOfNodes
	| backElement innerElements |
	backElement := self elementFromTLDrawable: aNode.
	innerElements := self elementsFromTLDrawables: aGroupOfNodes.
	self updateNestOn: backElement nest: innerElements layout: aNode childrenLayout