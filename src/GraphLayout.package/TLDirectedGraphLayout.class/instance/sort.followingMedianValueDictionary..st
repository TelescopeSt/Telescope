accessing
sort: aCollectionOfNodesForARank followingMedianValueDictionary: medianValuesDictionary
	^ aCollectionOfNodesForARank sorted: [ :a :b | (medianValuesDictionary at: a) < (medianValuesDictionary at: b) ]