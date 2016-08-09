private
hierarchyHasChanged
	"If the hierarchy changed now we propagate it to parent"

	| changedBefore |
	changedBefore := self hierarchyChanged.
	self state at: #hierarchyChanged put: true.
	self isUpdateRequired: true.
	changedBefore
		ifFalse: [ self parent ifNotNil: [ self parent hierarchyHasChanged ] ]