generation - group
createGroup: aTLGroup with: aCollectionOfDrawableId
	"just have to return id"
	
	id := self generateDrawableId.
	
	self addCommand: (TLVisualizationAddGroupCommand new
		groupId: id;
		layout: aTLGroup layout;
		elementsIds: aCollectionOfDrawableId; 
		yourself).
	
	^ id