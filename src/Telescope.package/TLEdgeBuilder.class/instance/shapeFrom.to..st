as yet unclassified
shapeFrom: aNode to: anotherNode
	^ self shape
		color:
				(self color isBlock
						ifTrue: [ self color value: aNode value: anotherNode ]
						ifFalse: [ self color ]);
		yourself