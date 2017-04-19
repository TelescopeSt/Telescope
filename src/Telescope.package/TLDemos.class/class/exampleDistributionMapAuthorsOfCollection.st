demos
exampleDistributionMapAuthorsOfCollection
	<script: 'self exampleDistributionMapAuthorsOfCollection open'>
	<tlFilter: #layout>

	| visualization |
	visualization := TLDistributionMap new
		containerEntities: Collection withAllSubclasses;
		innerEntities: #authors;
		property: #yourself;
		yourself.
	^ visualization