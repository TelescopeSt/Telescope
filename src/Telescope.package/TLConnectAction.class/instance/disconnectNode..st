action
disconnectNode: aNode
	(self connectionsByNode at: aNode) do: [ :aConnection | aConnection removed ].
	self connectionsByNode removeKey: aNode.
	aNode state at: self actionPropertySymbol put: false