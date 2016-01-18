updating - group
updateGroup: aTLGroup
	aTLGroup isUpdateRequired
		ifTrue: [ 
			| graphicGroup order |
			graphicGroup := self elementFromTLDrawable: aTLGroup.	
			"cleaning phase"
			graphicGroup
				removeAllSuchThat: [ :aDrawableGraphic | 
					| tlDrawable |
					tlDrawable := self tlDrawableFromElement: aDrawableGraphic.
					((aTLGroup includes: tlDrawable) and: [tlDrawable isVisible])
						ifTrue: [ 
							"element is still existing so should not be removed"
							false ]
						ifFalse: [ 
							"If the drawable has no parent anymore or is hyde it should be removed from visualization"
							(tlDrawable parent isNil or: [tlDrawable isVisible not]) ifTrue: [ tlDrawable removeWith: self ].	"element does not exist anymore so should be removed"
							true ] ].	
			"adding phase"
			graphicGroup
				addAllFirstUnlessAlreadyPresent:
					(aTLGroup select: #isVisible
						thenCollect: [ :aTLDrawable | 
							[ 
							| element |
						element := self elementFromTLDrawable: aTLDrawable.
							aTLDrawable updateWith: self.
							element ]
								on: NotFound
								do: [ aTLDrawable generate ] ]).	
			"sorting phase"
			order := aTLGroup select: #isVisible
						thenCollect: [ :aTLDrawable | self elementFromTLDrawable: aTLDrawable ].
			graphicGroup sort: [ :a :b | (order indexOf: a) < (order indexOf: b) ].
			aTLGroup updateDone ]
		ifFalse:
			[aTLGroup isLayoutApplicationRequired ifTrue: ["In that case, layout application is required but not updating so we iterate over subelements" aTLGroup do: [ :aTLDrawable | aTLDrawable updateWith: self ] ]].
	aTLGroup isLayoutApplicationRequired
		ifFalse: [ ^ self ].
	aTLGroup layout ifNotNil: [ self applyLayoutOf: aTLGroup on: (self elementFromTLDrawable: aTLGroup) ].
	aTLGroup layoutApplicationDone