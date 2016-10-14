as yet unclassified
singleton
self flag:'revoir comment on implem un singleton... Je n aime pas creer des variables de classe'.
	^self allInstances
		ifEmpty:[self new ]
		ifNotEmpty:[self allInstances first]