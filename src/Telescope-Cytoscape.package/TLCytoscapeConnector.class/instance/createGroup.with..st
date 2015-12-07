generation - group
createGroup: aTLGroup with: aCollectionOfDrawableId
	"just have to return id"
	
	id := self generateDrawableId.
	
	self addCommand: (TLVisualizationAddGroupCommand new
		groupId: id;
		visuId: visuId;
		layout: aTLGroup layout forCytoscape;
		elementsIds: aCollectionOfDrawableId; 
		yourself).
	
	^ id