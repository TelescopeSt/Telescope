as yet unclassified
prepareFor: aGroup onLayout: aLayout
	| dimensions numberOfNodes minRatio maxRatio simulatedRatio |
	aGroup ifEmpty: [ ^ self ].
	dimensions := aGroup collect: [ :aNode | aLayout obtainsNodeDimension: aNode ].
	numberOfNodes := ((dimensions size * ratio) sqrt rounded max: 1) min: dimensions size.
	[ minRatio isNil or: [ maxRatio isNil ] ]
		whileTrue: [ 
			self
				maxDimension:
					((1 to: numberOfNodes) sum: [ :i | (dimensions at: i) x ]) + ((numberOfNodes - 1) * aLayout horizontalGap).
			simulatedRatio := self obtainRatioBySimulatingLayout: aLayout on: aGroup.
			simulatedRatio > self ratio
				ifTrue: [ 
					maxRatio := simulatedRatio -> self maxDimension.
					(numberOfNodes := numberOfNodes - 1) = 0
						ifTrue: [ minRatio := maxRatio ] ]
				ifFalse: [ 
					minRatio := simulatedRatio -> self maxDimension.
					(numberOfNodes := numberOfNodes + 1) > aGroup size
						ifTrue: [ maxRatio := simulatedRatio -> self maxDimension ] ] ].
	self
		maxDimension:
			((minRatio key - ratio) abs < (maxRatio key - ratio) abs
				ifTrue: [ minRatio value ]
				ifFalse: [ maxRatio value ])