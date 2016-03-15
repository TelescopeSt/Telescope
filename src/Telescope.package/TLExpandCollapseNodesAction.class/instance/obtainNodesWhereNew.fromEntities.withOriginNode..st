action
obtainNodesWhereNew: newNodes fromEntities: children withOriginNode: aNode
	^ children
		collect: [ :aChild | 
			(self destinationGroupFor: aChild byDefault: aNode parent)
				nodeForEntity: aChild
				ifAbsent: [ newNodes add: (self createNodeForEntity: aChild inGroup: (self destinationGroupFor: aChild byDefault: aNode parent)) ] ]
		as: TLDrawableCollection