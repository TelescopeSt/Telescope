children
childrenProperty: aBlockOrProperty
	self at: #childrenProperty put: aBlockOrProperty.
	"If the user set a childrenProperty he want to build composite"
	self nodeClass: (aBlockOrProperty ifNotNil: [ TLCompositeNode] ifNil: [TLSimpleNode])