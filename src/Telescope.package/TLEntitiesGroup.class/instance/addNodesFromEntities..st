adding
addNodesFromEntities: aGroupOfEntities
	^ aGroupOfEntities collect: [ :anEntity | self addNodeFromEntity: anEntity ] as: TLDrawableCollection 