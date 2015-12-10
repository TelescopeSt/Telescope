demos
exampleUMLClassElement
	<script: 'self exampleUMLClassElement open'>
	
	"for FAMIXTypeGroup:
	 TLUMLClassElement new
		entity: TLConnection;
		attributesBlock: #attributes;
		methodsBlock: #methods;
		open"
	
	| visualization |
	visualization := TLUMLClassElement new
		entity: TLConnection;
		attributesBlock: #allInstVarNames;
		methodsBlock: #methods.
	^ visualization