as yet unclassified
prepareFor: aGroup onLayout: aLayout
	| dimensions simulator numberOfNodes minRatio maxRatio |
	aGroup ifEmpty: [ ^ self ].
	dimensions := aGroup collect: [ :aNode | aLayout obtainsNodeDimension: aNode ].
	numberOfNodes := (dimensions size * ratio) sqrt rounded max: 1.
	[ minRatio isNil or: [ maxRatio isNil ] ]
		whileTrue: [ 
			self
				maxDimension:
					((1 to: numberOfNodes) sum: [ :i | (dimensions at: i) x ]) + ((numberOfNodes - 1) * aLayout horizontalGap).
			simulator := TLLinearLayoutSimulator new
				horizontalGap: aLayout horizontalGap;
				verticalGap: aLayout verticalGap;
				newLineStrategy: self;
				yourself.
			simulator executeOn: aGroup.
			simulator ratio > self ratio
				ifTrue: [ 
					maxRatio := simulator ratio -> self maxDimension.
					numberOfNodes := numberOfNodes - 1 ]
				ifFalse: [ 
					minRatio := simulator ratio -> self maxDimension.
					numberOfNodes := numberOfNodes + 1 ] ].
	self
		maxDimension:
			((minRatio key - ratio) abs < (maxRatio key - ratio) abs
				ifTrue: [ minRatio value ]
				ifFalse: [ maxRatio value ])