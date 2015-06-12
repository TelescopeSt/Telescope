actions
addedIn: aCanvas
	aCanvas addShape: self shape2.
	aCanvas addShape: self shape1.
	self shape1  translateBy: self offsets first.  "shape1 translateBy: offset1"
	self shape2 translateBy: self offsets second. "shape2 translateBy: offset2"