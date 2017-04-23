demos
exampleDistributionMapAuthors
	<script: 'self exampleDistributionMapAuthors open'>
	<tlFilter: #visuTemplate>
	| visualization |
	visualization := TLDistributionMap new
		containerEntities: TLObject withAllSubclasses;
		innerEntities: #methods;
		innerEntitiesPopupBlock: [ :method | method author , ' wrote: ' , method name ];
		property: #author;
		yourself.
	^ visualization