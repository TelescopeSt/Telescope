as yet unclassified
sort
	|  rest |
	copy do: [ :method |
		| messages |
		messages := method messages.
		messages := messages select: [ :m | methods includes: m ].
		messages do: [ :m | copy addIfNotPresent: m ]
		].
	
	rest := methods copyWithoutAll: copy.
	rest isEmpty ifTrue: [ ^copy ]
	