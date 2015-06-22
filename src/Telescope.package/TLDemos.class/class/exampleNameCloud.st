demos
exampleNameCloud
	"self exampleNameCloud"
		
	"for FAMIXNamespaceGroup:
	 TLNameCloud new
		entities: self;
		nameProperty: #name;
		open"
		
	^ TLNameCloud new
		entities: TLDrawable withAllSubclasses;
		nameProperty: #name;
		open;
		yourself