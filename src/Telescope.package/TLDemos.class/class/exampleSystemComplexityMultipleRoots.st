demos
exampleSystemComplexityMultipleRoots
	"self exampleSystemComplexityMultipleRoots"
	
	"for FAMIXTypeGroup:
	 TLSystemComplexityMultipleRoots new
		roots: self asCollection;
		widthBlock: [ :each | each numberOfAttributes max: 5 ];
		heightBlock: [ :each | each numberOfMethods max: 5 ];
		backgroundColorBlock: #numberOfLinesOfCode;
		property: #directSubclasses;
		scopeBlock: [ :each | each entities asSet ];
		open."
	
	| visualization |
	visualization := TLSystemComplexityMultipleRoots new
		roots: Collection withAllSubclasses;
		widthBlock: [ :each | each numberOfVariables max: 5 ];
		heightBlock: [ :each | each numberOfMethods max: 5 ];
		backgroundColorBlock: #linesOfCode;
		property: #subclasses;
		scopeBlock: #yourself.
	visualization addInteraction: (TLNodeBasicInteraction popup: #yourself).
	visualization open.
	^ visualization