accessing
absolutePosition
	"A group can have a group or a node as parent. It's probably an error than we just add the absolute position."

	self flag: #thisIsAnError.	"If we add a group in a group in a group some layout will have incorrect positions."
	^ self hasParent
		ifTrue: [ self position + self parent absolutePosition ]
		ifFalse: [ self position ]