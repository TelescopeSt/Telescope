demos
exampleDistributionMapAbstractMethodsCollection
	<script: 'self exampleDistributionMapAbstractMethodsCollection open'>
	<tlFilter: #visuTemplate>
	^ TLDistributionMap new
		containerEntities: TLDrawable withAllSubclasses;
		innerEntities: #methods;
		innerEntitiesPopupBlock: [ :method | method name asString ];
		property: #isAbstract;
		yourself