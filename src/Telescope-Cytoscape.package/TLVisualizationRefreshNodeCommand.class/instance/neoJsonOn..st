json
neoJsonOn: writer
	| data |
	data := {(#id -> self nodeId)} asDictionary.
	self virtualNode hasParentNode
		ifTrue: [ data at: #parent put: self virtualNode parentNode nodeId ].
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
			jsonMapWriter writeKey: #group value: #nodes.
			jsonMapWriter writeKey: #data value: data.
			self virtualNode hasChildren
				ifFalse: [ 
					jsonMapWriter
						writeKey: #position
						value:
							{(#x -> self virtualNode cytoscapePosition x).
							(#y -> self virtualNode cytoscapePosition y)} asDictionary ].
			jsonMapWriter writeKey: #mouseOverInteraction value: self mouseOverInteraction.
			jsonMapWriter writeKey: #dropInteraction value: self dropInteraction.
			self popUp ifNotNil: [ jsonMapWriter writeKey: #popUp value: self popUp ].
			jsonMapWriter writeKey: #style value: self style.
			self menu ifNotEmpty: [ jsonMapWriter writeKey: #menu value: self menu ] ]