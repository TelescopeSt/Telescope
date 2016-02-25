nesting
onNode: aNode nestNodes: aGroupOfNodes
	| backElement innerElements |
	backElement := self elementFromTLDrawable: aNode.
	innerElements := aGroupOfNodes collect: [ :node | self elementFromTLDrawable: node ].
	self
		on: backElement
		nest: innerElements
		layout: (aGroupOfNodes ifEmpty: [ RTGridLayout new ] ifNotEmpty: [ aGroupOfNodes layout ])	"Hack because the connector provide an empty array when removing children"