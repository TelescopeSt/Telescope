as yet unclassified
newWithParameters: aParametersDictionary
	^ (super newWithParameters: aParametersDictionary)
		entry: (aParametersDictionary at: #entry);
		selection: (aParametersDictionary at: #selection);
		yourself