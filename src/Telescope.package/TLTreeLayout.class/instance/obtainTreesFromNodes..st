as yet unclassified
obtainTreesFromNodes: aGroup
	| trees remainingNodes |
	remainingNodes := aGroup asOrderedCollection.
	remainingNodes == aGroup
		ifTrue: [ remainingNodes := remainingNodes copy ].
	trees := Dictionary new.
	[ remainingNodes notEmpty ]
		whileTrue: [ 
			| root |
			root := remainingNodes first.
			remainingNodes := remainingNodes allButFirst.
			trees at: root put: (self obtainTreeWithRoot: root childrenIn: remainingNodes existingTrees: trees) ].
	^ trees