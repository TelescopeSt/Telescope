accessing
removeEntity: anObject
	| drawable |
	drawable := self nodeForEntity: anObject.
	self remove: drawable