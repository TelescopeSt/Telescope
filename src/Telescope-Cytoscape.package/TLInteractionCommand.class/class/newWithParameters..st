instance creation
newWithParameters: aParametersDictionary
	^ self new
		visuId: (aParametersDictionary at: #id);
		drawableId: (aParametersDictionary at: #drawableId);
		kind: (aParametersDictionary at: #kind);
		yourself