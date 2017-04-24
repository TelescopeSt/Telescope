demos
exampleDistributionMapAuthors
	<script: 'self exampleDistributionMapAuthors open'>
	<tlFilter: #visuTemplate>
	^ TLDistributionMap new
		containerEntities: TLObject withAllSubclasses;
		innerEntities: #methods;
		innerEntitiesPopupBlock: [ :method | method author , ' wrote: ' , method name ];
		property: #author;
		yourself