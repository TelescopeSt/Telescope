demos
exampleDistributionMapAuthorsOfCollection
	<script: 'self exampleDistributionMapAuthorsOfCollection open'>

	| visualization |
	visualization := TLDistributionMap new
		containerEntities: Collection withAllSubclasses;
		innerEntities: #authors;
		property: #yourself;
		yourself.
	^ visualization