accessing
property: anObject
	property := anObject.
	self condition: [ :aNode | (self obtain: self property on: aNode entity) notEmpty ]