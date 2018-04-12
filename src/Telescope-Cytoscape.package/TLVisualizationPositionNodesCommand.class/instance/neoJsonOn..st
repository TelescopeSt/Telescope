json
neoJsonOn: writer
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
			jsonMapWriter
				writeKey: #layout
				value:
					{(#name -> 'preset').
					(#animate -> true).
					(#animationDuration -> self animationDuration).
					(#positions
						->
							self allElementsPositions asDictionary)} asDictionary ]