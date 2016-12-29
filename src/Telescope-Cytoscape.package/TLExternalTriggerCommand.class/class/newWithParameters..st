as yet unclassified
newWithParameters: aParametersDictionary
	^ self new
		visuId: (aParametersDictionary at: #id);
		triggerId: (aParametersDictionary at: #triggerId);
		yourself