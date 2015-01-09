demos
exampleDistributionMapAuthorsOfCollection
	"self exampleDistributionMapAuthorsOfCollection"

	| visualization |
	visualization := TLDistributionMap new
		containerEntities: Collection withAllSubclasses;
		innerEntities: #authors;
		property: #yourself;
		yourself.
	visualization open.
	^ visualization