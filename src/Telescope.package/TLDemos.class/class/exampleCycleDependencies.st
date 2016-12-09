demos
exampleCycleDependencies
	<script: 'self exampleCycleDependencies open'>

	"for FAMIXNamespaceGroup:
	 TLCycleDependencies new
		entities: self asOrderedCollection;
		property: #providerNamespaces;
		widthBlock: #numberOfClasses;
		heightBlock: [ :each | each numberOfMethods / 10 max: 5 ];
		open"

	"forces every class to be in cycle, maybe think on a better property"

	^ TLCycleDependencies new
		entities: TLDrawable withAllSubclasses;
		property: [ :each | (OrderedCollection with: each allSubclasses with: each superclass) flattened ];
		widthBlock: [ :each | each instVarNames size * 3 max: 5 ];
		heightBlock: [ :each | each numberOfMethods / 2 max: 5 ];
		yourself