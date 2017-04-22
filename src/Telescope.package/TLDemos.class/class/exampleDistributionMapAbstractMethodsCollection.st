demos
exampleDistributionMapAbstractMethodsCollection
	<script: 'self exampleDistributionMapAbstractMethodsCollection open'>
	<tlFilter: #visuTemplate>
	| visualization |
	visualization := TLDistributionMap new
		containerEntities: TLDrawable withAllSubclasses;
		innerEntities: #methods;
		innerEntitiesPopupBlock: [ :method | method name asString ];
		property: #isAbstract;
		yourself.
	^ visualization