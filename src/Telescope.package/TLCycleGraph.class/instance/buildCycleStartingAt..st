as yet unclassified
buildCycleStartingAt: anObject
	| next nextRank currentRank |
	next := anObject perform: self nextProperty.
	currentRank := self rank at: anObject.
	next
		ifNotEmpty: [ 
			next
				do: [ :obj | 
					nextRank := currentRank + 1.
					self rank
						at: obj
						ifPresent: [ :r | nextRank := r ]
						ifAbsent: [ 
							self rank at: obj put: nextRank.
							self objectAdded at: obj put: false.
							self > nextRank addNodeFromEntity: obj.
							self > nextRank layout: (TLLinearLayout topToBottom gap: 30) ].
					self > currentRank connectInsideGroupEntity: anObject toEntity: obj FromAnotherGroup: self > nextRank ].
			self objectAdded at: anObject put: true.
			next
				do: [ :obj | 
					(self objectAdded at: obj)
						ifFalse: [ self buildCycleStartingAt: obj ] ] ]