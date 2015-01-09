accessing
property: anObject
	property := anObject.
	self condition: [ :aDrawable | (property value: aDrawable entity) notEmpty ]