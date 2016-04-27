as yet unclassified
newWithParameters: aParametersDictionary
	^ (super newWithParameters: aParametersDictionary)
		entry: (aParametersDictionary at: #entry);
		yourself