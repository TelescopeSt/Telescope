accessing
childrenProperty: anObject
	childrenProperty := anObject.
	self flag: 'Here we should return the node creation strategy of the group but the problem is that nodeCreationStrategy is not necessarly setted before' "^ childrenGroup nodeCreationStrategy"