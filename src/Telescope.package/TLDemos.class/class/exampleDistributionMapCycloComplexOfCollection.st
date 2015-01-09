demos
exampleDistributionMapCycloComplexOfCollection
	"self exampleDistributionMapCycloComplexOfCollection"

	| visualization |
	visualization := TLDistributionMap new
		containerEntities: Collection withAllSubclasses;
		innerEntities: #methods;
		property: #author;
		yourself.
	visualization open.
	^ visualization