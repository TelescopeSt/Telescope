accessing
toggleFilter: aFilter
	(self filters includes: aFilter)
		ifTrue: [ self filters remove: aFilter ]
		ifFalse: [ self filters add: aFilter ]