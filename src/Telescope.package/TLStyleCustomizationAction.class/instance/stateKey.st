action
stateKey
	self flag: #danger.	"Maybe this is not unique enought because we can have the same block for many interactions."
	^ #styleCustomized , self customizationBlock hash asString