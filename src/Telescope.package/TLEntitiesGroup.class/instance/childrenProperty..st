node - creation
childrenProperty: aValuableOrCollection
	"Ensure that we will not modify an upper level strategy"
	self flag: 'Maybe should be in the stylesheet'.
	^ self localNodeCreationStrategy compositeProperty: aValuableOrCollection