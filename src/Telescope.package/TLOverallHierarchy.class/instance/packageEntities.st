accessing
packageEntities

	^ ( packageEntities flatCollectAsSet: #withAllParentScopes ) asOrderedCollection reverse