accessing
annotations

	^ ( FAMIXAnnotationTypeGroup 
		withAll: ( entityGroup flatCollectAsSet: #annotationTypes ))
		asOrderedCollection