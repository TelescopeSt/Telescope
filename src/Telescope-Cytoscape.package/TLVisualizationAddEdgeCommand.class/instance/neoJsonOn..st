json
neoJsonOn: writer
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #group value: #edges.
			jsonMapWriter
				writeKey: #data
				value:
					{(#id -> self edgeId).
					(#source -> self fromNodeId).
					(#target -> self toNodeId)} asDictionary.
			jsonMapWriter writeKey: #mouseOverInteraction value: self mouseOverInteraction.
			jsonMapWriter writeKey: #style value: self style ]