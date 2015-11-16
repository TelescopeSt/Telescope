adding
addNodesFromEntities: aGroupOfEntities withStrategy: aTLNodeCreationStrategy
	^ (aGroupOfEntities collect: [ :anEntity | self addNodeFromEntity: anEntity withStrategy: aTLNodeCreationStrategy ]) as: TLDrawableCollection 