instance-creation
newWithParameters: aParametersDictionary
	^ self new
		visuId: (aParametersDictionary at: #id);
		yourself