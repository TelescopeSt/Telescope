as yet unclassified
neoJsonOn: writer
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			self class allInstVarNames
				do: [ :anAttribute | jsonMapWriter writeKey: anAttribute value: (self perform: anAttribute) ] ]