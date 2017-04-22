demos
exampleDistributionMapCycloComplexOfCollection
	<script: 'self exampleDistributionMapCycloComplexOfCollection open'>
	<tlFilter: #visuTemplate>

	| visualization |
	visualization := TLDistributionMap new
		containerEntities: Collection withAllSubclasses;
		innerEntities: #methods;
		property: #author;
		yourself.
	^ visualization