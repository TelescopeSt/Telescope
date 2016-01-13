json
neoJsonOn: writer
	| parameters |
	parameters := {(#group -> #nodes).
	(#data -> {(#id -> self nodeId)} asDictionary).
	(#style -> self style)} asDictionary.
	self virtualNode hasParentNode
		ifTrue: [ (parameters at: #data) at: #parent put: self virtualNode parentNode nodeId ].
	self virtualNode hasChildren
		ifFalse: [ 
			parameters
				at: #position
				put:
					{(#x -> self virtualNode cytoscapePosition x).
					(#y -> self virtualNode cytoscapePosition y)} asDictionary ].
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
			jsonMapWriter writeKey: #mouseOverInteraction value: self mouseOverInteraction.
			jsonMapWriter writeKey: #parameters value: parameters ]