as yet unclassified
obtainsNodeDimension: aNode
	aNode isNode
		ifTrue: [ aNode children ifNotEmpty: [ ^ self obtainsNodeDimension: aNode forAngle: 0 ] ].
	^ self obtainsNodeDimension: aNode forAngle: self angle