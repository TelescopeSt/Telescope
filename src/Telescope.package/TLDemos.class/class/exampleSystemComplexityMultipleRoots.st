demos
exampleSystemComplexityMultipleRoots
	<script: 'self exampleSystemComplexityMultipleRoots open'>
	<tlFilter: #visuTemplate>
	
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
	self flag: #clean.	"BROKEN FOR NOW."
	visualization := TLSystemComplexityMultipleRoots new
		roots: Collection withAllSubclasses;
		widthBlock: [ :each | each numberOfVariables max: 5 ];
		heightBlock: [ :each | each numberOfMethods max: 5 ];
		backgroundColorBlock: #linesOfCode;
		property: #subclasses;
		scopeBlock: #yourself.
	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization