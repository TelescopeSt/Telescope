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
							{(#x -> (1 to: 500) atRandom).
							(#y -> (1 to: 500) atRandom)} asDictionary) .
					(#style -> self style)} asDictionary ]