accessing
layout
	^ (self parent notNil and: [ self parent isNode ])
		ifTrue: [ self effectiveStyleSheet obtainValue: #layout forEntity: self parent entity inNode: self parent ]
		ifFalse: [ self effectiveStyleSheet layout ]