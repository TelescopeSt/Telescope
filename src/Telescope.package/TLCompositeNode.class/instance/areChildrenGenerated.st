private
areChildrenGenerated
	^ self state at: #childrenGenerated ifAbsent: [ false ]