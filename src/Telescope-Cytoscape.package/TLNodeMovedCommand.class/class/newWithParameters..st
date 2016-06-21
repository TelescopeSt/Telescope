instance creation
newWithParameters: aParametersDictionary
	^ self new
		visuId: (aParametersDictionary at: #id);
		nodeId: (aParametersDictionary at: #nodeId);
		nodePosition: ((aParametersDictionary at: #position) at: #x) @ ((aParametersDictionary at: #position) at: #y);
		yourself