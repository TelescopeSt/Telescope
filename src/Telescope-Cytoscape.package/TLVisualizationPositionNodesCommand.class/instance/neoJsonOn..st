as yet unclassified
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
					(#animationDuration -> 1500).
					(#positions
						->
							(self nodes reject: #hasChildren
								thenCollect: [ :aNode | 
									aNode nodeId asString
										->
											{(#x -> aNode cytoscapePosition x).
											(#y -> aNode cytoscapePosition y)} asDictionary ]) asDictionary)} asDictionary ]