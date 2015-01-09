as yet unclassified
sort: aCollectionOfMethods entryPoint: model
	| selectors rest |
	selectors := methods collect: [ :m | m selector ].
	copy add: model.
	copy do: [ :method |
		| messages |
		messages := method messages.
		messages := messages select: [ :s | selectors includes: s ].
		messages do: [ :s | copy addIfNotPresent: (methods detect: [ :m | m selector = s ]) ]
		].
	
	rest := methods copyWithoutAll: copy.
	copy addAll: rest.