as yet unclassified
newWithParameters: aParametersDictionary withError: anError
	^ self new
		visuId: (aParametersDictionary at: #id);
		error: anError
		yourself