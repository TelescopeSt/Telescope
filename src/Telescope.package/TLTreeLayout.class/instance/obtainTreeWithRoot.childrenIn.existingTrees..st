private
obtainTreeWithRoot: root childrenIn: remainingNodes existingTrees: trees
	^ (self obtainTargetedAdjacentNodesFor: root)
		inject: OrderedDictionary new
		into: [ :dictionary :node | 
			trees
				at: node
				ifPresent: [ :branch | dictionary at: node put: (trees removeKey: node) ]
				ifAbsent: [ 
					[ 
					dictionary
						at: node
						put:
							(self
								obtainTreeWithRoot: node
								childrenIn:
									(remainingNodes
										remove: node;
										yourself)
								existingTrees: trees) ]
						on: NotFound
						do: [ 
							"no children found in existing trees (at first level) or remaining nodes"
							 ] ].
			dictionary ]