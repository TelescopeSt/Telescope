not working demos
exampleNameCloud
	"self exampleNameCloud"
	
	self flag: 'Invalid demo; cannot run like this'.
		
	"for FAMIXNamespaceGroup:
	 TLNameCloud new
		entities: self;
		nameProperty: #name;
		open"
		
	TLNameCloud new
		entities: TLDrawable withAllSubclasses;
		nameProperty: #name;
		open