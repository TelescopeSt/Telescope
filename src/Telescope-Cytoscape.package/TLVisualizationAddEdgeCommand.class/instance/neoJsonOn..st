json
neoJsonOn: writer
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
					jsonMapWriter writeKey: #mouseOverInteraction value: self mouseOverInteraction.
			jsonMapWriter
				writeKey: #parameters
				value:
					{(#group -> #edges).
					(#data
						->
							{(#id -> self edgeId).
							(#source -> self fromNodeId).
							(#target -> self toNodeId)} asDictionary).
					(#style -> self style)} asDictionary ]