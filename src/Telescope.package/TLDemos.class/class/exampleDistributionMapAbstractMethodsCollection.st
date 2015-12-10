demos
exampleDistributionMapAbstractMethodsCollection
	<script: 'self exampleDistributionMapAbstractMethodsCollection open'>

	| visualization |
	visualization := TLDistributionMap new
		containerEntities: Collection withAllSubclasses;
		innerEntities: #methods;
		property: #isAbstract;
		yourself.
	^ visualization