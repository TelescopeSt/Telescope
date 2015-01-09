demos
exampleDistributionMapAbstractMethodsCollection
	"self exampleDistributionMapAbstractMethodsCollection"

	| visualization |
	visualization := TLDistributionMap new
		containerEntities: Collection withAllSubclasses;
		innerEntities: #methods;
		property: #isAbstract;
		yourself.
	visualization open.
	^ visualization