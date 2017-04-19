demos
exampleDistributionMapAbstractMethodsCollection
	<script: 'self exampleDistributionMapAbstractMethodsCollection open'>
	<tlFilter: #layout>

	| visualization |
	visualization := TLDistributionMap new
		containerEntities: Collection withAllSubclasses;
		innerEntities: #methods;
		property: #isAbstract;
		yourself.
	^ visualization