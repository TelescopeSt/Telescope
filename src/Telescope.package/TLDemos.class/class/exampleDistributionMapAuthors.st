demos
exampleDistributionMapAuthors
	<script: 'self exampleDistributionMapAuthorsOfCollection open'>
	<tlFilter: #visuTemplate>

	| visualization |
	visualization := TLDistributionMap new
		containerEntities: TLObject withAllSubclasses;
		innerEntities: #authors;
		property: #yourself;
		yourself.
	^ visualization