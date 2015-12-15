instance creation
newWithParameters: aParametersDictionary
	^ self new
		visuId: (aParametersDictionary at: #id);
		drawableId: (aParametersDictionary at: #drawableId) asNumber;
		kind: (aParametersDictionary at: #kind);
		yourself