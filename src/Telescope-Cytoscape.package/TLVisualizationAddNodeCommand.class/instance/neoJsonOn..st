as yet unclassified
neoJsonOn: writer
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
			jsonMapWriter
				writeKey: #parameters
				value:
					{(#group -> #nodes).
					(#data -> {(#id -> self nodeId)} asDictionary).
					(#position
						->
							{(#x -> self virtualNode x).
							(#y -> self virtualNode y)} asDictionary) .
					(#style -> self style)} asDictionary ]