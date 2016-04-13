as yet unclassified
obtainTreeWithRoot: root childrenIn: remainingNodes existingTrees: trees
	^ (self obtainTargetedAdjacentNodesFor: root)
		inject: OrderedDictionary new
		into: [ :dictionary :node | 
			trees
				at: node
				ifPresent: [ :branch | dictionary at: node put: (trees removeKey: node) ]
				ifAbsent: [ 
					[ dictionary at: node put: (self obtainTreeWithRoot: node childrenIn: (remainingNodes remove: node) existingTrees: trees) ]
						on: NotFound
						do: [Halt now. 
							"no children found in existing trees or remaining nodes"
							 ] ]. dictionary ]