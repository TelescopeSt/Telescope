demos
exampleDistributionMapCycloComplexOfCollection
	<script: 'self exampleDistributionMapCycloComplexOfCollection open'>
	<tlFilter: #layout>

	| visualization |
	visualization := TLDistributionMap new
		containerEntities: Collection withAllSubclasses;
		innerEntities: #methods;
		property: #author;
		yourself.
	^ visualization