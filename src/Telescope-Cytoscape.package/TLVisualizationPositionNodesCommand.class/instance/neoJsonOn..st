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
					(#positions
						->
							(self nodes
								collect: [ :aNode | 
									aNode nodeId asString
										->
											({#position
												->
													{(#x -> aNode x).
													(#y -> aNode y)} asDictionary}) asDictionary ]) asDictionary)} asDictionary ]