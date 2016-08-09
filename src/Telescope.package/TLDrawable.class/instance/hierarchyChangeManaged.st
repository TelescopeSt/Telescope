private
hierarchyChangeManaged
	^ self state
		removeKey: #hierarchyChanged
		ifAbsent: [ 
			"do nothing"
			 ]