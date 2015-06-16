children
childrenProperty: aBlockOrProperty
	aBlockOrProperty
		ifNotNil: [ self at: #childrenProperty put: aBlockOrProperty ]
		ifNil: [ self attributes removeKey: #childrenProperty ifAbsent: [  ] ].	"If the user set a childrenProperty he want to build composite"
	self nodeClass: (aBlockOrProperty ifNotNil: [ TLCompositeNode ] ifNil: [ TLSimpleNode ])