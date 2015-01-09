updating - group
updateGroup: aTLGroup
	| rtGroup elementsToDelete |
	aTLGroup isUpdateRequired
		ifTrue: [ 
			rtGroup := self elementFromTLDrawable: aTLGroup.
			elementsToDelete := rtGroup copy.
			aTLGroup telescopeEntities
				do: [ :aTLDrawable | 
					[ 
					"No need to delete element if it is found from aTLDrawable"
					elementsToDelete remove: (self elementFromTLDrawable: aTLDrawable) ]
						on: NotFound
						do: [ 
							rtGroup
								add:
									([ self elementFromTLDrawable: aTLDrawable ]
										on: NotFound
										do: [ aTLDrawable generate ]) ].
					aTLDrawable updateWith: self ].
			rtGroup removeAll: elementsToDelete.
			elementsToDelete
				do: [ :el | 
					| aNode |
					aNode := self tlDrawableFromElement: el.	"If node is part of another parent there is no need to delete it"
					aNode parent ifNil: [ aNode removeWith: self ] ].
			aTLGroup updateDone ].
	aTLGroup isLayoutApplicationRequired
		ifFalse: [ ^ self ].
	aTLGroup layout ifNotNil: [ self applyLayoutOf: aTLGroup on: (self shapeByDrawable at: aTLGroup) ].
	aTLGroup layoutApplicationDone