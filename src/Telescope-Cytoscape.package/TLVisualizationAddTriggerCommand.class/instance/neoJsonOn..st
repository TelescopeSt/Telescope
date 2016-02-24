json
neoJsonOn: writer
	| data |
	data := {(#id -> self triggerId)} asDictionary.
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			| position |
			position := self virtualTrigger cytoscapePosition value.
			jsonMapWriter writeKey: #group value: #nodes.
			jsonMapWriter writeKey: #data value: data.
			jsonMapWriter
				writeKey: #position
				value:
					{(#x -> position x).
					(#y -> position y)} asDictionary.
			jsonMapWriter writeKey: #mouseOverInteraction value: self mouseOverInteraction.
			jsonMapWriter writeKey: #style value: self style ]