action
disconnectNode: aNode
	(self connectionsByNode at: aNode) do: #removed.
	self connectionsByNode removeKey: aNode