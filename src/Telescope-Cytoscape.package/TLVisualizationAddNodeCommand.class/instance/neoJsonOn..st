json
neoJsonOn: writer
	| parameters |
	parameters := {(#group -> #nodes).
	(#data -> {(#id -> self nodeId)} asDictionary).
	(#position
		->
			{(#x -> self virtualNode x).
			(#y -> self virtualNode y)} asDictionary).
	(#style -> self style )} asDictionary.
	self virtualNode hasParent
		ifTrue: [ (parameters at: #data) at: #parent put: self virtualNode parent nodeId ].
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
			jsonMapWriter writeKey: #parameters value: parameters ]