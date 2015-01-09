accessing
itemBuilder
	^ itemBuilder ifNil: [ self defaultItemBuilder ]