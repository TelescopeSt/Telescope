demos
exampleUMLClassElement
	<script: 'self exampleUMLClassElement open'>
	<tlFilter: #visuTemplate>
	
	"for FAMIXTypeGroup:
	 TLUMLClassElement new
		entity: TLConnection;
		attributesBlock: #attributes;
		methodsBlock: #methods;
		open"
	
	| visualization |
	self flag: #clean.	"Broken https://github.com/TelescopeSt/Telescope/issues/33."
	visualization := TLUMLClassElement new
		entity: TLConnection;
		attributesBlock: #allInstVarNames;
		methodsBlock: #methods.
	^ visualization