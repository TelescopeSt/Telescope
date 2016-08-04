instance creation
newWithParameters: aParametersDictionary
	^ self new
		visuId: (aParametersDictionary at: #id);
		droppedNodeId: (aParametersDictionary at: #nodeId);
		targetNodeId: (aParametersDictionary at: #targetNode);
		yourself