as yet unclassified
generateId
	id ifNil: [ id := 0 ].
	^ (id := id + 1) asString