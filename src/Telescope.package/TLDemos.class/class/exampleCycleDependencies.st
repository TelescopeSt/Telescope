demos
exampleCycleDependencies
	"to use with Moose Package collection"

	| tarjan cycleDependencies |
	tarjan := MalTarjan new.
	tarjan nodes: self.
	tarjan edges: self from: #yourself toAll: #providerNamespaces.
	tarjan run.
	
	cycleDependencies := TLCycleDependencies new packageEntities: self.
	cycleDependencies styleSheet
		width: #numberOfClasses;
		height: [ :each | each numberOfMethods / 10 max: 5 ];
		backgroundColor: [ :namespace | 
					(tarjan findNode: namespace) isInCycle
						ifTrue: [ Color red ]
						ifFalse: [ Color white ] ].
	cycleDependencies open