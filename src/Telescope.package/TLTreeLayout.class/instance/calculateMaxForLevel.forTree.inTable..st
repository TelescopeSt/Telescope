as yet unclassified
calculateMaxForLevel: aLevel forTree: tree inTable: aTable
	tree keys
		do: [ :node | 
			| height |
			height := node height.
			[ aTable at: aLevel put: (height max: (aTable at: aLevel)) ]
				on: SubscriptOutOfBounds
				do: [ aTable addLast: height ].
			self calculateMaxForLevel: aLevel + 1 forTree: (tree at: node) inTable: aTable ]