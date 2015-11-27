accessing
visuDivId
	visuDivId ifNil: [ visuDivId:= self class generateId ].
	^ visuDivId