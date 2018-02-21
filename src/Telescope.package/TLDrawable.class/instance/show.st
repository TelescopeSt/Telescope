initialization
show
	self isVisible ifTrue: [ ^ self ].
	
	self isVisible: true.
	"self generateWith: self generator"